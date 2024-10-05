#!/bin/zsh

# Output file for logging command lines
output_file="cli.txt"

# List of graphics-related dylibs
libraries=(
    "ColorSync"
    "CoreVideo"
    "MetalPerformanceShaders"
    "QuartzCore"
    "CoreAVCHD"
)

# Base part of the command
BASE_CMD="./fuzzer -in /mnt/mov -out /mnt/mov -t 200 -t3 500 -delivery shmem -target_module test_imageio -target_method _fuzz -nargs 1 -iterations 1000 -persist -loop -cmp_coverage -generate_unwind -nthreads 20"

# Iterate over each library
for lib in $libraries; do
    # Construct the full command
    full_cmd="$BASE_CMD -dump_coverage  -instrument_module $lib -- ../examples/ImageIO/Debug/test_imageio -m @@ | grep -E 'Fuzzer version|input files read|Running input sample|Total execs|Unique samples|Crashes|Hangs|Offsets|Execs/s|WARNING|Width|Sanitizer|Hint|DEADLY'"
    
    echo "Running command: $full_cmd"
    echo "$full_cmd" >> "$output_file"
    
    # Run the command
    eval $full_cmd
done

