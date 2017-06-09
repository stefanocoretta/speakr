## ----setup, echo=FALSE, include=FALSE------------------------------------
library(tidyverse)
library(speakr)

## ----speakr, eval=FALSE--------------------------------------------------
#  library(speakr)

## ----run-----------------------------------------------------------------
# system.file() is needed here because the example files reside in the package.
# You can just include the file path directly in praatRun(), like 
# praatRun("~/Desktop/script.praat")
script <- system.file("extdata", "get-formants.praat", package = "speakr")

formants <- praatRun(script, "Hertz", 0.03, capture = TRUE) %>%
    read_csv()

formants

