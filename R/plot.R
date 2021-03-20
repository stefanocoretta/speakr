#' Plot waveform and spectrogram
#'
#' @param file Output file path as a string.
#' @param wav Wav file path as a string.
#' @param tg TextGrid file path as a string. If `NULL` (the default), a TextGrid
#'   is plotted if a TextGrid file with the same name as the wav file is found.
#'   No TextGrid is plotted otherwise.
#' @param start Start time of the plotting window in seconds.
#' @param end End time of the plotting window in seconds. If `NULL` (the
#'   default), plot the entire duration.
#' @param width Width of the plot in inches.
#' @param f0 Whether to plot f0 (`FALSE` by default).
#'
#' @return Nothing. It is used for its side effects.
#' @export
#'
praat_plot <- function(file, wav, tg = NULL, start = 0, end = NULL, width = 5, f0 = FALSE) {
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

  if (f0) {
    pitch <- "TRUE"
  } else {
    pitch <- "FALSE"
  }

  if (is.null(end)) {
    end <- 0
  }

  praat_run(plot_script, file, wav, tg, start, end, width, pitch)
}
