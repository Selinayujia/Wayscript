#!/bin/bash

#
# this is a script that moves html files which contain a given pattern string 
# in their file names to html_folder
#
# the pattern string is given in the first argument
#
# if the pattern string is not given, the script will move all htmls
#

TARGET_FOLDER="html_folder"

echo "Creating $TARGET_FOLDER..."
if [ -d $TARGET_FOLDER ]; then
	echo "$TARGET_FOLDER already exists"
else
	mkdir $TARGET_FOLDER 
	echo "$TARGET_FOLDER created"
fi

# set file names pattern
FILES="*${1:-*}*.html"

# allow match-no-files pattern to expand to a null string
# so we will not treat *.html as an actual html file anymore
shopt -s nullglob

echo -e "\nMoving qualified html files to $TARGET_FOLDER..."

# move files to $FOLDER
for file in $FILES
do
	mv $file $TARGET_FOLDER
	echo "File $file moved to $TARGET_FOLDER"
done

echo "All files moved"