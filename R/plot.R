#' Title
#'
#' @param file
#' @param wav
#' @param tg
#'
#' @return
#' @export
#'
#' @examples
praat_plot <- function(file, wav, tg = NULL, width = 5, height = 3, pitch = NULL) {
  wd <- getwd()
  file <- file.path(wd, file)
  wav <- normalizePath(wav)
  plot_script <- system.file("extdata", "plot-wav-tg.praat", package = "speakr")

  if (is.null(tg)) {
    tg_path <- stringr::str_remove(wav, ".wav$")
    tg_path <- stringr::str_glue(tg_path, ".TextGrid")
    tg_path <- file.path(wd, tg_path)

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

  praat_run(plot_script, wav, tg, file, width, height, pitch)
}
