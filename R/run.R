#' Run a Praat script.
#'
#' It runs a file containing Praat scripting, with optional arguments.
#'
#' @param script caracter vector containing the script name.
#' @param ... list of arguments of the script to be run.
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
lmt <- function(file, cache = FALSE) {
    if (cache == FALSE) {
        file.dir <- normalizePath(dirname(file))
        base.file <- basename(file)
        current.wd <- getwd()
        setwd(file.dir)
        system2("/Users/Stefano/work/bin/lmt", base.file)
        setwd(current.wd)
    }
}
