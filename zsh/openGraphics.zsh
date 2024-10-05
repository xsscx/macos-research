#!/bin/zsh
# Open some Fuzzed Files to see if anything Crashes....

# Specify a list of common graphic file extensions
# filetypes=("*.png" "*.jpg" "*.jpeg" "*.gif" "*.bmp" "*.tiff" "*.ico" "*.svg" "*.webp")
filetypes=("*.png")

# Log file name
log_file="openGraphics_$(date +'%Y%m%d_%H%M%S').log"

echo "Starting script at $(date)" | tee -a $log_file

file_count=0
crash_count=0

# Loop through each filetype and open them
for filetype in $filetypes; do
    # Using 'find' to recursively search in the directory
    for file in $(find . -type f -iname $filetype); do
        osascript -e "tell application \"Preview\" to open POSIX file \"$file\""
        echo "[$(date)] Opened file: $file" | tee -a $log_file
        ((file_count++))
        
        # Wait for 5 seconds
        sleep 1

        # Check if Preview is running
        if ! pgrep -x "Preview" > /dev/null; then
            echo "[$(date)] Preview might have crashed when opening: $file" | tee -a $log_file
            ((crash_count++))
        else
            osascript -e "tell application \"Preview\" to quit"
        fi
    done
done

echo "Total files opened: $file_count" | tee -a $log_file
echo "Potential crashes: $crash_count" | tee -a $log_file
echo "Script completed at $(date)" | tee -a $log_file

