<!--
Add here global page variables to use throughout your website.
-->

+++
using DelimitedFiles, Random

author = "Julia Lab"
mintoclevel = 2

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/"]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = "Julia Lab"
website_descr = "Julia Lab Website"
website_url   = "https://julia.mit.edu/"
prepath = ""

# People & grants
people = readdlm("_assets/people.csv", ',', skipstart=1)
grants = readdlm("_assets/research-grants.csv", ',', skipstart=1)

# Current members, alumni, and collaborators
current_members = []
alumni = []
collaborators = []
for (name,position,website,role,notes,photo) in eachrow(people)
        if photo == "Yes"
            photo_path = replace(name, r" " => s"_")
        else
            photo_path = "Default"
        end
        data = [name, position, website, photo_path]
        if role == "Current Member"
            push!(current_members, data)
        elseif role == "Alumni"
            push!(alumni, data)
        else
            push!(collaborators, data)
        end
end

# Index photos and data
index_photos = []
for (name, position, website, role, notes, photo) in eachrow(people)
    if photo == "Yes" && role == "Current Member"
        photo_path = "people/" * replace(name, r" " => s"_")
        data = [name, website, photo_path]
        push!(index_photos, data)
    end
end
for (name, full_name, description, full_description, website, photo, links) in eachrow(grants)
    if photo == "Yes"
        photo_path = "research-grants/" * replace(name, r" " => s"_")
        data = [name, website, photo_path]
        push!(index_photos, data)
    end
end
index_photos = index_photos[shuffle(1:end)]


# Adding photo paths to grants 
aux = []
for (name, full_name, description, full_description, website, photo, links) in eachrow(grants)
    if photo == "Yes"
        photo_path = "research-grants/" * replace(name, r" " => s"_")
        data = [name, full_name, description, full_description, website, photo_path, links]
        push!(aux, data)
    end
end
grants = aux



+++

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\R}{\mathbb R}
\newcommand{\scal}[1]{\langle #1 \rangle}


<!-- people_table -->
\newcommand{\prettyshow}[1]{@@code-output \show{#1} @@}

