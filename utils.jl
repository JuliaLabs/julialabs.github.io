using BibTeX

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
    title = replace(infos["title"], "{" => "", "}" => "")
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
    out = IOBuffer()
    write(out, "<ul class=\"publication-list\">")
    for ref in refs
        infos = get(allrefs, ref, nothing)
        isnothing(infos) && continue
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
