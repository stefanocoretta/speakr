.onLoad <- function(libname, pkgname) {
  praat_path <- speakr:::get_praat_path()

  if (file.exists(praat_path)) {
    set_praat_path(default.path = TRUE)
    message("Praat found at ", speakr:::get_praat_path())
  } else {
   message("Praat not found! Please specify the path to Praat or install it if it's not installed yet.")
  }
}
