#!/bin/bash
echo "Converting JSX files to JS for ES modules..."
find app/ -name "*.jsx" | while read file; do
    if echo "$file" | grep -v "Logo3D.jsx" > /dev/null; then
        mv "$file" "${file%.jsx}.js"
        echo "Renamed: $file -> ${file%.jsx}.js"
    fi
done
