<!--
Add here global page variables to use throughout your website.
-->

+++
using Dates, DelimitedFiles, Random

copyright_year = string(year(today()))

author = "Julia Lab"
mintoclevel = 2

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/"]

html_escape(s) = replace(
    string(s),
    "&" => "&amp;",
    "<" => "&lt;",
    ">" => "&gt;",
    "\"" => "&quot;",
    "'" => "&#39;"
)

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = "Julia Lab"
website_descr = "Julia Lab Website"
website_url   = "https://julia.mit.edu/"
prepath = ""

# News, people, and grants
news   = readdlm("_assets/news.csv", ',', skipstart=1)
people = readdlm("_assets/people.csv", ',', skipstart=1)
grants = readdlm("_assets/research-grants.csv", ',', skipstart=1)


# News
news_entries = []
for (date, title, link) in eachrow(news)
    parsed_date = Date(date, dateformat"m/d/y")
    data = [
        parsed_date,
        Dates.format(parsed_date, dateformat"U d, yyyy"),
        monthabbr(parsed_date),
        string(day(parsed_date)),
        title,
        link,
        Dates.format(parsed_date, dateformat"yyyy-mm-dd"),
        string(year(parsed_date))
    ]
    push!(news_entries, data)
end
sort!(news_entries, by = entry -> entry[1], rev = true)

news_by_year = []
for entry_year in unique([entry[8] for entry in news_entries])
    year_entries = []
    for entry in news_entries
        if entry[8] == entry_year
            push!(year_entries, [entry[2], entry[3], entry[4], entry[5], entry[6], entry[7]])
        end
    end
    push!(news_by_year, [entry_year, year_entries])
end

news_archive_sections = []
for (entry_year, year_entries) in news_by_year
    entry_html = []
    for (display_date, month, day, title, link, iso_date) in year_entries
        push!(
            entry_html,
            """
            <article class="news-entry">
                <time class="news-date" datetime="$(html_escape(iso_date))" aria-label="$(html_escape(display_date))">
                    <span class="news-date-month">$(html_escape(month))</span>
                    <span class="news-date-day">$(html_escape(day))</span>
                </time>
                <div class="news-entry-body">
                    <p class="news-entry-title"><a href="$(html_escape(link))">$(html_escape(title))</a></p>
                </div>
            </article>
            """
        )
    end
    push!(
        news_archive_sections,
        """
        <section class="news-year-group">
            <div class="news-year-heading">
                <h2>$(html_escape(entry_year))</h2>

            </div>
            <div class="news-list">
                $(join(entry_html, "\n"))
            </div>
        </section>
        """
    )
end
news_archive_html = join(news_archive_sections, "\n")
# Hub page shows only the 2 most recent years
news_recent_html = join(news_archive_sections[1:min(2, length(news_archive_sections))], "\n")

news_years = [yr for (yr, _) in news_by_year]  # newest first

news_years_nav_html = """<nav class="news-years-nav" aria-label="News by year">""" *
    join(["""<a href="/news/$yr/" class="news-year-pill">$yr</a>""" for yr in news_years], "\n") *
    """</nav>"""

homepage_news_preview = news_entries[1:min(6, length(news_entries))]
homepage_news_preview_html = join([
    """
    <article class="home-next-4-news-entry">
        <time class="home-next-4-news-date" datetime="$(html_escape(entry[7]))" aria-label="$(html_escape(entry[2]))">
            <span>$(html_escape(entry[3]))</span>
            <span>$(html_escape(entry[4]))</span>
        </time>
        <p><a href="$(html_escape(entry[6]))">$(html_escape(entry[5]))</a></p>
    </article>
    """
    for entry in homepage_news_preview
], "\n")

# Current members, alumni, and collaborators
current_members = []
alumni = []
internal_collaborators = []
external_collaborators = []
for (name, position, website, role, photo) in eachrow(people)
        if photo == "Yes"
            photo_path = replace(name, r" " => s"_")
        else
            photo_path = "Default"
        end
        data = [name, position, website, photo_path]
        if role == "Current Member"
            push!(current_members, data)
        elseif role == "Internal Collaborator"
            push!(internal_collaborators, data)
        elseif role == "External Collaborator"
            push!(external_collaborators, data)
        elseif role == "Alumni"
            push!(alumni, data)
        end
end
sort!(alumni, by = entry -> lowercase(split(strip(entry[1]), " ")[end]))
sort!(external_collaborators, by = entry -> lowercase(split(strip(entry[1]), " ")[end]))

# Index photos and data
index_photos = []
for (name, position, website, role, photo) in eachrow(people)
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
