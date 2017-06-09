#' Open files with Praat.
#'
#' It opens a file or list of files.
#'
#' @param ... A list of strings.
#' @export
praatOpen <- function(...) {
    system2(pkg.env$praat.path, c("--open", list(...)), wait = FALSE)
}
