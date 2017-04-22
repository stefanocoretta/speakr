#' Set path to Praat
#'
#' It assigns the default path to Praat or the user assigned path (when
#'     \code{default.path = FALSE}, which is the default).
#'
#' @param path path to Praat executable.
#' @param default.path if \code{TRUE}, the path is set to what \code{praatPath} returns.
setPraatPath <- function(path, default.path = FALSE) {
    if (default.path == FALSE) {
        pkg.env$praat.path <- path
    }else{
        pkg.env$praat.path <- praatPath()
    }
}
