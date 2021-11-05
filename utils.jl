using BibTeX

function ref_item(ref, infos)
    io = IOBuffer()

    author = infos["author"]
    author_last, author_first = strip.(split(author, ","))

    write(io, "<li id=\"#$ref\">")
    write(io, """$author_first $author_last, <span style="font-style:italic;">$(infos["title"])</span>, $(infos["year"]).""")
    write(io, "</li>")
    return String(take!(io))
end


function hfun_show_refs(refs)
    _, allrefs = parse_bibtex(read(joinpath("_assets", "julialab.bib"), String))
    out = IOBuffer()
    write(out, "<ul>")
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
