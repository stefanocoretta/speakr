#' Get system path to Praat.
#'
#' The function returns the path to the Praat executable depending on the
#'     system.
#'
#' @return The path to the Praat executable.
#'
#' @keywords internal
praat_path <- function() {
    sysname <- Sys.info()['sysname']

    if (sysname == "Darwin") {
        return("/Applications/Praat.app/Contents/MacOS/Praat")
    } else if (sysname == "Linux") {
        return("/usr/bin/praat")
    } else if (sysname == "Windows") {
        return(normalizePath("C:/Program Files/Praat.exe"))
    }
}

#' Set path to Praat.
#'
#' It assigns the default path to Praat or the user assigned path (when
#'     \code{default.path = FALSE}, which is the default).
#'
#' @param path The path to the Praat executable.
#' @param default.path If \code{TRUE}, the path is set to what \code{praatPath}
#' returns.
#'
#' @return Nothing. It is used for its side effects.
#'
#' @export
set_praat_path <- function(path, default.path = FALSE) {
    if (default.path == FALSE) {
        pkg.env$praat.path <- path
    } else {
        pkg.env$praat.path <- praat_path()
    }
}

#' Print path to Praat.
#'
#' It prints the path to Praat on the console for inspection.
#'
#' @return A character vector with the Praat path.
#'
#' @export
get_praat_path <- function() {
    return(pkg.env$praat.path)
}
