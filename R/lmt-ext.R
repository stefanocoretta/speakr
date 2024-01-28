#' Install the Literate Markdown Tangler extension
#'
#' It installs the Quarto extension Literate Markdown Tangler, which provides
#' users with literate programming tools.
#'
#' @return Nothing. Used for its side effects.
#'
#' @examples
#' \dontrun{
#' add_lmt()
#' }
#'
#' @export
add_lmt <- function() {
  q_path <- quarto::quarto_path()
  if (!is.null(q_path)) {
    system(paste0("quarto add --no-prompt stefanocoretta/lmt"))
    cli::cli_alert_success("LMT extension installed!")
  }
}
