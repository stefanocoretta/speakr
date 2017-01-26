#' Run a Praat script.
#'
#' It runs a file containing Praat scripting, with optional arguments.
#'
#' @param script Name (or path) of the script.
#' @param ... List of arguments.
praatRun <- function(script, ...) {
    system2(pkg.env$praat.path, c("--run", c(script, list(...))))
}
#' Literate markdown tangler.
#'
#' It tangles the code from a literate markdown file. If \code{cache} is set to
#'     \code{TRUE}, the function does nothing (useful if tangling is not needed
#'     every time the file is knitted.)
#'
#' @param ... List of file names.
#' @param cache Boolean (\code{FALSE})
lmt <- function(..., cache = FALSE) {
    if (cache == FALSE) {
    system2("lmt", list(...))
    }
}
