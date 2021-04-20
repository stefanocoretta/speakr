.onLoad <- function(libname, pkgname) {
  op <- options()
  op.speakr <- list(
    speakr.praat.path = praat_path()
  )

  toset <- !(names(op.speakr) %in% names(op))
  if (any(toset)) options(op.speakr[toset])

  invisible()
}

.onAttach <- function(libname, pkgname) {
  praat_path <- getOption("speakr.praat.path")

  if (praat_path != FALSE) {
    if (file.exists(praat_path)) {
      packageStartupMessage("Praat found at ", praat_path)
    } else {
      packageStartupMessage(
        "Praat not found! Please specify the path to Praat with
        `(options(speakr.praat.path = ...))` or install it if it's
        not installed yet."
      )
    }
  } else {
    packageStartupMessage(
      "Automatic detection of Praat is not supported on this operating system.
      Please specify the path to Praat with `(options(speakr.praat.path = ...))`."
    )
  }
}
