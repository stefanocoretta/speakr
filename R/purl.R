#' Title
#'
#' @param input Path to the input file.
#' @param output Path to the output file.
#'
#' @export
purl_praat <- function(input, output) {
  knit_praat(input, output, tangle = TRUE)
}

#' @export
knit_praat <- knitr::knit
environment(knit_praat) <- environment(speakr::praat_run)

#' Processing functions
#'
#' @export
process_tangle <- function (x) {
  UseMethod("process_tangle", x)
}

#' @export
process_tangle.block <- function (x) {
  params = knitr::opts_chunk$merge(x$params)

  # Suppress any code but praat
  if (params$engine != 'praat') {
    params$purl <- FALSE
  }

  if (xfun::isFALSE(params$purl))
    return("")
  label = params$label
  ev = params$eval
  code = if (!xfun::isFALSE(ev) && !is.null(params$child)) {
    cmds = lapply(sc_split(params$child), knitr::knit_child)
    one_string(unlist(cmds))
  } else knitr::knit_code$get(label)

  if (!xfun::isFALSE(ev) && length(code) && any(grepl("read_chunk\\(.+\\)",
                                                      code))) {
    eval(xfun::parse_only(unlist(stringr::str_extract_all(code,
                                                          "read_chunk\\(([^)]+)\\)"))))
  }

  code = parse_chunk(code)

  if (xfun::isFALSE(ev)) {
    code = comment_out(code, params$comment, newline = FALSE)
  }

  # Output only the code, no documentation
  return(one_string(code))
}

# split by semicolon or colon
sc_split = function(string) {
  if (is.call(string)) string = eval(string)
  if (is.numeric(string) || length(string) != 1L) return(string)
  stringr::str_trim(stringr::str_split(string, ';|,')[[1]])
}

# collapse by \n
one_string = function(x, ...) paste(x, ..., collapse = '\n')

# (recursively) parse chunk references inside a chunk
parse_chunk = function(x, rc = knitr::knit_patterns$get('ref.chunk')) {
  if (length(x) == 0L) return(x)
  x = c(x)  # drop attributes of code (e.g. chunk_opts)
  if (!group_pattern(rc) || !any(idx <- grepl(rc, x))) return(x)

  labels = sub(rc, '\\1', x[idx])
  code = knitr::knit_code$get(labels)
  indent = gsub('^(\\s*).*', '\\1', x[idx])
  if (length(labels) <= 1L) code = list(code)
  code = mapply(indent_block, code, indent, SIMPLIFY = FALSE, USE.NAMES = FALSE)

  x = as.list(x)
  x[idx] = lapply(code, function(z) parse_chunk(z, rc))
  unlist(x, use.names = FALSE)
}

# add a prefix to output
comment_out = function(x, prefix = '##', which = TRUE, newline = TRUE) {
  x = gsub('[\n]{2,}$', '\n', x)
  if (newline) x = gsub('([^\n])$', '\\1\n', x)  # add \n if not exists
  if (is.null(prefix) || !nzchar(prefix) || is.na(prefix)) return(x)
  prefix = paste(prefix, '')
  x = gsub(' +([\n]*)$', '\\1', x)
  x[which] = line_prompt(x[which], prompt = prefix, continue = prefix)
  x
}

# a vectorized and better version than evaluate:::line_prompt
line_prompt = function(x, prompt = getOption('prompt'), continue = getOption('continue')) {
  # match a \n, then followed by any character (use zero width assertion)
  paste0(prompt, gsub('(?<=\n)(?=.|\n)', continue, x, perl = TRUE))
}

# is it a group pattern?
group_pattern = function(pattern) {
  !is.null(pattern) && grepl('\\(.+\\)', pattern)
}

# Indents a Block
#  Input
#     "library(ggplot2)\nqplot(wt, mpg, data = mtcars)"
#  Output
#          library(ggplot2)
#          qplot(wt, mpg, data  = mtcars)
indent_block = function(block, spaces = '    ') {
  if (is.null(block) || !any(nzchar(block))) return(rep(spaces, length(block)))
  if (spaces == '') return(block)
  line_prompt(block, spaces, spaces)
}
