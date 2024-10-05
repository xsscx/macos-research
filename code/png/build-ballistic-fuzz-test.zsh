#!/usr/bin/env zsh

# Compile the program with profiling enabled
clang++  -fprofile-instr-generate -fcoverage-mapping -mllvm -runtime-counter-relocation -g -fsanitize=undefined -O0 -o ballistic-fuzz-sample-001.cpp ballistic-fuzz-sample-001 -std=c++11 `Magick++-config --cppflags --cxxflags --ldflags --libs`

# Check if compilation was successful
if [[ $? != 0 ]]; then
    echo "Compilation failed. Exiting."
    exit 1
fi

# Run the program to generate the profiling data
LLVM_PROFILE_FILE=default.profraw ./ballistic-fuzz-sample-001

# Merge the profiling data
xcrun llvm-profdata merge -sparse default.profraw -o a.profdata

# Generate the textual report
xcrun llvm-cov report ./ballistic-fuzz-sample-001 -instr-profile=a.profdata

# Generate the HTML report and save it to a directory
xcrun llvm-cov show ./ballistic-fuzz-sample-001 -instr-profile=a.profdata -format=html -output-dir=./coverage_report

# Alternatively, if you prefer a single HTML file, uncomment the line below:
xcrun llvm-cov show ./ballistic-fuzz-sample-001 -instr-profile=a.profdata --format=html > coverage.html

echo "Done!"


