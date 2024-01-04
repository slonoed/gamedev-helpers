#!/bin/bash

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

# Define an array of 28 common colors, removing "mint" and "peach"
colors=("red" "green" "blue" "yellow" "orange" "purple" "cyan" "magenta" "black" "white"
        "lime" "teal" "navy" "maroon" "olive" "gray" "skyblue" "pink" "violet" "salmon"
        "gold" "coral" "turquoise" "tan" "plum" "sienna" "beige" "lavender")

# Loop through each color and create a 64x64 PNG file with a circle that spans the image
for color in "${colors[@]}"; do
    convert -size 64x64 xc:none -fill "$color" -draw "circle 32,32 32,0" "${output_path%/}/${color}_circle.png"
done

echo "PNG files with full-width circles created in $output_path"
