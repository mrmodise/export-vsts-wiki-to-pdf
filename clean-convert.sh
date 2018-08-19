#!/usr/bin/env bash
# Replace /.attachments with the correct path, only in markdown files
LC_ALL=C find ./ -iname "*.md" -type f -exec sed -i '' -e 's$/.attachments$../.attachments$g' {} \;

# Remove VSTS image sizing  e.g. =400x, =500x, 1200x 
LC_ALL=C find ./ -type f -exec sed -i '' -e 's$=[0-9]*x$''$g' {} \;

# Convert markdown files to pdf
find ./ -path ./.attachments -prune -o -iname "*.md" -type f -exec sh -c 'pandoc "${0}" -f markdown -t latex -s -o "${0%.md}.pdf"' {} \;
