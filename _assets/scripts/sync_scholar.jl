#!/usr/bin/env julia
# Interactive Google Scholar → site publications sync (does not auto-write).
#
# Usage (cd into _assets/scripts/ first — more reliable on Windows/OneDrive):
#   cd _assets/scripts
#   julia --project=. -e "using Pkg; Pkg.instantiate()"
#   julia --project=. sync_scholar.jl
#   julia --project=. sync_scholar.jl --min-year=2025
#   julia --project=. sync_scholar.jl --from=scholar.json
#   julia --project=. sync_scholar.jl --backend=serpapi   # needs SERPAPI_KEY
#
# Default fetch scrapes the public Scholar citations HTML (no API key).
# Optional: --from=FILE.json with [{title, authors, venue, year, link}, ...]
# Optional: --backend=serpapi with SERPAPI_KEY set.

using BibTeX
using Dates
using HTTP
using JSON3

const REPO_ROOT = normpath(joinpath(@__DIR__, "..", ".."))
const BIB_PATH  = joinpath(@__DIR__, "..", "julialab.bib")
const PUB_MD    = joinpath(REPO_ROOT, "publications.md")
const USER_ID   = "QVBIKh4AAAAJ"

const MATCH_SURE   = 0.92   # treat as already in bib
const MATCH_UNSURE = 0.72   # ask the user
const MATCH_DUP    = 0.82   # Scholar↔Scholar near-duplicate collapse

# ── CLI args ──────────────────────────────────────────────────────────────────

function parse_args(args)
    min_year = 2025
    from = nothing
    backend = "html"  # html | serpapi
    for a in args
        if startswith(a, "--min-year=")
            min_year = parse(Int, split(a, "="; limit=2)[2])
        elseif startswith(a, "--from=")
            from = split(a, "="; limit=2)[2]
        elseif startswith(a, "--backend=")
            backend = lowercase(split(a, "="; limit=2)[2])
            backend in ("html", "serpapi") || error("--backend must be html or serpapi")
        elseif a in ("-h", "--help")
            println("""
            sync_scholar.jl — find Scholar papers missing from julialab.bib

              --min-year=YYYY     only consider publications from this year on (default 2025)
              --backend=html      scrape Scholar HTML (default; no API key)
              --backend=serpapi   use SerpAPI (needs SERPAPI_KEY)
              --from=FILE.json    use a local JSON export instead of fetching
            """)
            exit(0)
        else
            error("Unknown argument: $a (try --help)")
        end
    end
    return (; min_year, from, backend)
end

# ── fuzzy title matching ───────────────────────────────────────────────────────

"""Normalize for comparison: case-fold, drop LaTeX/punctuation, collapse spaces."""
function normalize_title(t)
    s = String(t)
    s = replace(s, r"\\[a-zA-Z]+\*?" => " ")   # \emph, \textit, …
    s = replace(s, ['{', '}'] => "")
    s = lowercase(s)
    # Unify dashes/quotes then drop remaining punctuation (keep letters & digits).
    s = replace(s, r"[‐‑‒–—―−\-]" => " ")
    s = replace(s, ['\'', '`', '"', '\u2018', '\u2019', '\u201C', '\u201D'] => "")
    s = replace(s, r"[^\p{L}\p{N}\s]" => " ")   # commas, periods, colons, …
    s = replace(s, r"\s+" => " ")
    return strip(s)
end

"""Even stronger: ignore spacing too (so 'A, B' ≡ 'A B' ≡ 'AB' after punct strip)."""
compact_title(t) = replace(normalize_title(t), " " => "")

function token_jaccard(a::AbstractString, b::AbstractString)
    ta = Set(split(a))
    tb = Set(split(b))
    isempty(ta) && isempty(tb) && return 1.0
    (isempty(ta) || isempty(tb)) && return 0.0
    return length(intersect(ta, tb)) / length(union(ta, tb))
end

function levenshtein_sim(a::AbstractString, b::AbstractString)
    isempty(a) && isempty(b) && return 1.0
    (isempty(a) || isempty(b)) && return 0.0
    m, n = length(a), length(b)
    prev = collect(0:n)
    curr = similar(prev)
    for (i, ca) in enumerate(a)
        curr[1] = i
        for (j, cb) in enumerate(b)
            cost = ca == cb ? 0 : 1
            curr[j + 1] = min(prev[j + 1] + 1, curr[j] + 1, prev[j] + cost)
        end
        prev, curr = curr, prev
    end
    return 1.0 - prev[n + 1] / max(m, n)
end

function title_similarity(a, b)
    na, nb = normalize_title(a), normalize_title(b)
    (na == nb || compact_title(a) == compact_title(b)) && return 1.0
    return 0.55 * token_jaccard(na, nb) + 0.45 * levenshtein_sim(na, nb)
end

const TITLE_STOP = Set(["a","an","the","of","and","for","in","on","with","to","via",
                        "from","by","using","into","over","under","at","as"])

function significant_tokens(title)
    toks = String[]
    for w in split(normalize_title(title))
        (w in TITLE_STOP || length(w) < 3) && continue
        push!(toks, w)
    end
    return toks
end

"""True when two Scholar titles are variants of the same work (wording tweaks, etc.)."""
function titles_near_duplicate(a, b)
    s = title_similarity(a, b)
    s >= MATCH_DUP && return true
    ta, tb = Set(significant_tokens(a)), Set(significant_tokens(b))
    (isempty(ta) || isempty(tb)) && return false
    shared = length(intersect(ta, tb))
    containment = shared / min(length(ta), length(tb))
    # e.g. "Hierarchical Precision and Recursion …" vs "Hierarchical Recursive Precision …"
    return containment >= 0.85 && s >= 0.70
end

"""Prefer the richer Scholar row when collapsing near-duplicates."""
function prefer_paper(a, b)
    score(p) = (length(p.title), length(String(get(p, :authors, ""))),
                length(String(get(p, :venue, ""))), !isempty(String(get(p, :doi, ""))))
    return score(a) >= score(b) ? a : b
end

"""Collapse near-duplicate Scholar hits before bib comparison / the to-add list."""
function dedupe_scholar_papers(papers)
    kept = NamedTuple[]
    # kept-title => other Scholar title variants that were merged away
    aliases = Dict{String,Vector{String}}()
    for p in papers
        dup_idx = findfirst(k -> titles_near_duplicate(k.title, p.title), kept)
        if dup_idx === nothing
            push!(kept, p)
            continue
        end
        old = kept[dup_idx]
        winner = prefer_paper(old, p)
        loser = winner === old ? p : old
        kept[dup_idx] = winner
        bucket = get!(aliases, winner.title, String[])
        if old.title != winner.title
            # previously kept title is now an alias; migrate its bucket
            old_aliases = get(aliases, old.title, String[])
            delete!(aliases, old.title)
            for t in old_aliases
                t != winner.title && !(t in bucket) && push!(bucket, t)
            end
            old.title != winner.title && !(old.title in bucket) && push!(bucket, old.title)
        end
        if loser.title != winner.title && !(loser.title in bucket)
            push!(bucket, loser.title)
        end
        aliases[winner.title] = bucket
    end
    n_drop = length(papers) - length(kept)
    return kept, aliases, n_drop
end

function best_bib_match(title, bib_titles::AbstractDict)
    best_key, best_score, best_norm = "", 0.0, ""
    nt = normalize_title(title)
    ct = replace(nt, " " => "")
    # Exact normalized / compact hit first (case & punctuation independent).
    if haskey(bib_titles, nt)
        return bib_titles[nt], 1.0, nt
    end
    for (norm, key) in bib_titles
        if replace(norm, " " => "") == ct
            return key, 1.0, norm
        end
    end
    for (norm, key) in bib_titles
        # Wording variants ("Precision and Recursion" vs "Recursive Precision")
        if titles_near_duplicate(title, norm)
            return key, 1.0, norm
        end
        s = title_similarity(title, norm)
        if s > best_score
            best_score, best_key, best_norm = s, key, norm
        end
    end
    return best_key, best_score, best_norm
end

# ── I/O helpers ───────────────────────────────────────────────────────────────

prompt(msg; default="") = begin
    if isempty(default)
        print(msg, " ")
    else
        print(msg, " [", default, "] ")
    end
    flush(stdout)
    line = readline(stdin)
    return isempty(strip(line)) ? default : strip(line)
end

function prompt_choice(msg, choices::Vector{String}; default=first(choices))
    opts = join(choices, "/")
    while true
        ans = lowercase(prompt("$msg ($opts)"; default=default))
        ans in choices && return ans
        println("  Please enter one of: $opts")
    end
end

yesno(msg; default="n") = prompt_choice(msg, ["y", "n"]; default=default) == "y"

# ── load local bib ────────────────────────────────────────────────────────────

function load_bib(path)
    _, refs = parse_bibtex(read(path, String))
    titles = Dict{String,String}()  # normalized title => key
    originals = Dict{String,String}()  # key => original bib title (for display)
    for (key, infos) in refs
        t = get(infos, "title", "")
        isempty(t) && continue
        titles[normalize_title(t)] = key
        originals[key] = t
    end
    return refs, titles, originals
end

function selected_keys_in_md(path)
    text = read(path, String)
    m = match(r"\{\{\s*show_refs\s+(.*?)\}\}"s, text)
    m === nothing && return Set{String}()
    keys = Set{String}()
    for line in split(m.captures[1], '\n')
        s = strip(replace(line, r"<!--.*?-->" => ""))
        isempty(s) && continue
        push!(keys, s)
    end
    return keys
end

# ── Scholar fetch ─────────────────────────────────────────────────────────────

const SCHOLAR_HEADERS = Dict(
    "User-Agent" =>
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 " *
        "(KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
    "Accept-Language" => "en-US,en;q=0.9",
)

html_unescape(s) = replace(s,
    "&amp;" => "&", "&lt;" => "<", "&gt;" => ">",
    "&quot;" => "\"", "&#39;" => "'", "&nbsp;" => " ")

const DOI_RE = r"10\.\d{4,9}/[-._;()/:A-Za-z0-9]+"

clean_doi(s) = begin
    m = match(DOI_RE, String(s))
    m === nothing ? "" : rstrip(m.match, ['.', ',', ';', ')', ']'])
end

function absolute_scholar_url(href)
    href = html_unescape(href)
    return startswith(href, "http") ? href : "https://scholar.google.com" * href
end

function http_get_body(url; retries=2)
    for attempt in 1:(retries + 1)
        r = HTTP.get(url; headers=SCHOLAR_HEADERS, status_exception=false)
        if r.status == 200
            body = String(r.body)
            if occursin("unusual traffic", lowercase(body)) || occursin("gs_captcha", body)
                error("Scholar captcha/block while fetching details. Wait and retry.")
            end
            return body
        end
        attempt <= retries && sleep(1.5 * attempt)
    end
    return ""
end

function extract_dois_from_html(html)
    unique(String[clean_doi(m.match) for m in eachmatch(DOI_RE, html) if !isempty(clean_doi(m.match))])
end

function published_link_from_citation_html(html)
    m = match(r"""class="gsc_oci_title_link"[^>]*href="([^"]+)""" , html)
    m === nothing && return ""
    url = html_unescape(m.captures[1])
    occursin("scholar.google.", url) && return ""
    return url
end

function cluster_urls_from_citation_html(html)
    urls = String[]
    for m in eachmatch(r"""href="([^"]*cluster=\d+[^"]*)""" , html)
        u = absolute_scholar_url(m.captures[1])
        # skip "I'm Feeling Lucky" direct jump
        occursin("btnI=1", u) && continue
        push!(urls, u)
    end
    return unique(urls)
end

function arxiv_url_from_text(text)
    m = match(r"(?i)arxiv(?:\.org/(?:abs|pdf)/|:)\s*([0-9]{4}\.[0-9]{4,5}(?:v\d+)?)", text)
    m === nothing && return ""
    return "https://arxiv.org/abs/$(m.captures[1])"
end

function crossref_lookup(title)
    q = HTTP.escapeuri(title)
    url = "https://api.crossref.org/works?query.bibliographic=$q&rows=5"
    headers = Dict("User-Agent" => "JuliaLabSiteSync/1.0 (mailto:noreply@example.com)")
    local data
    try
        data = JSON3.read(String(HTTP.get(url; headers).body))
    catch
        return ("", "")
    end
    items = get(get(data, :message, Dict()), :items, [])
    best_doi, best_url, best_score = "", "", 0.0
    for item in items
        titles = get(item, :title, [])
        isempty(titles) && continue
        sim = title_similarity(title, String(titles[1]))
        sim < 0.90 && continue
        doi = clean_doi(string(get(item, :DOI, "")))
        link = string(get(item, :URL, ""))
        isempty(link) && !isempty(doi) && (link = "https://doi.org/$doi")
        if sim > best_score
            best_score, best_doi, best_url = sim, doi, link
        end
    end
    return (best_doi, best_url)
end

"""Fetch published URL + DOI from the Scholar citation page, versions, then Crossref."""
function enrich_paper(p)
    scholar_url = get(p, :scholar_url, get(p, :link, ""))
    doi = String(get(p, :doi, ""))
    published = String(get(p, :link, ""))
    # If link is still a Scholar citations URL, treat it as scholar_url only.
    if occursin("scholar.google.", published) && occursin("view_citation", published)
        scholar_url = published
        published = ""
    elseif occursin("scholar.google.", published)
        published = ""
    end

    if !isempty(scholar_url) && occursin("scholar.google.", scholar_url)
        print("  Looking up published link/DOI on Scholar … ")
        flush(stdout)
        html = http_get_body(scholar_url)
        if !isempty(html)
            pub = published_link_from_citation_html(html)
            isempty(published) && !isempty(pub) && (published = pub)
            dois = extract_dois_from_html(html)
            isempty(doi) && !isempty(dois) && (doi = first(dois))

            # Follow a versions/cluster page if still no DOI
            if isempty(doi)
                for cu in Iterators.take(cluster_urls_from_citation_html(html), 1)
                    sleep(0.8)
                    vhtml = http_get_body(cu)
                    vdois = extract_dois_from_html(vhtml)
                    if !isempty(vdois)
                        doi = first(vdois)
                    end
                    if isempty(published)
                        for m in eachmatch(r"""href="(https?://[^"]+)""" , vhtml)
                            u = html_unescape(m.captures[1])
                            occursin("scholar.google.", u) && continue
                            if occursin(r"(?i)doi\.org|ieee\.org|acm\.org|springer|nature\.com|sciencedirect|wiley|arxiv\.org|openreview\.net|zenodo\.org|siam\.org", u)
                                published = u
                                break
                            end
                        end
                    end
                end
            end
            println("done")
        else
            println("failed")
        end
        sleep(0.6)
    end

    # arXiv fallback from venue text
    if isempty(published)
        published = arxiv_url_from_text(p.venue * " " * p.title)
    end

    # Crossref for DOI / canonical URL
    if isempty(doi) || isempty(published) || occursin("scholar.google.", published)
        print("  Looking up Crossref … ")
        flush(stdout)
        cr_doi, cr_url = crossref_lookup(p.title)
        println(isempty(cr_doi) && isempty(cr_url) ? "no hit" : "hit")
        isempty(doi) && !isempty(cr_doi) && (doi = cr_doi)
        if (isempty(published) || occursin("scholar.google.", published)) && !isempty(cr_url)
            published = cr_url
        end
    end

    # Prefer doi.org link when we have a DOI but only a weak URL
    if !isempty(doi) && (isempty(published) || occursin("scholar.google.", published))
        published = "https://doi.org/$doi"
    end

    # Last resort: keep Scholar citation page rather than empty
    isempty(published) && (published = scholar_url)

    return (; title=p.title, authors=p.authors, venue=p.venue, year=p.year,
              scholar_url, link=published, doi)
end

function parse_scholar_html_page(html::AbstractString)
    papers = NamedTuple[]
    row_re = r"""<tr class="gsc_a_tr">(.*?)</tr>"""s
    for rm in eachmatch(row_re, html)
        row = rm.captures[1]
        tm = match(r"""<a href="([^"]*)" class="gsc_a_at">([^<]+)</a>""", row)
        tm === nothing && continue
        href  = html_unescape(tm.captures[1])
        title = strip(html_unescape(tm.captures[2]))
        grays = [strip(html_unescape(m.captures[1]))
                 for m in eachmatch(r"""<div class="gs_gray">(.*?)</div>"""s, row)]
        # strip nested spans from venue line
        grays = [replace(g, r"<[^>]+>" => "") for g in grays]
        authors = length(grays) >= 1 ? grays[1] : ""
        venue   = length(grays) >= 2 ? replace(grays[2], r",\s*\d{4}\s*$" => "") : ""
        ym = match(r"""class="gsc_a_y"><span[^>]*>(\d{4})</span>""", row)
        year = ym === nothing ? nothing : tryparse(Int, ym.captures[1])
        year === nothing && continue
        scholar_url = absolute_scholar_url(href)
        push!(papers, (; title, authors, venue, year, scholar_url, link="", doi=""))
    end
    return papers
end

function fetch_scholar_html(user_id; min_year, pagesize=100)
    papers = NamedTuple[]
    cstart = 0
    while true
        url = "https://scholar.google.com/citations?hl=en&user=$(HTTP.escapeuri(user_id))" *
              "&view_op=list_works&sortby=pubdate&cstart=$cstart&pagesize=$pagesize"
        r = HTTP.get(url; headers=SCHOLAR_HEADERS, status_exception=false)
        r.status != 200 && error("Scholar HTTP $(r.status). Try again later, or use --from=FILE.json / --backend=serpapi.")
        body = String(r.body)
        if occursin("unusual traffic", lowercase(body)) || occursin("captcha", lowercase(body))
            error("Scholar returned a captcha/block page. Wait and retry, or use --from=FILE.json / --backend=serpapi.")
        end
        page = parse_scholar_html_page(body)
        isempty(page) && break
        stop_early = false
        for p in page
            if p.year < min_year
                stop_early = true
                break
            end
            push!(papers, p)
        end
        stop_early && break
        length(page) < pagesize && break
        cstart += pagesize
        sleep(1.0)  # be polite between pages
    end
    return papers
end

function fetch_scholar_serpapi(user_id; min_year)
    key = get(ENV, "SERPAPI_KEY", "")
    isempty(key) && error("SERPAPI_KEY not set. Use default --backend=html, or pass --from=FILE.json")
    papers = NamedTuple[]
    start = 0
    while true
        url = "https://serpapi.com/search.json?engine=google_scholar_author" *
              "&author_id=$(HTTP.escapeuri(user_id))&hl=en&sort=pubdate" *
              "&start=$start&api_key=$(HTTP.escapeuri(key))"
        data = JSON3.read(String(HTTP.get(url).body))
        arts = get(data, :articles, [])
        isempty(arts) && break
        stop_early = false
        for a in arts
            y = tryparse(Int, string(get(a, :year, "")))
            y === nothing && continue
            if y < min_year
                stop_early = true
                break
            end
            link = String(get(a, :link, ""))
            push!(papers, (
                title   = String(a.title),
                authors = String(get(a, :authors, "")),
                venue   = String(get(a, :publication, "")),
                year    = y,
                scholar_url = link,
                link = "",
                doi = "",
            ))
        end
        stop_early && break
        start += length(arts)
        length(arts) < 20 && break
    end
    return papers
end

function load_scholar_json(path; min_year)
    data = JSON3.read(read(path, String))
    papers = NamedTuple[]
    for a in data
        y = Int(a.year)
        y < min_year && continue
        push!(papers, (
            title   = String(a.title),
            authors = String(get(a, :authors, "")),
            venue   = String(get(a, :venue, get(a, :publication, ""))),
            year    = y,
            scholar_url = String(get(a, :scholar_url, get(a, :link, ""))),
            link    = String(get(a, :published_url, "")),
            doi     = String(get(a, :doi, "")),
        ))
    end
    return papers
end

# ── classify papers ───────────────────────────────────────────────────────────

Base.@kwdef struct Candidate
    paper
    status::Symbol          # :missing | :uncertain
    match_key::String = ""
    match_score::Float64 = 0.0
    match_title::String = ""
end

function classify(papers, bib_titles, bib_originals=Dict{String,String}())
    missing = Candidate[]
    present = 0
    for p in papers
        key, score, norm = best_bib_match(p.title, bib_titles)
        display_title = get(bib_originals, key, norm)
        if score >= MATCH_SURE
            present += 1
        elseif score >= MATCH_UNSURE
            push!(missing, Candidate(paper=p, status=:uncertain,
                                     match_key=key, match_score=score,
                                     match_title=display_title))
        else
            push!(missing, Candidate(paper=p, status=:missing,
                                     match_key=key, match_score=score,
                                     match_title=display_title))
        end
    end
    return present, missing
end

function resolve_uncertain!(cands::Vector{Candidate})
    out = Candidate[]
    uncertain = filter(c -> c.status == :uncertain, cands)
    sure_missing = filter(c -> c.status == :missing, cands)
    append!(out, sure_missing)
    isempty(uncertain) || begin
        println("\n── Uncertain matches (fuzzy) ──")
        println("Confirm whether each Scholar hit is already in the bib.\n")
        for (i, c) in enumerate(uncertain)
            p = c.paper
            println("[$i/$(length(uncertain))] Scholar ($(p.year)):")
            println("    $(p.title)")
            println("  Closest bib entry ($(round(c.match_score; digits=3))):")
            println("    key: $(c.match_key)")
            println("    title: $(c.match_title)")
            same = yesno("  Same paper (already included)?"; default="y")
            if !same
                push!(out, Candidate(paper=p, status=:missing,
                                     match_key=c.match_key, match_score=c.match_score,
                                     match_title=c.match_title))
            end
            println()
        end
    end
    return dedupe_candidates(out)
end

"""Collapse near-duplicate candidates in the to-add list."""
function dedupe_candidates(cands::Vector{Candidate})
    isempty(cands) && return cands
    papers, _, n_drop = dedupe_scholar_papers([c.paper for c in cands])
    n_drop == 0 && return cands
    out = Candidate[]
    used = falses(length(cands))
    for p in papers
        idx = findfirst(i -> !used[i] && titles_near_duplicate(cands[i].paper.title, p.title),
                        eachindex(cands))
        idx === nothing && continue
        used[idx] = true
        c = cands[idx]
        push!(out, Candidate(paper=p, status=:missing, match_key=c.match_key,
                             match_score=c.match_score, match_title=c.match_title))
    end
    println("Removed $n_drop near-duplicate title(s) from the to-add list")
    return out
end

# ── build / write entries (only after explicit yes) ───────────────────────────

function suggest_key(title, year)
    stop = Set(["a","an","the","of","and","for","in","on","with","to","via","from","by"])
    words = split(lowercase(replace(title, r"[^\w\s]" => "")))
    words = filter(w -> !(w in stop) && !isempty(w), words)
    taken = String[]
    for w in words
        push!(taken, w)
        length(taken) == 3 && break
    end
    stem = join(taken, "_")
    isempty(stem) && (stem = "paper")
    return "$(stem)_$(year)"
end

function unique_key(base, refs)
    key = base
    n = 2
    while haskey(refs, key)
        key = "$(base)_$n"
        n += 1
    end
    return key
end

function authors_to_bib(authors_str)
    # "A B, C D" → "A B and C D" (user can edit interactively)
    parts = strip.(split(authors_str, r"\s*,\s*|\s+and\s+"i))
    return join(filter(!isempty, parts), " and ")
end

function format_bib_entry(key, typ, title, author, journal, year, doi, url)
    """
    @$typ{$key,
      title={$title},
      author={$author},
      journal={$journal},
      year={$year},
      doi={$doi},
      url={$url},
    }
    """
end

function regex_escape(s::AbstractString)
    # Julia has no Regex.escape; citation keys are usually [A-Za-z0-9_], but escape anyway.
    return replace(String(s), r"([\\.^$|?*+()\[\]{}])" => s"\\\1")
end

function insert_key_into_md(text, key, year)
    occursin(Regex("\\b$(regex_escape(key))\\b"), text) && return text, false
    marker = "    <!-- $year -->"
    if occursin(marker, text)
        return replace(text, marker => marker * "\n    $key"; count=1), true
    end
    # Insert a new year block before the first older <!-- YYYY --> inside show_refs
    m = match(r"(\{\{\s*show_refs\s*\n)", text)
    if m !== nothing
        insertion = m.captures[1] * "    <!-- $year -->\n    $key\n\n"
        return replace(text, m.match => insertion; count=1), true
    end
    return text, false
end

function collect_entry_fields(p, refs)
    println("\nEnter BibTeX fields (press Enter to keep the default).\n")
    typ = prompt("  entry type (@article/@inproceedings/@misc/...)"; default="inproceedings")
    typ = lstrip(typ, '@')
    key = unique_key(suggest_key(p.title, p.year), refs)
    key = prompt("  citation key"; default=key)
    while haskey(refs, key)
        println("  Key '$key' already exists.")
        key = prompt("  citation key"; default=unique_key(key, refs))
    end
    title   = prompt("  title"; default=p.title)
    author  = prompt("  author (BibTeX 'and'-separated)"; default=authors_to_bib(p.authors))
    journal = prompt("  journal / venue"; default=p.venue)
    year    = prompt("  year"; default=string(p.year))
    doi_default = String(get(p, :doi, ""))
    url_default = String(get(p, :link, ""))
    if isempty(url_default) || occursin("scholar.google.", url_default)
        url_default = !isempty(doi_default) ? "https://doi.org/$doi_default" : String(get(p, :scholar_url, ""))
    end
    doi     = prompt("  doi"; default=doi_default)
    url     = prompt("  url"; default=url_default)
    entry = format_bib_entry(key, typ, title, author, journal, year, doi, url)
    println("\n── Proposed entry ──")
    println(entry)
    return key, year, entry
end

function append_bib!(path, entry)
    open(path, "a") do io
        write(io, "\n", strip(entry), "\n")
    end
end

function maybe_add_to_selected(key, year)
    if !yesno("Also add '$key' to the selected list in publications.md?"; default="y")
        return false
    end
    text = read(PUB_MD, String)
    new_text, ok = insert_key_into_md(text, key, parse(Int, string(year)))
    if !ok
        println("  Could not find insertion point in publications.md — add the key manually.")
        return false
    end
    write(PUB_MD, new_text)
    println("  Updated publications.md")
    return true
end

function review_and_add!(candidates, refs)
    isempty(candidates) && (println("\nNothing missing. Done."); return)

    println("\n══ Non-included works ($(length(candidates))) ══")
    for (i, c) in enumerate(candidates)
        p = c.paper
        hint = c.match_score > 0 ?
            "  (closest bib: $(c.match_key) @ $(round(c.match_score; digits=2)))" : ""
        println("  $i. [$(p.year)] $(p.title)$hint")
    end
    println()
    println("For each paper: [a]dd  [s]kip  [q]uit")
    println("Nothing is written until you choose add and confirm.\n")

    for (i, c) in enumerate(candidates)
        p = c.paper
        println("── [$i/$(length(candidates))] $(p.year) ──")
        println("  Title:   $(p.title)")
        println("  Authors: $(p.authors)")
        println("  Venue:   $(p.venue)")
        println("  Scholar: $(get(p, :scholar_url, p.link))")
        if c.match_score >= MATCH_UNSURE
            println("  Note: closest existing title score=$(round(c.match_score; digits=3)) key=$(c.match_key)")
        end

        choice = prompt_choice("Action", ["a", "s", "q"]; default="s")
        if choice == "q"
            println("Stopping.")
            break
        elseif choice == "s"
            println("Skipped.\n")
            continue
        end

        # choice == "a" — resolve published URL + DOI before prompting for fields
        p = enrich_paper(p)
        println("  Published: $(p.link)")
        println("  DOI:       $(isempty(p.doi) ? "(none found)" : p.doi)")
        key, year, entry = collect_entry_fields(p, refs)
        if !yesno("Write this entry to _assets/julialab.bib?"; default="n")
            println("Not written.\n")
            continue
        end
        append_bib!(BIB_PATH, entry)
        refs[key] = Dict("title" => p.title, "year" => string(year))  # track session
        println("  Appended to julialab.bib")
        maybe_add_to_selected(key, year)
        println()
    end
end

# ── main ──────────────────────────────────────────────────────────────────────

function main(args=ARGS)
    opts = parse_args(args)
    println("Repo:      $REPO_ROOT")
    println("Bib:       $BIB_PATH")
    println("Min year:  $(opts.min_year)")
    println()

    isfile(BIB_PATH) || error("Missing bib: $BIB_PATH")
    refs, bib_titles, bib_originals = load_bib(BIB_PATH)
    println("Loaded $(length(refs)) bib entries.")

    papers = if opts.from !== nothing
        println("Loading Scholar data from $(opts.from) …")
        load_scholar_json(opts.from; min_year=opts.min_year)
    elseif opts.backend == "serpapi"
        println("Fetching Google Scholar (user=$USER_ID) via SerpAPI …")
        fetch_scholar_serpapi(USER_ID; min_year=opts.min_year)
    else
        println("Fetching Google Scholar (user=$USER_ID) via HTML …")
        fetch_scholar_html(USER_ID; min_year=opts.min_year)
    end
    println("Scholar papers ≥$(opts.min_year): $(length(papers))")

    papers, aliases, n_dup = dedupe_scholar_papers(papers)
    if n_dup > 0
        println("Collapsed $n_dup near-duplicate Scholar title(s) → $(length(papers)) unique")
        for (kept_title, al) in sort(collect(aliases); by=first)
            println("  kept: $kept_title")
            for t in al
                println("    also listed as: $t")
            end
        end
    end

    present, cands = classify(papers, bib_titles, bib_originals)
    println("Clearly already in bib: $present")
    println("Uncertain fuzzy hits:   $(count(c -> c.status == :uncertain, cands))")
    println("Likely missing:         $(count(c -> c.status == :missing, cands))")

    missing = resolve_uncertain!(cands)
    review_and_add!(missing, refs)
    println("Done.")
end

abspath(PROGRAM_FILE) == abspath(@__FILE__) && main()
