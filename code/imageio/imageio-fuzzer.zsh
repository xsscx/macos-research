#!/bin/zsh

# Output file for logging command lines
output_file="cli.txt"

# List of graphics-related dylibs
libraries=(
    "Accelerate"
    "AppleJPEG"
    "ColorSync"
    "ColorSyncLegacy"
    "CoreAVCHD"
    "CoreGraphics"
    "CoreImage"
    "CoreSVG"
    "CoreText"
    "CoreVideo"
    "IOAccelerator"
    "IOSurface"
    "ImageIO"
    "MIL"
    "MPSBenchmarkLoop"
    "MPSCore"
    "MPSFunctions"
    "MPSImage"
    "MPSMatrix"
    "MPSNDArray"
    "MPSNeuralNetwork"
    "MPSRayIntersector"
    "Mangrove"
    "Metal"
    "MetalPerformanceShaders"
    "MetalTools"
    "OpenCL"
    "OpenGL"
    "OpenGL"
    "PhotosensitivityProcessing"
    "QuartzCore"
    "UniformTypeIdentifiers"
    "libBLAS.dylib"
    "libBNNS.dylib"
    "libCGInterfaces.dylib"
    "libCVMSPluginSupport.dylib"
    "libCoreVMClient.dylib"
    "libGFXShared.dylib"
    "libGIF.dylib"
    "libGL.dylib"
    "libGLImage.dylib"
    "libGLU.dylib"
    "libJP2.dylib"
    "libJPEG.dylib"
    "libLAPACK.dylib"
    "libLinearAlgebra.dylib"
    "libPng.dylib"
    "libRadiance.dylib"
    "libSparse.dylib"
    "libSparseBLAS.dylib"
    "libTIFF.dylib"
    "libvDSP.dylib"
    "libvMisc.dylib"
    "vImage"
    "vecLib" 
)

# Base part of the command
BASE_CMD="stdbuf -oL ./fuzzer -in /mnt/fuzz/png/ -out /mnt/fuzz/png/out -t 200 -t1 5000 -delivery shmem -target_module test_imageio -target_method _fuzz -nargs 1 -iterations 10000 -persist -loop -cmp_coverage -generate_unwind -nthreads 20"

# Iterate over each library
for lib in $libraries; do
    # Construct the full command
    full_cmd="$BASE_CMD -instrument_module $lib -- ../examples/ImageIO/Debug/test_imageio -m @@ | grep -E 'Fuzzer version|input files read|Running input sample|Total execs|Unique samples|Crashes|Hangs|Offsets|Execs/s|WARNING|Width|Sanitizer|Hint|DEADLY'"
    
    echo "Running command: $full_cmd"
    echo "$full_cmd" >> "$output_file"
    
    # Run the command
    eval $full_cmd
done
