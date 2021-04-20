#' Get system path to 'Praat'.
#'
#' The function returns the path to the 'Praat' executable depending on the
#'     system. If the operating system is not supported, the package gracefully
#'
#' @return The path to the 'Praat' executable.
#'
#' @keywords internal
praat_path <- function() {
    sysname <- Sys.info()['sysname']

    if (sysname == "Darwin") {
        return("/Applications/Praat.app/Contents/MacOS/Praat")
    } else if (sysname == "Linux") {
        return("/usr/bin/praat")
    } else if (sysname == "Windows") {
        return(normalizePath("C:/Program Files/Praat.exe", mustWork = FALSE))
    } else {
        return(FALSE)
    }
}

#' Set path to 'Praat'.
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Now speakr uses options() to set the path to 'Praat'.
#'
#' @keywords internal
set_praat_path <- function(path, default.path = FALSE) {
    lifecycle::deprecate_warn(
       "3.1.0",
       "set_praat_path()",
       details = "Please use `options('speakr.praat.path')` instead."
    )
    if (default.path == FALSE) {
        options(speakr.praat.path = path)
    } else {
        options(speakr.praat.path = praat_path())
    }
}

#' Print path to 'Praat'.
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Now speakr uses options() to set the path to 'Praat'.
#'
#' @keywords internal
get_praat_path <- function() {
    lifecycle::deprecate_warn(
        "3.1.0",
        "set_praat_path()",
        details = "Please use `options(speakr.praat.path = './praat')` instead."
    )
    return(getOption("speakr.praat.path"))
}
