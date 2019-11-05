#!/bin/bash
# Script to organize any folder with filename structure: subject_year_filename.*
# Needs a folder path to what you want to apply the script on

targetDir=

if [[ -n $1 ]]; then
    targetDir=$1
else
    echo "Incorrect usage: requires folder path."
    echo "Example: ./organize_files academic/"
    exit 1
fi

# List all files in the target directory
directoryFiles=()
while IFS= read -r line; do
    directoryFiles+=( "$line" )
done < <( ls $targetDir )

# Loop through results from ls command
for file in "${directoryFiles[@]}"
do
    # make sure this is an actual file
    if [[ -f "$targetDir/$file" ]]; then
        IFS="_" read -r subject year filename <<< $file

        destFolder=$targetDir/$subject/$year

        # make a new folder only when needed
        if [[ ! -d $destFolder ]]; then
        mkdir -p $destFolder
        fi

        mv $targetDir/$file $destFolder > /dev/null
    fi
done

