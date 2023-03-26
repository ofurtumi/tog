#!/bin/bash

inotifywait -q -m -e close_write "$1.Rmd" | 
while read -r filename event; do
  R -e "library(rmarkdown); rmarkdown::render('$1.Rmd');"
done
