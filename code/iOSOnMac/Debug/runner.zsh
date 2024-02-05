#!/bin/zsh

# Output file for logging command lines
output_file="cli.txt"

# List of graphics-related dylibs
libraries=(
    "ImageIO"
    "CoreGraphics"
    "IOSurface"
    "Accelerate"
    "AppleJPEG"
    "ColorSync"
    "libPng.dylib"
    "libTIFF.dylib"
    "libGIF.dylib"
    "libJP2.dylib"
    "libJPEG.dylib"
    "libRadiance.dylib"
    "Metal"
    "CoreImage"
    "OpenGL"
    "OpenCL"
    "vImage"
    "vecLib"
    "libvMisc.dylib"
    "libvDSP.dylib"
    "libBLAS.dylib"
    "libLAPACK.dylib"
    "libLinearAlgebra.dylib"
    "libSparseBLAS.dylib"
    "libBNNS.dylib"
    "libSparse.dylib"
    "MIL"
    "CoreSVG"
    "CoreText"
    "PhotosensitivityProcessing"
    "libGLU.dylib"
    "libGFXShared.dylib"
    "libGL.dylib"
    "libGLImage.dylib"
    "libCVMSPluginSupport.dylib"
    "libCoreVMClient.dylib"
    "MPSCore"
    "MPSImage"
    "MPSNeuralNetwork"
    "MPSMatrix"
    "MPSRayIntersector"
    "MPSNDArray"
    "MPSFunctions"
    "MPSBenchmarkLoop"
    "MetalTools"
    "IOAccelerator"
    "CoreVideo"
    "MetalPerformanceShaders"
    "QuartzCore"
    "CoreAVCHD"
    "Mangrove"
    "libCGInterfaces.dylib"
)

# Base part of the command
BASE_CMD="stdbuf -oL ./fuzzer -in /Users/xss/Documents/png/ -out /tmp/out -t 200 -t1 5000 -delivery shmem -target_module test_imageio -target_method _fuzz -nargs 1 -iterations 10000 -persist -loop -cmp_coverage -generate_unwind -nthreads 20"

# Iterate over each library
for lib in $libraries; do
    # Construct the full command
    full_cmd="$BASE_CMD -instrument_module $lib -- ../examples/ImageIO/Debug/test_imageio -m @@ | grep -E 'Fuzzer version|input files read|Running input sample|Total execs|Unique samples|Crashes|Hangs|Offsets|Execs/s|WARNING|Width'"
    
    echo "Running command: $full_cmd"
    echo "$full_cmd" >> "$output_file"
    
    # Run the command
    eval $full_cmd
done

