#' Set path to lmt
#'
#' It assigns user assigned path to \code{lmt}.
#'
#' @param path The path to the lmt executable.
#' @export
setlmtPath <- function(path) {
    pkg.env$lmt.path <- path
}
