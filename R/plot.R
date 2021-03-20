#' Title
#'
#' @param file
#' @param wav
#' @param tg
#' @param width
#' @param height
#' @param pitch
#'
#' @return
#' @export
#'
#' @examples
praat_plot <- function(file, wav, tg = NULL, start = 0, end = NULL, width = 5, pitch = NULL) {
  wd <- getwd()
  file <- file.path(wd, file)
  wav <- normalizePath(wav)
  plot_script <- system.file("extdata", "plot.praat", package = "speakr")

  if (is.null(tg)) {
    tg_path <- stringr::str_remove(wav, ".wav$")
    tg_path <- stringr::str_glue(tg_path, ".TextGrid")

    if (file.exists(tg_path)) {
      tg <- tg_path
    } else {
      tg <- "FALSE"
    }
  }

  if (is.null(pitch)) {
    pitch <- "FALSE"
  } else {
    pitch <- "TRUE"
  }

  if (is.null(end)) {
    end <- 0
  }

  praat_run(plot_script, file, wav, tg, start, end, width, pitch)
}
