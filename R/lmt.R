#' Literate markdown tangler.
#'
#' It tangles the code from a literate markdown file. If \code{cache} is set to
#'     \code{TRUE}, the function does nothing (useful if tangling is not needed
#'     every time the file is knitted.)
#'
#' @param file File name.
#' @param cache Boolean (\code{FALSE})
lmt <- function(file, cache = FALSE) {
    if (cache == FALSE) {
        file.dir <- normalizePath(dirname(file))
        base.file <- basename(file)
        current.wd <- getwd()
        setwd(file.dir)
        system2("/Users/Stefano/work/bin/lmt", base.file)
        setwd(current.wd)
    }
}
