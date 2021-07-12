#!/bin/zsh

# Example poor man's Fuzzing Script
# Load the Image into iOS Image Libs to Crash, copy fuzzed images to image.app/img/
# ./runner image.app/image image.app/img/
# Check for correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory containing Image profiles>"
    exit 1
fi

# Directory containing Image profiles
img_dir="$1"

# Check if runner tool exists in the path
if ! command -v ./runner &> /dev/null; then
    echo "runner tool not found!"
    exit 1
fi

# Create a directory in the format date-time-year-run-number
current_date=$(date +"%m-%d-%Y")
current_time=$(date +"%H-%M-%S")
run_number=1

while [[ -d "$current_date-$current_time-run-$run_number" ]]; do
    ((run_number++))
done

output_dir="$current_date-$current_time-run-$run_number"
mkdir -p "$output_dir"

# Process each Image profile with runner
for img_file in "$img_dir"/*.png; do
    # Get the base name without extension, any support image type .extension
    base_name=$(basename "$img_file" .png)
    output_file="$output_dir/$base_name-output.png" # Replace ".ext" with the expected output extension if known
    
    # Run runner command
    if ./runner iomage.app/image "$img_file" > "$output_file"; then
        echo "Processed $img_file to $output_file"
    else
        echo "Error processing $img_file."
    fi
done
