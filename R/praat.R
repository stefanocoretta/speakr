#' Start Praat.
#'
#' It opens the Praat GUI.
#'
#' @return Nothing. Used for its side effects.
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
#' @param ... A character vector with the path to the file. Include multiple vector
#'   arguments to open multiple files.
#'
#' @return Nothing. Used for its side effects.
#'
#' @examples
#' \dontrun{
#' # Open a single file
#'
#' script <- system.file("extdata", "get-formants.praat", package = "speakr")
#' praat_open(script)
#'
#' # Open multiple files
#'
#' wav <- system.file("extdata", "vowels.wav", package = "speakr")
#' tg <- system.file("extdata", "vowels.TextGrid", package = "speakr")
#' praat_open(wav, tg)
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
#'   \code{FALSE} (the default) the output is logged to the console.
#'
#' @return If the Praat script returns standard output this is returned as a
#'   character vector. Also, if the script has instructions to create files,
#'   these will be created.
#'
#' @examples
#' \dontrun{
#' script <- system.file("extdata", "get-formants.praat", package = "speakr")
#'
#' # Run get-formants.praat with argument "Hertz" and log to console.
#' praat_run(script, "Hertz")
#'
#' # Run get-formants.praat with arguments and save in R variable.
#' library(readr)
#' formants <- praat_run(script, "Hertz", 0.03, capture = TRUE) %>%
#'   read_csv()
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
