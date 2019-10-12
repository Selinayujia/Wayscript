#!/bin/sh
mkdir -p html_folder
FILES=*$1*.html
for f in $FILES
do
	mv $f html_folder
done