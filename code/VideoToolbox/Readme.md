# Jackalope Fuzzing code for VideoToolbox

Last Updated 04 MAR 2024 at 1600 EST

### Target Audience
- Security Research
- Tool Developer
- Fuzzing
  
## Background
The code originated from Google Project Zero
- https://github.com/googleprojectzero/Jackalope/tree/main/examples/VideoToolbox

## Issues with TinyInst on arm64

- Complex Regex Parsing Failure: The attempt to utilize a comprehensive regex pattern for parsing a dyld map file led to failures, where the program was unable to correctly parse and populate the required data structures. 
  - This was evidenced by continuous errors and the inability to process lines expected to match the regex pattern.
- Data Structure Mismanagement: Problems with how certain data structures were utilized, leading to errors like unprocessed lines, empty module groups, and failure to handle exceptions correctly.
- Tool-Specific Limitations and Bugs: Encountered limitations and potential bugs within the used tools (e.g., compilers, debuggers, static analysis tools), which complicated the debugging process and error resolution.
- Code Refactoring Needs: Identified areas where code refactoring could enhance readability, maintainability, and reliability, particularly concerning complex logic and memory management routines.
- See URL https://github.com/xsscx/macos-research/tree/main/code/imageio/tinyinst

#### scan-build report
- https://xss.cx/2024/02/26/jackalope

## Setup this Code & Build
- Copy my CMakeLists.txt, and sample Sources to ./Jackalope-main/examples/ImageIO/
- cd ./Jackalope

## My Suggested Build
```
cd ./Jackalope
cmake  -G Xcode
cmake --build . --config Release
```
- Now you have Xcode Project
- Now you have cmake build system and binaries
## Suggested cmake clean
```
rm -rf CMakeScripts CMakeFiles Release Debug build examples/ImageIO/Release examples/ImageIO/Debug
cmake --build . --target clean
```
