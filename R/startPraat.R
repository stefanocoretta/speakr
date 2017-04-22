#' Start Praat.
#'
#' It starts the GUI of Praat.
startPraat <- function() {
    system2(pkg.env$praat.path)
}
