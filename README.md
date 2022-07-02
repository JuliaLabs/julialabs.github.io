# julialabs.github.io

[![Build and Deploy](https://github.com/JuliaLabs/julialabs.github.io/actions/workflows/deploy.yml/badge.svg)](https://github.com/JuliaLabs/julialabs.github.io/actions/workflows/deploy.yml)

JuliaLab Website. Edit this to edit the website.

### Which files must be modified to update basic content
- "News" section: `_assets/news.csv`
- "Research/Grants" section: `_assets/research-grants.csv` and `_assets/research-grants` (pay attention to the name format)
- "Publications" section: `_assets/julialab.bib` (pay attention to the bibtex format) and `publications.md`
- "People" section: `_assets/people.csv` and `_assets/people` (pay attention to the name format)

### Notes about deploy
- You can serve the webpage locally by:
  > `$ julia --project=@.`
  ```julia
  julia> using Pkg; Pkg.instantiate()

  julia> using Franklin; Franklin.serve()
  ```
- Changes applied to the `master` branch will be automatically deployed to the `gh-pages` branch.
- If you add a new dependency, remember to add it also in `Project.toml`.
