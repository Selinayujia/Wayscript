#!/bin/bash

# Make the directory
mkdir -p html_folder

pattern=

# If $1 is greater than length 0, set the pattern
if [[ -n $1 ]]; then
    pattern=$1
fi

echo $pattern

# Get all the html files in the current directory
HTML_FILES="$(find . -maxdepth 1 -name "*${pattern}*.html")"

echo $HTML_FILES

for file in $HTML_FILES; do 
    mv $file html_folder
done