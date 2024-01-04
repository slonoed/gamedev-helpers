#!/bin/bash

# Requires imagemagic

# Check if the path argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

# The first argument is the path where the files will be created
output_path=$1

# Check if the specified path exists and is a directory
if [ ! -d "$output_path" ]; then
    echo "Error: The specified path does not exist or is not a directory."
    exit 1
fi

# Define an array of common colors
colors=("red" "green" "blue" "yellow" "orange" "purple" "cyan" "magenta" "black" "white"
        "lime" "teal" "navy" "maroon" "olive" "gray" "skyblue" "pink" "violet" "salmon"
        "gold" "coral" "turquoise" "tan" "plum" "sienna" "beige" "lavender")

# Loop through each color and create a 1x1 PNG file in the specified path
for color in "${colors[@]}"; do
    convert -size 1x1 canvas:"$color" "${output_path%/}/${color}.png"
done

echo "PNG files created in $output_path"

