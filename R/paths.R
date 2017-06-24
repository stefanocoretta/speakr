#' Get system path to Praat.
#'
#' The function returns the path to the Praat executable depeding on the
#'     system.
#'
#' @return The path to the Praat executable.
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
#' @export
get_praat_path <- function() {
    return(pkg.env$praat.path)
}

#' Get system path to lmt.
#'
#' The function returns the path to the lmt executable depeding on the
#'     system.
#'
#' @return The path to the lmt executable.
#' @keywords internal
lmt_path <- function() {
    sysname <- Sys.info()['sysname']

    if (sysname == "Darwin") {
        return(normalizePath("~/go/bin/lmt"))
    } else if (sysname == "Linux") {
        return(normalizePath("~/go/bin/lmt"))
    } else if (sysname == "Windows") {
        home <- Sys.getenv("HOME")
        return(normalizePath(paste(home, "go/bin/lmt")))
    }
}

#' Set path to lmt.
#'
#' It assigns user assigned path to \code{lmt}.
#'
#' @param path The path to the lmt executable.
#' @param default.path If \code{TRUE}, the path is set to what \code{praatPath}
#' returns.
#' @export
set_lmt_path <- function(path, default.path = FALSE) {
    if (default.path == FALSE) {
        pkg.env$lmt.path <- path
    } else {
        pkg.env$lmt.path <- lmt_path()
    }
}
