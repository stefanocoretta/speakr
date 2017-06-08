#' Get path to Praat.
#'
#' The function returns the path to the Praat executable depeding on the
#'     system.
#'
#' @return The path to the Praat executable.
#' @export
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
