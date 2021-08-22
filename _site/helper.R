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
