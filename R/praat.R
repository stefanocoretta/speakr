#' Start Praat.
#'
#' It starts the GUI of Praat.
#' @export
start_praat <- function() {
    system2(pkg.env$praat.path, wait = FALSE)
}

#' Open files with Praat.
#'
#' It opens a file or list of files.
#'
#' @param ... A list of strings.
#' @export
praat_open <- function(...) {
    system2(pkg.env$praat.path, c("--open", list(...)), wait = FALSE)
}

#' Run a Praat script.
#'
#' It runs a file containing Praat scripting, with optional arguments.
#'
#' @param script A character vector containing the script name.
#' @param ... List of arguments to be passed to the script.
#' @param capture If set to \code{TRUE}, the standard output of the script can be
#' captured into a variable. This is useful if the script uses the "write to Info"
#' commands.
#' @export
praat_run <- function(script, ..., capture = FALSE) {
    if (capture == FALSE) {
        system2(pkg.env$praat.path, c("--run", c(script, list(...))))
    } else {
        output <- system2(pkg.env$praat.path, c("--run", c(script, list(...))),
                          stdout = capture
        )
        return(paste(output, collapse = "\n"))
    }
}
