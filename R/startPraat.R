#' Start Praat.
#'
#' It starts the GUI of Praat.
#' @export
startPraat <- function() {
    system2(pkg.env$praat.path, wait = FALSE)
}
