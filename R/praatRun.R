#' Run a Praat script.
#'
#' It runs a file containing Praat scripting, with optional arguments.
#'
#' @param script caracter vector containing the script name.
#' @param ... list of arguments of the script to be run.
#' @export
praatRun <- function(script, ...) {
    system2(pkg.env$praat.path, c("--run", c(script, list(...))))
}
