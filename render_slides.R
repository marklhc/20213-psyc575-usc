# Convert Rmd slides to HTML and PDF
for (f in dir("slides", pattern = "*.Rmd", full.names = TRUE)) {
  render_it = function()
    pagedown::chrome_print(f, browser = "chromium-browser", async = TRUE)
  pdf_file = xfun::with_ext(f, "pdf")
  if (!file.exists(pdf_file) || file_test("-ot", pdf_file, f))
    render_it()
}