#!/bin/zsh

# Output file for logging command lines
output_file="clivideo.txt"

@ Input Dir
input_dir="/mnt/fuzz/video/"

# List of graphics-related dylibs
libraries=(
    "libCGInterfaces.dylib"
    "AppleGVA"
    "ColorSync"
    "CoreVideo"
    "MetalPerformanceShaders"
    "QuartzCore"
    "CoreAVCHD"
)

# Base part of the command
# BASE_CMD="Debug/fuzzer -in $input_dir -out /tmp/mov001 -t 200 -t3 500 -delivery shmem -target_module vtdecode -target_method _fuzz -nargs 1 -iterations 1000 -persist -loop -cmp_coverage -generate_unwind -nthreads 20"
BASE_CMD="./Debug/fuzzer -mute_child -in "$input_dir" -out ./tmphevc_out0001 -t 1000 -delivery_dir /Volumes/RAMDisk -file_extension mov -instrument_module CoreVideo -target_module vtdecode -target_method _fuzz -nargs 1 -iterations 5000 -persist -loop -cmp_coverage -generate_unwind -nthreads 20"
# Iterate over each library
for lib in $libraries; do
    # Construct the full command
    full_cmd="$BASE_CMD -target_env DYLD_INSERT_LIBRARIES=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/15.0.0/lib/darwin/libclang_rt.tsan_osx_dynamic.dylib  -dump_coverage  -instrument_module $lib -- ./examples/VideoToolbox/Debug/vtdecode -m @@"

    echo "Running command: $full_cmd"
    echo "$full_cmd" >> "$output_file"

    # Run the command
    eval $full_cmd
done
