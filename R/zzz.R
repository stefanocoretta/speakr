.onAttach <- function(libname, pkgname) {
  praat_path <- get_praat_path()

  if (file.exists(praat_path)) {
    set_praat_path(default.path = TRUE)
    packageStartupMessage("Praat found at ", get_praat_path())
  } else {
    packageStartupMessage("Praat not found! Please specify the path to Praat or install it if it's not installed yet.")
  }
}
