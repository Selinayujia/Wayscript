#!/bin/bash

add_file()
{
    cp $1/$2 $3/$2
}

#we assume the target should be in the same directory as the script itself
targetDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
utilsDir=$targetDir/utils

echo $utilsDir

# If there is an path given
if [[ -n $1 ]]; then
    targetDir=$1
fi

# Make the directory
mkdir -p $targetDir
mkdir -p $targetDir/html_src
mkdir -p $targetDir/templates

add_file "$utilsDir/templates" style.css $targetDir
add_file "$utilsDir/templates" index.ptml "$targetDir/html_src"
add_file "$utilsDir/templates" about.ptml "$targetDir/html_src"
add_file "$utilsDir/templates" makefile "$targetDir"
add_file "$utilsDir/templates" head.txt "$targetDir/templates"
add_file "$utilsDir/templates" menu.txt "$targetDir/templates"
add_file "$utilsDir/templates" logo.txt "$targetDir/templates"
