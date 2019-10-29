#!/bin/bash
NEW_DIR=html_folder
mkdir -p $NEW_DIR
for file in *.html; do
	mv $file $NEW_DIR
done
