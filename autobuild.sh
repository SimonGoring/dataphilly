#!/bin/bash

### Set initial time of file
LTIME=`stat -c %Z ./index.Rmd`

while true    
do
  ATIME=`stat -c %Z ./index.Rmd`
  
  if [[ "$ATIME" != "$LTIME" ]]
  then    
    Rscript -e "rmarkdown::render('$1')"
    LTIME=$ATIME
  fi
  sleep 5
done