#' Run a Praat script.
#'
#' It runs a file containing Praat scripting, with optional arguments.
#'
#' @param script A character vector containing the script name.
#' @param ... List of arguments to be passed to the script.
#' @param capture If set to `TRUE`, the standard output of the script can be
#' captured into a variable. This is useful if the script uses the "write to Info"
#' commands.
#' @export
praatRun <- function(script, ..., capture = FALSE) {
    if (capture == FALSE) {
        system2(pkg.env$praat.path, c("--run", c(script, list(...))))
    } else {
        output <- system2(pkg.env$praat.path, c("--run", c(script, list(...))),
                          stdout = capture
        )
        return(paste(output, collapse = "\n"))
    }
}
