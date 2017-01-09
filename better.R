#!/usr/bin/env Rscript

# Note that this can't be added to an utils.R file, because that would assume
# we already have a way to import it.
import <- function(relfile) {
  cmdArgs <- commandArgs(trailingOnly = FALSE)
  needle <- "--file="
  match <- grep(needle, cmdArgs)
  if (length(match) > 0) {
    # Rscript
    path <- sub(needle, "", cmdArgs[match])
  } else {
    # 'source'd via R console
    path <- sys.frames()[[1]]$ofile
  }
  source(file.path(dirname(path), relfile))
}

import("y.R")

hello()
