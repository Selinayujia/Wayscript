#!/bin/bash

# create html_folder if it does not exist
echo "Creating html_folder..."
if [ -d "html_folder" ]; then
	echo "html_folder already exists"
else
	mkdir html_folder 
	echo "html_folder created"
fi

FILES=*.html

# allow match-no-files pattern to expand to a null string
# so that we will not treat *.html as an actual html file
shopt -s nullglob

echo -e "\nMoving html files to html_folder..."

# move each file to html_folder
for file in $FILES
do
	mv $file html_folder
	echo "File $file moved to html_folder"
done

echo "All files moved"