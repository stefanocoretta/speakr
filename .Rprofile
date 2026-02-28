source("renv/activate.R")

while(TRUE) {

  t <- try(renv::restore(prompt=FALSE, clean=FALSE))

  if(!inherits(t, "try-error")) {
    break
  }

  txt <- as.character(t)
  r <- gregexec("install of package '(.*?)' failed", txt, perl=TRUE)

  if( any(r[[1]] == -1) ) {
    break
  }

  pkg <- regmatches(txt,r)[[1]][2,1]

  renv::update(prompt=FALSE, packages=pkg)
  renv::record(pkg)

}
