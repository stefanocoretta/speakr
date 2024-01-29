## R CMD check results

## Test environments

- local macOS 14.2.1 (23C71) Apple M1 (r-4.3.2): OK
- win-builder (devel): OK
- GitHub Actions standard CRAN checks (win/macos/ubuntu r-release; ubuntu r-devel; ubuntu r-oldrel-1): OK
- R-hub windows-x86_64-devel (r-devel) NOTE
- R-hub ubuntu-gcc-release (r-release) NOTE
- R-hub fedora-clang-devel (r-devel) NOTE

## R CMD check results

❯ on local macOS

❯ on win-builder

❯ on GitHub Actions

❯ On windows-x86_64-devel (r-devel)
  checking for non-standard things in the check directory ... NOTE
  Found the following files/directories:
    ''NULL''

❯ On windows-x86_64-devel (r-devel)
  checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
    'lastMiKTeXException'
  
  Status: 2 NOTEs

❯ On ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking HTML version of manual ... NOTE
  Skipping checking HTML validation: no command 'tidy' found

0 errors ✔ | 0 warnings ✔ | 3 notes ✖

It's not clear to me how to fix the note on windows-x86_64-devel and the note on ubunto seems to be related to build tools and not the package itself.
