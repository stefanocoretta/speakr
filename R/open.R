#' Start Praat.
#'
#' It starts the GUI of Praat.
startPraat <- function() {
    system2(pkg.env$praat.path)
}

#' Open files with Praat.
#'
#' It opens a file or list of files.
#'
#' @param ... A list of strings.
praatOpen <- function(...) {
    system2(pkg.env$praat.path, c("--open", list(...)))
}
