add_youtube <- function(src) {
    yt_url <- paste0("https://www.youtube.com/embed/", src)
    htmltools::div(
        style = "position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden;",
        htmltools::tags$iframe(
            src = yt_url,
            style = "position: absolute; top: 0; left: 0; width: 100%; height: 100%; border:0;",
            title = "YouTube Video",
            allowfullscreen = ""
        )
    )
}

# Convert HTML slides to PDF
purrr::map(list.files("slides",
                      pattern = "*.Rmd", full.names = TRUE),
           pagedown::chrome_print)
for (f in list.files("static/slides/psyc575", pattern = "*.html",
                     full.names = TRUE)) {
  render_it = function()
    pagedown::chrome_print(f, browser = "chromium-browser")
  pdf_file = xfun::with_ext(f, "pdf")
  if (!file.exists(pdf_file) || file_test("-ot", pdf_file, f))
    render_it()
}
