# speakr 3.1.1

## Fixed

* Fixed CRAN errors.




# speakr 3.1.0

## Added

* `praat_plot()` to plot waveforms and spectrograms with the Praat plotting facilities.

* `use_praat_plot_script()` to save a copy of the Praat plotting script on disk.

* `praat-plot.Rmd` vignette.

## Fixed

* Now the path to Praat is set on load and calls to the package namespace with `::` will work (closes #5).

## Deprecated

* `set_praat_path()` and `get_praat_path()` have been deprecated. Now the package relies on `options("speakr.praat.path")`.



# speakr 3.0.0

## Added

* 🎉 Use pkgdown!

* 🎉 Add logo!

## Changed

* Use `usethis::use_package_doc()`.

* 📝 Various updates to the documentation.

## Removed

* 🔥 Utilities for `lmt` have been removed. (R-based literate Praat capabilities will be reintroduced in a future release).


# speakr 2.1.1

## Added

* `pandoc-praat` asset

* flamenco theme (supports Praat scripting)

## Fixed

* warning message about `lmt` path at install time when `lmt` is not installed

# speakr 2.1.0

## Changed

* expanded documentation

# speakr 2.0.2

## Fixed

* missing date in citation

# speakr 2.0.1

## Added

* link to demo

## Changed

* clarified scope and installation of the package in README.md

# speakr 2.0.0

## Added

* `set_lmt_path`

* `lmt_path`

* `set_lmt_path` on load with default `go/bin` paths

## Changed

* path in `lmt`

* *applied tidy style to function names*

## Fixed

* code style of some functions

## Removed

* old functions with camelCase names

# speakr 1.0.0

## Added

* everything
