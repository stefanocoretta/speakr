# speakr v3.2.2

## Added

- `add_lmt()` to add the Quarto extension Literate Markdown Tangler.

- Add `praat-lmt` vignette that illustrates how to use the LMT to write Praat scripts.

## Changed

- Vignettes now use native pipe `|>`.


# speakr v3.2.1

## Fixed

* `option()` to `options()` in README (7fb7757). Thanks to @agricolamz (#11).

## Developer

* Fixed CRAN errors related to HTML5 checks.


# speakr v3.2.0

## Added

* Zenodo DOI in Readme.

## Fixed

* Fixed errors in vignette after update of readr.



# speakr v3.1.1

## Fixed

* Fixed CRAN errors.




# speakr v3.1.0

## Added

* `praat_plot()` to plot waveforms and spectrograms with the Praat plotting facilities.

* `use_praat_plot_script()` to save a copy of the Praat plotting script on disk.

* `praat-plot.Rmd` vignette.

## Fixed

* Now the path to Praat is set on load and calls to the package namespace with `::` will work (closes #5).

## Deprecated

* `set_praat_path()` and `get_praat_path()` have been deprecated. Now the package relies on `options("speakr.praat.path")`.



# speakr v3.0.0

## Added

* 🎉 Use pkgdown!

* 🎉 Add logo!

## Changed

* Use `usethis::use_package_doc()`.

* 📝 Various updates to the documentation.

## Removed

* 🔥 Utilities for `lmt` have been removed. (R-based literate Praat capabilities will be reintroduced in a future release).


# speakr v2.1.1

## Added

* `pandoc-praat` asset

* flamenco theme (supports Praat scripting)

## Fixed

* warning message about `lmt` path at install time when `lmt` is not installed

# speakr v2.1.0

## Changed

* expanded documentation

# speakr v2.0.2

## Fixed

* missing date in citation

# speakr v2.0.1

## Added

* link to demo

## Changed

* clarified scope and installation of the package in README.md

# speakr v2.0.0

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

# speakr v1.0.0

## Added

* everything
