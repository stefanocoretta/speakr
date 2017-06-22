#' Set path to lmt
#'
#' It assigns user assigned path to \code{lmt}.
#'
#' @param path The path to the lmt executable.
#' @export
set_lmt_path <- function(path) {
    pkg.env$lmt.path <- path
}
