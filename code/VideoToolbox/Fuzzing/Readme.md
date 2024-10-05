# VideoToolbox Interposing Project
<img src="https://xss.cx/2024/05/20/img/xnu-videotoolbox-fuzzer-objective-c-code-project-example.webp" alt="XNU VideoToolbox Fuzzer OSS Project" style="height:1024px; width:1024px;"/>

This project focuses on interposing and fuzzing VideoToolbox functionalities on iOS and macOS platforms. The project includes multiple build targets and tests for iOS and macOS with Interposing dylibs.

## Project Technical Summary
This project focuses on interposing VideoToolbox functionalities to facilitate fuzzing and security testing on iOS and macOS platforms. The main components include the interposing code in videotoolbox-interposer.c and the test runner in videotoolbox-runner.m. The build process is managed through multiple makefiles, providing a structured and automated way to build and test the project.

## Project Structure

- **Makefile**: Main makefile to handle the overall build process.
- **videotoolbox_build.mk**: Contains specific build instructions for VideoToolbox components.
- **videotoolbox_logging.mk**: Contains logging macros for build and run processes.
- **videotoolbox-interposer.c**: Source file for the VideoToolbox interposer.
- **videotoolbox-runner.m**: Source file for the VideoToolbox runner.

## Prerequisites

- Xcode with command line tools installed
- Access to macOS and iOS SDKs
- Properly configured codesigning identities and entitlements

## Requirements
```
sudo nvram boot-args="amfi_get_out_of_my_way=1"
sudo reboot
```
## Build Instructions

To build and test the project, follow the steps below:
```sh
make
```

## Run
- iOS
```sh
./runner ./videotoolbox-runner.app/videotoolbox-runner videotoolbox-runner.app/big.mov
```
- macOS
```sh
./videotoolbox-runner big.mov
```
## Build Reproduction
```sh
make -VERBOSE=1
[] -  Ensuring build directory exists
mkdir -p build
[] -  Starting build for runner
clang -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.5.sdk -o runner runner.c
codesign -s "79744B7FFC78720777469A82065993CA962BC8E8" --entitlements entitlements.xml --force runner
runner: replacing existing signature
[] -  Runner build completed
[] -  Starting build for runner_dist
clang -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.5.sdk -o runner_dist runner_dist.c
codesign -s "79744B7FFC78720777469A82065993CA962BC8E8" --entitlements entitlements.xml --force runner_dist
runner_dist: replacing existing signature
[] -  Runner_dist build completed
[] -  Starting build for interpose.dylib
xcrun -sdk iphoneos clang -arch arm64 -g -shared -o interpose.dylib interpose.c
[] -  Interpose.dylib build completed
[] -  Starting build for main.app
xcrun -sdk iphoneos clang -arch arm64 -g -o main main.c interpose.dylib
[] -  Creating main.app...
mkdir -p main.app
cp Info.plist main.app/
mv main main.app/
[] -  Created main.app... Codesigning....
codesign -s "79744B7FFC78720777469A82065993CA962BC8E8" --entitlements entitlements.xml --force main.app
[] -  Main.app build and packaging completed
[] -  Starting build for interpose_dist.dylib
xcrun -sdk iphoneos clang -arch arm64 -g -shared -o interpose_dist.dylib interpose_dist.c
[] -  Interpose_dist.dylib build completed
[] -  Cleaning videotoolbox-runner
rm -rf videotoolbox-runner.app videotoolbox-runner.dSYM videotoolbox-runner
[] -  videotoolbox-runner cleaned
[] -  Starting build for videotoolbox-interposer.dylib macOS
xcrun -sdk macosx clang -arch arm64 -g videotoolbox-interposer.c -o videotoolbox-interposer.dylib -dynamiclib -framework IOKit
[] -  videotoolbox-interposer.dylib macOS build completed
[] -  Starting build for videotoolbox-runner macOS
xcrun -sdk macosx clang -arch arm64 -g -o videotoolbox-runner videotoolbox-runner.m videotoolbox-interposer.dylib -framework VideoToolbox -framework Foundation -framework CoreMedia -framework CoreVideo -framework AVFoundation
[] -  videotoolbox-runner macOS build completed
[] -  Starting build for videotoolbox-interposer-arm64e.dylib iOS
xcrun -sdk iphoneos clang -arch arm64e -g videotoolbox-interposer.c -o videotoolbox-interposer-arm64e.dylib -dynamiclib -framework IOKit
[] -  videotoolbox-interposer-arm64e.dylib iOS build completed
[] -  Starting build for videotoolbox-runner.app iOS
mkdir -p videotoolbox-runner.app
xcrun -sdk iphoneos clang -arch arm64e -g -o videotoolbox-runner.app/videotoolbox-runner videotoolbox-runner.m videotoolbox-interposer-arm64e.dylib -framework VideoToolbox -framework Foundation -framework CoreMedia -framework CoreVideo -framework AVFoundation
[] -  videotoolbox-runner iOS build completed
[] -  Packaging videotoolbox-runner.app
cp Info.plist big.mov videotoolbox-runner.app
codesign -s ""79744B7FFC78720777469A82065993CA962BC8E8"" --entitlements entitlements.xml --force videotoolbox-runner.app
[] -  videotoolbox-runner.app packaged and signed
[] -  Run the Fuzzer Manually... ./runner ./videotoolbox-runner.app/videotoolbox-runner videotoolbox-runner.app/big.mov
[] -  Testing runner...
./runner main.app/main
[*] Preparing to set DYLD_INSERT_LIBRARIES for fuzzing...
[+] DYLD_INSERT_LIBRARIES set to /usr/lib/libgmalloc.dylib for fuzzing.
[+] Child process created with PID: 23019
[*] Instrumenting process with PID 23019...
[*] Attempting to attach to task with PID 23019...
[+] Successfully attached to task with PID 23019
[*] Finding patch point...
GuardMalloc[sh-23021]: Allocations will be placed on 16 byte boundaries.
GuardMalloc[sh-23021]:  - Some buffer overruns may not be noticed.
GuardMalloc[sh-23021]:  - Applications using vector instructions (e.g., SSE) should work.
GuardMalloc[sh-23021]: version 064565.58.2
GuardMalloc[bash-23021]: Allocations will be placed on 16 byte boundaries.
GuardMalloc[bash-23021]:  - Some buffer overruns may not be noticed.
GuardMalloc[bash-23021]:  - Applications using vector instructions (e.g., SSE) should work.
GuardMalloc[bash-23021]: version 064565.58.2
GuardMalloc[nm-23022]: Allocations will be placed on 16 byte boundaries.
GuardMalloc[nm-23022]:  - Some buffer overruns may not be noticed.
GuardMalloc[nm-23022]:  - Applications using vector instructions (e.g., SSE) should work.
GuardMalloc[nm-23022]: version 064565.58.2
GuardMalloc[grep-23023]: Allocations will be placed on 16 byte boundaries.
GuardMalloc[grep-23023]:  - Some buffer overruns may not be noticed.
GuardMalloc[grep-23023]:  - Applications using vector instructions (e.g., SSE) should work.
GuardMalloc[grep-23023]: version 064565.58.2
[*] _amfi_check_dyld_policy_self at offset 0x64be8 in /usr/lib/dyld
[*] Attaching to target process...
[*] Scanning for /usr/lib/dyld in target's memory...
[*] /usr/lib/dyld mapped at 0x1044dc000
[*] Patching _amfi_check_dyld_policy_self...
[+] Successfully patched _amfi_check_dyld_policy_self
[*] Sending SIGCONT to continue child
Hello World from iOS!
[*] Child exited with status 0
[] -  Testing runner_dist...
./runner_dist main.app/main
[*] Preparing to execute iOS binary main.app/main
[+] Child process created with pid: 23027
[*] Patching child process to allow dyld interposing...
[*] _amfi_check_dyld_policy_self at offset 0x64be8 in /usr/lib/dyld
[*] /usr/lib/dyld mapped at 0x10304c000
[+] Sucessfully patched _amfi_check_dyld_policy_self
[*] Sending SIGCONT to continue child
Hello World from iOS!
[*] Child exited with status 0
[] -  All Done.. Fuzzer... ./runner ./videotoolbox-runner.app/videotoolbox-runner videotoolbox-runner.app/big.mov
```

## Run iOS Interposer
```sh
./runner ./videotoolbox-runner.app/videotoolbox-runner videotoolbox-runner.app/big.mov
[*] Preparing to set DYLD_INSERT_LIBRARIES for fuzzing...
[+] DYLD_INSERT_LIBRARIES set to /usr/lib/libgmalloc.dylib for fuzzing.
[+] Child process created with PID: 23054
[*] Instrumenting process with PID 23054...
[*] Attempting to attach to task with PID 23054...
[+] Successfully attached to task with PID 23054
[*] Finding patch point...
GuardMalloc[sh-23056]: Allocations will be placed on 16 byte boundaries.
GuardMalloc[sh-23056]:  - Some buffer overruns may not be noticed.
GuardMalloc[sh-23056]:  - Applications using vector instructions (e.g., SSE) should work.
GuardMalloc[sh-23056]: version 064565.58.2
GuardMalloc[bash-23056]: Allocations will be placed on 16 byte boundaries.
GuardMalloc[bash-23056]:  - Some buffer overruns may not be noticed.
GuardMalloc[bash-23056]:  - Applications using vector instructions (e.g., SSE) should work.
GuardMalloc[bash-23056]: version 064565.58.2
GuardMalloc[nm-23057]: Allocations will be placed on 16 byte boundaries.
GuardMalloc[nm-23057]:  - Some buffer overruns may not be noticed.
GuardMalloc[nm-23057]:  - Applications using vector instructions (e.g., SSE) should work.
GuardMalloc[nm-23057]: version 064565.58.2
GuardMalloc[grep-23058]: Allocations will be placed on 16 byte boundaries.
GuardMalloc[grep-23058]:  - Some buffer overruns may not be noticed.
GuardMalloc[grep-23058]:  - Applications using vector instructions (e.g., SSE) should work.
GuardMalloc[grep-23058]: version 064565.58.2
[*] _amfi_check_dyld_policy_self at offset 0x64be8 in /usr/lib/dyld
[*] Attaching to target process...
[*] Scanning for /usr/lib/dyld in target's memory...
[*] /usr/lib/dyld mapped at 0x1004c0000
[*] Patching _amfi_check_dyld_policy_self...
[+] Successfully patched _amfi_check_dyld_policy_self
[*] Sending SIGCONT to continue child
...
2024-05-19 14:40:43.863 videotoolbox-runner[23054:2265084] Fuzzing iteration 1 with flip intensity 1, inject intensity 1, overflow intensity 1
2024-05-19 14:40:46.098 videotoolbox-runner[23054:2265084] Processing frame 0 with flip intensity 1, inject intensity 1, overflow intensity 1
GPU Info: Processing frame, File: videotoolbox-runner.m, Function: fuzz, Line: 275
Nanozonev2 0x10077c000: blocks in use: 10976, size in use: 654480 allocated size: 1327104, allocated regions: 1, region holes: 0
Current Allocation Blocks By Size Class/Context [CPU]
...
```

## Run macOS Interposer
```sh
/videotoolbox-runner
...
2024-05-19 14:42:26.773 videotoolbox-runner[23073:2266014] Fuzzing iteration 1 with flip intensity 1, inject intensity 1, overflow intensity 1
Fuzzing Step 0: Before fuzzing inputStruct, Size: 0, Buffer Address: 0x0, Intensity: 1
Fuzzing Step 0: Before fuzzing input, Size: 0, Buffer Address: 0x0, Intensity: 1
Fuzzing Step 0: Starting buffer overflow, Size: 1, Buffer Address: 0x0, Intensity: 1
Allocating buffer: Buffer Address: 0x100cbc000, Size: 1
Fuzzing Step 0: Completed buffer overflow, Size: 1, Buffer Address: 0x100cbc000, Intensity: 1
Fuzzing Step 0: Starting buffer overflow, Size: 1, Buffer Address: 0x0, Intensity: 1
Allocating buffer: Buffer Address: 0x100cbc000, Size: 1
Fuzzing Step 0: Completed buffer overflow, Size: 1, Buffer Address: 0x100cbc000, Intensity: 1
Fuzzing Step 0: After fuzzing inputStruct, Size: 0, Buffer Address: 0x0, Intensity: 1
Fuzzing Step 0: After fuzzing input, Size: 0, Buffer Address: 0x0, Intensity: 1
Fuzzing Step 1: Before fuzzing inputStruct, Size: 0, Buffer Address: 0x0, Intensity: 2
Fuzzing Step 1: Before fuzzing input, Size: 8, Buffer Address: 0x16f172620, Intensity: 2
Fuzzing Step 1: Starting bit flips, Size: 8, Buffer Address: 0x16f172620, Intensity: 2
Fuzzing Step 1: Completed bit flips, Size: 8, Buffer Address: 0x16f172620, Intensity: 2
Fuzzing Step 1: Starting data injection, Size: 8, Buffer Address: 0x16f172620, Intensity: 2
Fuzzing Step 1: Completed data injection, Size: 8, Buffer Address: 0x16f172620, Intensity: 2
```
