# Written by @h02332
# March 3, 2022
# Quick Check for Crashing sips with a few icc profiles
# 
#!/bin/zsh

# Output file
output="icc-crash-file.txt"

# Clear the output file before starting
echo "Starting script..." > $output

# Extensions to search for
extensions=( ".icc" ".icm" ".pf" ".prof" )

echo "Searching for files with extensions: ${extensions[@]}" >> $output

# Counters for processed files and errors
total_files=0
total_errors=0

# Iterate over extensions
for ext in "${extensions[@]}"; do
    echo "Processing files with extension $ext..." >> $output

    # Iterate over all files of the current extension in the current directory and subdirectories
    find . -type f -name "*$ext" -print0 | while IFS= read -r -d '' file; do
        total_files=$((total_files+1))

        # Exclude files containing the string "makefile" (case insensitive)
        if [[ "${file:l}" == *"/makefile"* ]]; then
            echo "Excluding file: $file (matches makefile pattern)" >> $output
            continue
        fi

        # Test the file with the sips command.
        echo "Verifying file: $file with sips command..." >> $output
        sips_output=$(sips --debug --verify "$file" 2>&1)
        retval=$?
        if [ $retval -ne 0 ]; then
            total_errors=$((total_errors+1))
            echo "$file caused an error (Exit code: $retval)." >> $output
            echo "Error details:" >> $output
            echo "$sips_output" >> $output
        else
            echo "$file verified successfully." >> $output
        fi
    done
done

echo "Script finished. Processed $total_files files. Detected $total_errors errors." >> $output

