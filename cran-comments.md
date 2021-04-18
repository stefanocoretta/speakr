## Test environments
* local R installation, R 4.0.5
* ubuntu 16.04 (on travis-ci), R 4.0.5
* win-builder (devel)
* R-hub windows-x86_64-devel (r-devel)
* R-hub ubuntu-gcc-release (r-release)
* R-hub fedora-clang-devel (r-devel)

## 1 NOTE

The package relies on external software (Praat) to function. On load, the path to Praat is set as an option, depending on the OS. No attempt is made to run Praat on load, so the note on Windows about not finding the file "C:/Program Files/Praat.exe" is possibly spurious.

## R CMD check results

── speakr 3.1.0: NOTE

  Build ID:   speakr_3.1.0.tar.gz-e57da25b977a441a960d4352ba057a8d
  Platform:   Windows Server 2008 R2 SP1, R-devel, 32/64 bit
  Submitted:  1h 1m 46.3s ago
  Build time: 4m 44.5s

> checking whether the namespace can be loaded with stated dependencies ... NOTE
  Warning in normalizePath(path.expand(path), winslash, mustWork) :
    path[1]="C:/Program Files/Praat.exe": The system cannot find the file specified
  
  A namespace must be able to be loaded with just the base namespace
  loaded: otherwise if the namespace gets loaded by a saved object, the
  session will be unable to start.
  
  Probably some imports need to be declared in the NAMESPACE file.

0 errors ✓ | 0 warnings ✓ | 1 note x

── speakr 3.1.0: OK

  Build ID:   speakr_3.1.0.tar.gz-824e56eeb3fc4219982cbb8a633fe929
  Platform:   Ubuntu Linux 20.04.1 LTS, R-release, GCC
  Submitted:  1h 1m 46.3s ago
  Build time: 12m 18.5s

0 errors ✓ | 0 warnings ✓ | 0 notes ✓

── speakr 3.1.0: OK

  Build ID:   speakr_3.1.0.tar.gz-460ef8b0dcab4325b2c47dfb7290beb5
  Platform:   Fedora Linux, R-devel, clang, gfortran
  Submitted:  1h 1m 46.3s ago
  Build time: 12m 35.7s

0 errors ✓ | 0 warnings ✓ | 0 notes ✓
