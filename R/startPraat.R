#' Start Praat.
#'
#' It starts the GUI of Praat.
#' @export
start_praat <- function() {
    system2(pkg.env$praat.path, wait = FALSE)
}
