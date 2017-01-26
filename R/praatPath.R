pkg.env <- new.env(parent = emptyenv())

#' Get path to Praat.
#'
#' The function returns the path to the Praat executable depeding on the
#'     system.
#'
#' @return The path to Praat.
praatPath <- function() {
    sysname <- Sys.info()['sysname']

    if (sysname == "Darwin") {
        return("/Applications/Praat.app/Contents/MacOS/Praat")
    }else if (sysname == "Linux") {
        return("/usr/bin/praat")
    }else if (sysname == "Windows") {
        return(normalizePath("C:/Program Files/Praat.exe"))
    }
}

pkg.env$praat.path <- "./"

#' Set path to Praat
#'
#' It assigns the default path to Praat or the user assigned path (when
#'     \code{default.path = FALSE}, which is the default).
#'
#' @param path Path to Praat.
#' @param default.path Boolean (\code{FALSE}).
setPraatPath <- function(path, default.path = FALSE) {
    if (default.path == FALSE) {
        pkg.env$praat.path <- path
    }else{
        pkg.env$praat.path <- praatPath()
    }
}

setPraatPath(default.path = TRUE)

#' Print path to Praat
#'
#' It prints the path to Praat on the console for inspection.
getPraatPath <- function() {
    return(pkg.env$praat.path)
}
