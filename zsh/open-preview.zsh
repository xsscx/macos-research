#!/bin/zsh
# Open a Sample of fuzzed Files in Preview to see if they Crash anything... 

log_file="preview_test_log.txt"

# Function to log messages
log_message() {
    local message="$1"
    echo "$(date "+%a %b %d %T %Z %Y"): $message" | tee -a $log_file
}

log_message "Starting script"

# Variables to count the number of files and crashes
file_count=0
crash_count=0

# Function to test opening a file
test_open_file() {
    local file="$1"
    open -a Preview "$file"
    sleep 3  # wait for 5 seconds to allow Preview to open and process the file

    # Check if Preview is still running
    if ! pgrep -x "Preview" > /dev/null; then
        log_message "Potential crash detected with file: $file"
        ((crash_count++))
    fi

    # Close Preview
    pkill -x "Preview"
}

# Loop through PNG files in the current directory
for file in *.png; do
    if [[ -f "$file" ]]; then
        ((file_count++))
        log_message "Opening file: $file"
        test_open_file "$file"
    fi
done

log_message "Total files opened: $file_count"
log_message "Potential crashes: $crash_count"
log_message "Script completed"

