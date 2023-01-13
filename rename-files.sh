#!/bin/bash

# Check if the help flag is given
if [ "$1" == "--help" ]; then
    echo "Usage: scriptname.sh <directory_path> <string_to_add>"
    echo "Renames all files in the directory by adding a string at the beginning of the actual file name."
    exit 0
fi


# Check if the necessary parameters are given
if [ $# -lt 2 ]; then
    echo "Error: Missing parameters. Usage: scriptname.sh directory_path string_to_add"
    exit 1
fi

# Get the directory path and string to add as parameters
dir=$1
string=$2

# Loop through all files in the directory
for file in $dir/*; do
    # Get the file name without the path
    file_name=$(basename "$file")
    # Add the string to the beginning of the file name
    new_file_name="$string$file_name"
    # Rename the file
    mv "$file" "$dir/$new_file_name"
done

