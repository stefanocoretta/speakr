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
#' @param format Output file format (`png` by default, or `pdf`).
#' @param f0 Whether to plot f0 (`FALSE` by default).
#' @param f0_min If `f0 = TRUE`, minimum f0 value (`0` by default).
#' @param f0_max If `f0 = TRUE`, maximum f0 value (`500` by default).
#' @param spec_max Maximum frequency for the spectrogram (`5000` by default).
#'
#' @return Nothing. It is used for its side effects.
#' @export
#'
#' @examples
#' \dontrun{
#' wav <- system.file("extdata", "vowels.wav", package = "speakr")
#'
#' praat_plot("vowels.png", wav, f0 = TRUE, f0_max = 200, end = 3)
#' }
praat_plot <- function(
  file, wav, tg = NULL, start = 0, end = NULL, width = 5, format = "png",
  f0 = FALSE, f0_min = 0, f0_max = 500, spec_max = 5000
) {
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
    f0 <- "TRUE"
  } else {
    f0 <- "FALSE"
  }

  if (is.null(end)) {
    end <- 0
  }

  praat_run(plot_script, file, wav, tg, start, end, width, format, f0, f0_min, f0_max, spec_max)
}


#' Use Praat plotting script
#'
#' This allows the user to save a copy of the Praat plotting script on disk so
#' that they can make changes and customise the plot.
#'
#' @param file Path including file name to which the script is copied.
#' @param ... Further arguments passed to \code{\link[base]{file.copy}}.
#'
#' @return Nothing. It is used for its side effects.
#' @export
use_praat_plot_script <- function(file, ...) {
  plot_script <- system.file("extdata", "plot.praat", package = "speakr")
  file.copy(plot_script, file, ...)
}
