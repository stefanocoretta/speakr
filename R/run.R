praatRun <- function(script, ...) {
    system2(pkg.env$praat.path, c("--run", c(script, list(...))))
}

lmt <- function(..., cache = FALSE) {
    if (cache == FALSE) {
    system2("lmt", list(...))
    }
}
