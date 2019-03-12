#' Start Praat.
#'
#' It opens the Praat GUI.
#'
#' @examples
#' \dontrun{
#' # Open Praat GUI.
#' start_praat()
#' }
#'
#' @export
start_praat <- function() {
    system2(pkg.env$praat.path, wait = FALSE)
}

#' Open files with Praat.
#'
#' It opens a file or list of files in the Praat GUI.
#'
#' @param ... A list of strings with the file paths.
#'
#' @examples
#' \dontrun{
#' # Open a single file
#' praat_open("./Desktop/your-script.praat")
#'
#' # Open multiple diles
#' praat_open("./Desktop/script-1.praat", "./Desktop/script-2.praat")
#' }
#'
#' @export
praat_open <- function(...) {
    system2(pkg.env$praat.path, c("--open", list(...)), wait = FALSE)
}

#' Run a Praat script.
#'
#' It runs a Praat script, with optional arguments passed to the script.
#'
#' @param script A character vector containing the script name.
#' @param ... List of arguments to be passed to the script.
#' @param capture If set to \code{TRUE}, the standard output of the script (for
#'   example, from \code{writeInfo}) can be saved into a variable in R. If
#'   \code{FALSE} (the default) the output is logged to the console
#'
#' @examples
#' \dontrun{
#' # Run get-formants.praat with argument "Hertz"
#' praat_run("./get-formants.praat", "Hertz")
#' }
#'
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
