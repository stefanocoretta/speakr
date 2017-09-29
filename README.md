# `speakr`: A Wrapper for the Phonetic Software Praat

This is the repository of `speakr`, an `R` package for running Praat scripts and capturing their output.

## Installation

To install `speakr`, use `devtools::install_github("stefanocoretta/speakr@v2.0.1", build_vignettes = TRUE)`. For a quick start on how to use the package, check out the vignette with `vignette("reproducibility", "speakr")`.

If you want to tangle the code of your Praat script with the literate markdown tangler, you need to also install `lmt` from <https://github.com/driusan/lmt> .
To use `lmt` with `speakr`, your Go workspace (which will contain the `lmt` executable) needs to be in the default location (`$HOME/go` in Unix and `%USERPROFILE%/go` in Windows). If you are using a custom workspace location, you can set the custom path to `lmt` with `set_lmt_path` at the start of every R session.

## Demo

For a demo, check <https://github.com/stefanocoretta/speakr-demo>.

## Disclaimer

The current stable (bug free) version is `v2.0.1`.

Package versions ending with `.9000` are developmental. Things might break when updating to the development version.
