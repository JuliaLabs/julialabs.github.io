using BibTeX, Dates, DelimitedFiles

function ref_item(ref, infos)
    io = IOBuffer()
    authors_aux = strip.(split(infos["author"], " and "))
    m = size(authors_aux)[1]
    authors = ""
    for j in 1:m
        a = authors_aux[j]
        fullname = reverse(strip.(split(a, ",")))
        n = size(fullname)[1]
        for i in 1:n-1
            authors *= fullname[i]*" "
        end
        authors *= fullname[n]
        if j == m
            authors *= ". "
        else
            authors *= ", "
        end
    end
    title = replace(infos["title"], r"\\[a-zA-Z]+" => "", r"\{|\}" => "")
    title = strip(replace(title, r"\s{2,}" => " "))
    write(io, """<li class="publication-item" id=\"#$ref\">""")
    if haskey(infos, "url")
        url = replace(infos["url"], " " => "")
        write(io, """<a href="$url" class="publication-link">""")
        write(io, """$(title)""")
        write(io, "  </a><br>")
    else
        write(io, """$title<br>""")
    end
    write(io, """$authors<br>""")
    if haskey(infos, "journal")
        write(io, """$(infos["journal"]) ($(infos["year"])). """)
    elseif haskey(infos, "publisher")
        write(io, """$(infos["publisher"]) ($(infos["year"])). """)
    else
        write(io, """($(infos["year"])). """)
    end
    if haskey(infos, "doi")
        write(io, """DOI:$(infos["doi"]). """)
    end
    write(io, "</li>")
    return String(take!(io))
end


function hfun_show_refs(refs)
    _, allrefs = parse_bibtex(read(joinpath("_assets", "julialab.bib"), String))
    valid = sort([(ref, allrefs[ref]) for ref in refs if haskey(allrefs, ref)],
                 by = x -> get(x[2], "year", ""), rev = true)
    years = unique([get(infos, "year", "") for (_, infos) in valid])
    show_year_headings = length(years) > 1
    out = IOBuffer()
    current_year = ""
    in_list = false
    for (ref, infos) in valid
        year = get(infos, "year", "")
        if show_year_headings && year != current_year
            in_list && write(out, "</ul>")
            current_year = year
            write(out, """<div class="pub-year-heading"><h2>$year</h2></div>""")
            write(out, """<ul class="publication-list">""")
            in_list = true
        elseif !in_list
            write(out, """<ul class="publication-list">""")
            in_list = true
        end
        write(out, ref_item(ref, infos))
    end
    in_list && write(out, "</ul>")
    return String(take!(out))
end

function hfun_show_news_year()
    yr_raw = locvar(:page_year)
    isnothing(yr_raw) && return ""
    yr = string(yr_raw)

    news = readdlm(joinpath("_assets", "news.csv"), ',', skipstart=1)

    esc(s) = replace(string(s),
        "&" => "&amp;", "<" => "&lt;", ">" => "&gt;",
        "\"" => "&quot;", "'" => "&#39;")

    io = IOBuffer()
    write(io, """<div class="news-list">""")
    first_entry = true
    for row in eachrow(news)
        date_str = strip(string(row[1]))
        title    = strip(string(row[2]))
        link     = strip(string(row[3]))
        isempty(date_str) && continue
        parsed   = Date(date_str, dateformat"m/d/y")
        string(year(parsed)) == yr || continue
        iso      = Dates.format(parsed, dateformat"yyyy-mm-dd")
        disp     = Dates.format(parsed, dateformat"U d, yyyy")
        mon      = monthabbr(parsed)
        dy       = string(day(parsed))
        write(io, """<article class="news-entry">""")
        write(io, """<time class="news-date" datetime="$(esc(iso))" aria-label="$(esc(disp))">""")
        write(io, """<span class="news-date-month">$(esc(mon))</span>""")
        write(io, """<span class="news-date-day">$(esc(dy))</span>""")
        write(io, """</time><div class="news-entry-body"><p class="news-entry-title">""")
        if isempty(link)
            write(io, esc(title))
        else
            write(io, """<a href="$(esc(link))">$(esc(title))</a>""")
        end
        write(io, """</p></div></article>""")
        first_entry = false
    end
    first_entry && write(io, """<p>No news entries for $yr.</p>""")
    write(io, """</div>""")
    return String(take!(io))
end

function hfun_pub_years_nav_html()
    _, allrefs = parse_bibtex(read(joinpath("_assets", "julialab.bib"), String))
    years = sort(unique([get(infos, "year", "") for (_, infos) in allrefs
                         if get(infos, "year", "") >= "2016"]), rev=true)
    return """<nav class="news-years-nav" aria-label="Publications by year">""" *
        join(["""<a href="/publications/$yr/" class="news-year-pill">$yr</a>""" for yr in years], "\n") *
        """</nav>"""
end

function hfun_show_pub_year()
    yr_raw = locvar(:page_year)
    isnothing(yr_raw) && return ""
    yr = string(yr_raw)
    _, allrefs = parse_bibtex(read(joinpath("_assets", "julialab.bib"), String))
    year_refs = sort([(ref, infos) for (ref, infos) in allrefs if get(infos, "year", "") == yr],
                     by = x -> get(x[2], "title", ""))
    isempty(year_refs) && return "<p>No publications for $yr.</p>"
    out = IOBuffer()
    write(out, """<ul class="publication-list">""")
    for (ref, infos) in year_refs
        write(out, ref_item(ref, infos))
    end
    write(out, "</ul>")
    return String(take!(out))
end

function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end
