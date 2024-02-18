
# iOSOnMac | Interposing iOS Applications
- Original Source URL https://github.com/googleprojectzero/p0tools/tree/master/iOSOnMac
- Updated the Makefile to Build on macOS 14
- Made some changes
- Added some Examples
- Updated: Monday, 18 FEB 2024 @ 1100 EST
## Replay
```
sw_vers
ProductName:		macOS
ProductVersion:		14.1.2
```
## Updates
This Repo does the following:
- Updates the Makefile to Build the Example Project on macOS 14.1.2
- Adds some print statements to runner
- Removes legacy compile comments at top of interpose.c
- Added arm64e compile and run instructions & examples
- Added Image App Sample for command line - fuzzing is possible too...
- Added sample Fuzzing Code for Bitmap Drawing Context (ctx) .. example...

### Required
```
sudo nvram boot-args="amfi_get_out_of_my_way=1"
sudo reboot
```
### Note on Makefile, build.mk, logging.mk
- The Makefile will automatically run the Test Targets in the Makefile
- In build.mk, update your DEVELOPER_ID, or Ad Hoc Signing
- In logging.mk, you can fiddle with Verbose and things
  
## Project Build Instruction
- download source
- Update Developer Id in build.mk, Ad Hoc Signing works fine too
- open terminal
- make
- Now you have the basic distribution

## Compile and Run my Code
```
xcrun -sdk iphoneos clang -arch arm64 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.2.sdk -framework UIKit -framework Foundation -framework CoreGraphics -miphoneos-version-min=12.0 -g -o fuzzer ios-image-fuzzer-example.m interpose.dylib
mkdir fuzzer.app
mv fuzzer fuzzer.app/
cp Info.plist fuzzer.app/
codesign -s "@@Apple Developer Id or Ad Hoc@@" --entitlements entitlements.xml --force fuzzer.app
./runner fuzzer.app/fuzzer /mnt/png/seed.png
```
### Reproduction
```
% make clean
 [Clean] [iOSOnMac] Starting clean up
rm -rf runner runner_dist interpose.dylib interpose_dist.dylib main.app
 [Info] [iOSOnMac] Clean up completed
% make
 [Build] [iOSOnMac] Starting build for runner
clang -arch arm64   -g -o runner runner.c
codesign -s "79744B7FFC78720777469A82065993CA962BC8E8" --entitlements entitlements.xml --force runner
runner: replacing existing signature
 [Info] [iOSOnMac] Runner build completed
 [Build] [iOSOnMac] Starting build for runner_dist
clang -arch arm64   -g -o runner_dist runner_dist.c
codesign -s "79744B7FFC78720777469A82065993CA962BC8E8" --entitlements entitlements.xml --force runner_dist
runner_dist: replacing existing signature
 [Info] [iOSOnMac] Runner_dist build completed
 [Build] [iOSOnMac] Starting build for interpose.dylib
xcrun -sdk iphoneos clang -arch arm64   -g -shared -o interpose.dylib interpose.c
 [Info] [iOSOnMac] Interpose.dylib build completed
 [Build] [iOSOnMac] Starting build for main.app
xcrun -sdk iphoneos clang -arch arm64   -g -o main main.c interpose.dylib
[2023-11-27 08:18:35] [iOSOnMac] -  Creating main.app...
mkdir -p main.app
cp Info.plist main.app/
mv main main.app/
[2023-11-27 08:18:35] [iOSOnMac] -  Created main.app... Codesigning....
codesign -s "79744B7FFC78720777469A82065993CA962BC8E8" --entitlements entitlements.xml --force main.app
 [Info] [iOSOnMac] Main.app build and packaging completed
 [Build] [iOSOnMac] Starting build for interpose_dist.dylib
xcrun -sdk iphoneos clang -arch arm64   -g -shared -o interpose_dist.dylib interpose_dist.c
 [Info] [iOSOnMac] Interpose_dist.dylib build completed
 [Info] [iOSOnMac] Testing runner...
./runner main.app/main
[+] Child process created with pid: 99976
[*] Instrumenting process with PID 99976...
[*] Attempting to attach to task with PID 99976...
[+] Successfully attached to task with PID 99976
[*] Finding patch point...
[*] _amfi_check_dyld_policy_self at offset 0x6e728 in /usr/lib/dyld
[*] Attaching to target process...
[*] Scanning for /usr/lib/dyld in target's memory...
[*] /usr/lib/dyld mapped at 0x100f04000
[*] Patching _amfi_check_dyld_policy_self...
[+] Sucessfully patched _amfi_check_dyld_policy_self
[*] Sending SIGCONT to continue child
Hello World from iOS!
[*] Child exited with status 0
 [Info] [iOSOnMac] Runner test completed
 [Info] [iOSOnMac] Testing runner_dist...
./runner_dist main.app/main
[*] Preparing to execute iOS binary main.app/main
[+] Child process created with pid: 99987
[*] Patching child process to allow dyld interposing...
[*] _amfi_check_dyld_policy_self at offset 0x6e728 in /usr/lib/dyld
[*] /usr/lib/dyld mapped at 0x1028b0000
[+] Sucessfully patched _amfi_check_dyld_policy_self
[*] Sending SIGCONT to continue child
Hello World from iOS!
[*] Child exited with status 0
 [Info] [iOSOnMac] Runner_dist test completed
```
## iOS Image Fuzzer Example
```
 ./runner fuzzer.app/fuzzer /mnt/fuzz/cve.png
[+] Child process created with pid: 74952
[*] Instrumenting process with PID 74952...
[*] Attempting to attach to task with PID 74952...
[+] Successfully attached to task with PID 74952
[*] Finding patch point...
[*] _amfi_check_dyld_policy_self at offset 0x6e728 in /usr/lib/dyld
[*] Attaching to target process...
[*] Scanning for /usr/lib/dyld in target's memory...
[*] /usr/lib/dyld mapped at 0x104a0c000
[*] Patching _amfi_check_dyld_policy_self...
[+] Sucessfully patched _amfi_check_dyld_policy_self
[*] Sending SIGCONT to continue child
2023-11-27 21:01:37.952 ios11[74952:1516232] Starting up...
2023-11-27 21:01:37.952 ios11[74952:1516232] Valid image path: 2226.png
2023-11-27 21:01:37.952 ios11[74952:1516232] Loading file from path: 2226.png
2023-11-27 21:01:37.952 ios11[74952:1516232] Data loaded from file: 2226.png
2023-11-27 21:01:37.955 ios11[74952:1516232] UIImage created: <UIImage:0x6000020f9830 anonymous {157, 157} renderingMode=automatic(original)>
2023-11-27 21:01:37.955 ios11[74952:1516232] CGImage created from UIImage. Dimensions: 157 x 157
2023-11-27 21:01:37.955 ios11[74952:1516232] Case: Creating bitmap context with Standard RGB settings
2023-11-27 21:01:37.955 ios11[74952:1516232] Creating bitmap context with Standard RGB settings and applying fuzzing
2023-11-27 21:01:37.956 ios11[74952:1516232] Drawing image into the bitmap context
2023-11-27 21:01:37.957 ios11[74952:1516232] Applying fuzzing logic to the bitmap context
2023-11-27 21:01:37.957 ios11[74952:1516232] Before fuzzing - Pixel[64, 123]: R=255, G=0, B=0, A=0
2023-11-27 21:01:37.957 ios11[74952:1516232] Before fuzzing - Pixel[76, 4]: R=255, G=0, B=0, A=0
2023-11-27 21:01:37.958 ios11[74952:1516232] Before fuzzing - Pixel[40, 85]: R=255, G=0, B=0, A=0
2023-11-27 21:01:37.958 ios11[74952:1516232] Before fuzzing - Pixel[60, 20]: R=255, G=0, B=0, A=0
2023-11-27 21:01:37.958 ios11[74952:1516232] Before fuzzing - Pixel[88, 59]: R=255, G=0, B=0, A=0
2023-11-27 21:01:37.958 ios11[74952:1516232] After fuzzing - Pixel[23, 143]: R=234, G=0, B=48, A=0
2023-11-27 21:01:37.958 ios11[74952:1516232] After fuzzing - Pixel[41, 50]: R=246, G=33, B=0, A=0
2023-11-27 21:01:37.958 ios11[74952:1516232] After fuzzing - Pixel[53, 90]: R=255, G=14, B=0, A=0
2023-11-27 21:01:37.958 ios11[74952:1516232] After fuzzing - Pixel[71, 116]: R=255, G=46, B=49, A=0
2023-11-27 21:01:37.958 ios11[74952:1516232] After fuzzing - Pixel[147, 31]: R=255, G=22, B=20, A=0
2023-11-27 21:01:37.958 ios11[74952:1516232] Fuzzing applied to RGB components of the bitmap context
2023-11-27 21:01:37.958 ios11[74952:1516232] Creating CGImage from the modified bitmap context
2023-11-27 21:01:37.959 ios11[74952:1516232] Modified UIImage created successfully
2023-11-27 21:01:37.959 ios11[74952:1516232] New image size: {157, 157}, scale: 1.000000, rendering mode: 0
2023-11-27 21:01:37.959 ios11[74952:1516232] Bitmap context processing complete
2023-11-27 21:01:37.959 ios11[74952:1516232] Bitmap context with Standard RGB settings created and fuzzing applied
2023-11-27 21:01:37.959 ios11[74952:1516232] Completed image processing for permutation 1
2023-11-27 21:01:37.959 ios11[74952:1516232] End of Run...
[*] Child exited with status 0
```
### Bug in libAppleEXR Sample
```
2023-11-26 16:30:47.386 imagefuzzer[93171:768680] Program started. Number of arguments: 2
2023-11-26 16:30:47.386 imagefuzzer[93171:768680] Argument 0: imagefuzzer.app/imagefuzzer
2023-11-26 16:30:47.386 imagefuzzer[93171:768680] Argument 1: imagefuzzer.app/img/bug.exr
2023-11-26 16:30:47.386 imagefuzzer[93171:768680] Loading file from path: imagefuzzer.app/img/bug.exr
2023-11-26 16:30:47.386 imagefuzzer[93171:768680] Data loaded from file: imagefuzzer.app/img/bug.exr
2023-11-26 16:30:47.388 imagefuzzer[93171:768680] UIImage created: <UIImage:0x60000005d290 anonymous {784, 734} renderingMode=automatic(original)>
2023-11-26 16:30:47.388 imagefuzzer[93171:768680] CGImage created from UIImage. Dimensions: 784 x 734
2023-11-26 16:30:47.388 imagefuzzer[93171:768680] RGB color space created.
2023-11-26 16:30:47.388 imagefuzzer[93171:768680] Creating bitmap context...
2023-11-26 16:30:47.388 imagefuzzer[93171:768680] Bitmap context created.
2023-11-26 16:30:47.388 imagefuzzer[93171:768680] Drawing image in bitmap context...
libc++abi: terminating due to uncaught exception of type int
```
### Bitmap Context Notes

Creating a bitmap context with CGBitmapContextCreate involves several parameters that define the characteristics of the context, such as the width, height, bit depth, bytes per row, color space, and alpha info. Varying these parameters can significantly alter the behavior and output of the context. Below are 10 permutations of the CGBitmapContextCreate function call, each demonstrating a different configuration in the Source Code [https://raw.githubusercontent.com/xsscx/macos-research/main/code/iOSOnMac/ios-image-fuzzer-example.m]
```
Standard RGB with No Alpha:
CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, 0, colorspace, kCGImageAlphaNone);

Premultiplied First Alpha:
CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, 4 * width, colorspace, kCGImageAlphaPremultipliedFirst);

Non-Premultiplied Alpha:
CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, 4 * width, colorspace, kCGImageAlphaLast);

16-bit Depth Per Component:
CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 16, 8 * width, colorspace, kCGImageAlphaPremultipliedLast);

Grayscale Without Alpha:
CGColorSpaceRef graySpace = CGColorSpaceCreateDeviceGray();
CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, width, graySpace, kCGImageAlphaNone);
CGColorSpaceRelease(graySpace);

High Dynamic Range (HDR) with Float Components:
CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 32, 16 * width, colorspace, kCGImageAlphaPremultipliedLast | kCGBitmapFloatComponents);

Bitmap Context with Alpha Only:
CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, width, NULL, kCGImageAlphaOnly);

1-Bit Monochrome:
CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 1, width / 8, NULL, kCGImageAlphaNone);

Big Endian Pixel Format:
CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, 4 * width, colorspace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);

Little Endian Pixel Format:
CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, 4 * width, colorspace, kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Little);
```
Each permutation represents a different way of handling pixel formats, alpha channels, color spaces, and bit depths. The choice of parameters depends on the specific requirements of the image processing task at hand. For example, a grayscale context might be suitable for processing black-and-white images, while a context with HDR and float components would be more appropriate for high-quality image rendering.

## iOS App Tree Example
```
tree main.app
main.app
├── Info.plist
├── _CodeSignature
│   └── CodeResources
└── main

2 directories, 3 files
```
### My .App Bundle in bin/
```
% tree image.app
image.app
├── Info.plist
├── _CodeSignature
│   └── CodeResources
├── demo.png
└── image
```

### Other | Testing arm64e 
#### hello.c | From Apple Security Research Device | SRT 20C80 | arm64e
My Repo https://github.com/xsscx/srd/tree/main/srd_tools-24.100.3/example-cryptex
```
xcrun -sdk iphoneos clang -arch arm64e -g interpose.c -o interpose.dylib -shared
xcrun -sdk iphoneos clang  -arch arm64e -g hello.c -o hello.app/hello interpose.dylib
codesign -s "ID" --entitlements entitlements.xml --force hello.app
./runner hello.app/hello
...
codesign -dvv hello.app/hello
Executable=/Users/xss/tmp/iOSOnMac/hello.app/hello
Identifier=cx.srd.hello
Format=bundle with Mach-O thin (arm64e)
CodeDirectory v=20400 size=752 flags=0x0(none) hashes=13+7 location=embedded
Sealed Resources version=2 rules=10 files=3
Internal requirements count=1 size=172
...
./runner hello.app/hello
[+] Child process created with pid: 42536
[*] Instrumenting process with PID 42536...
[*] Attempting to attach to task with PID 42536...
[+] Successfully attached to task with PID 42536
[*] Finding patch point...
[*] _amfi_check_dyld_policy_self at offset 0x6e728 in /usr/lib/dyld
[*] Attaching to target process...
[*] Scanning for /usr/lib/dyld in target's memory...
[*] /usr/lib/dyld mapped at 0x104970000
[*] Patching _amfi_check_dyld_policy_self...
[+] Sucessfully patched _amfi_check_dyld_policy_self
[*] Sending SIGCONT to continue child
Hello researcher from pid 42536!
[*] Child exited with status 0
```
### Simple-Server Example | From Apple Security Research Device | SRT 20C80 | arm64e
My Repo https://github.com/xsscx/srd/tree/main/srd_tools-24.100.3/example-cryptex
```
% export CRYPTEX_MOUNT_PATH=./
lldb -- ./runner simple-server.app/simple-server
(lldb) target create "./runner"
Current executable set to '/Users/xss/tmp/iOSOnMac/runner' (arm64).
(lldb) settings set -- target.run-args  "simple-server.app/simple-server"
(lldb) r
Process 28561 launched: '/Users/xss/tmp/iOSOnMac/runner' (arm64)
[+] Child process created with pid: 28565
[*] Instrumenting process with PID 28565...
[*] Attempting to attach to task with PID 28565...
[+] Successfully attached to task with PID 28565
[*] Finding patch point...
[*] _amfi_check_dyld_policy_self at offset 0x6e728 in /usr/lib/dyld
[*] Attaching to target process...
[*] Scanning for /usr/lib/dyld in target's memory...
[*] /usr/lib/dyld mapped at 0x100018000
[*] Patching _amfi_check_dyld_policy_self...
[+] Sucessfully patched _amfi_check_dyld_policy_self
[*] Sending SIGCONT to continue child
2023-11-25 10:00:38.526027-0500 simple-server[28565:155085] [simple-server] Hello! I'm simple-server from the example cryptex!
2023-11-25 10:00:38.526057-0500 simple-server[28565:155085] [simple-server] I'm about to bind to 0.0.0.0:7777
2023-11-25 10:00:38.526125-0500 simple-server[28565:155085] [simple-server] I'm about to listen on fd: 3
2023-11-25 10:00:38.526143-0500 simple-server[28565:155085] [simple-server] Waiting for a client to connect...
2023-11-25 10:00:43.143281-0500 simple-server[28565:155085] [simple-server] A client has connected!
2023-11-25 10:00:43.143323-0500 simple-server[28565:155085] [simple-server] Hello! I'm process 28565
2023-11-25 10:00:43.143363-0500 simple-server[28565:155085] [simple-server] Waiting for a client to connect...
```
#### Simple-Server Check | From Apple Security Research Device | SRT 20C80 | arm64e
My Repo https://github.com/xsscx/srd/tree/main/srd_tools-24.100.3/example-cryptex
```
% telnet 127.0.0.1 7777
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
Hello! I'm process 28668
The environment variable CRYPTEX_MOUNT_PATH  contains: "/Users/xss/Documents/iphone11/com.example.cryptex.dstroot/"
```
### Platform Checks
```
otool -l main.app/main | grep platform
 platform 2
otool -l hello.app/hello | grep platform
 platform 2
otool -l interpose.dylib | grep platform
 platform 2
otool -l runner | grep platform
 platform 1
otool -l test-platform6 | grep platform
 platform 6
```
### Plaform Identifiers
```
Platform 1: macOS
Platform 2: iOS
Platform 3: tvOS
Platform 4: watchOS
Platform 5: bridgeOS
Platform 6: iOS Simulator
Platform 7: tvOS Simulator
Platform 8: watchOS Simulator
```
## Fuzzing iOS on Mac
A sample image.app for the command line and introspection is provided. This can be expanded for Fuzzing native iOS Frameworks
```
./runner image.app/image
[+] Child process created with pid: 67178
[*] Instrumenting process with PID 67178...
[*] Attempting to attach to task with PID 67178...
[+] Successfully attached to task with PID 67178
[*] Finding patch point...
[*] _amfi_check_dyld_policy_self at offset 0x6e728 in /usr/lib/dyld
[*] Attaching to target process...
[*] Scanning for /usr/lib/dyld in target's memory...
[*] /usr/lib/dyld mapped at 0x100b44000
[*] Patching _amfi_check_dyld_policy_self...
[+] Sucessfully patched _amfi_check_dyld_policy_self
[*] Sending SIGCONT to continue child
2023-11-26 13:07:18.308 image[67178:613463] Image details - Width: 157, Height: 157
^C
```
### image.app details
```
% otool -L image.app/image
image.app/image:
	/System/Library/Frameworks/UIKit.framework/UIKit (compatibility version 1.0.0, current version 7082.1.111)
	/System/Library/Frameworks/Foundation.framework/Foundation (compatibility version 300.0.0, current version 2048.1.101)
	/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics (compatibility version 64.0.0, current version 1774.0.1)
	interpose.dylib (compatibility version 0.0.0, current version 0.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1336.0.0)
	/System/Library/Frameworks/CoreFoundation.framework/CoreFoundation (compatibility version 150.0.0, current version 2048.1.101)
	/usr/lib/libobjc.A.dylib (compatibility version 1.0.0, current version 228.0.0)

% otool -l image.app/image | grep platform
 platform 2

% tree image.app
image.app
├── Info.plist
├── _CodeSignature
│   └── CodeResources
├── demo.png
└── image

2 directories, 4 files

%  codesign -dvvv image.app
Executable=/Users/xss/tmp/iOSOnMac/image.app/image
Identifier=cx.srd.image-demo
Format=bundle with Mach-O thin (arm64)
CodeDirectory v=20400 size=757 flags=0x0(none) hashes=13+7 location=embedded
Hash type=sha256 size=32
CandidateCDHash sha256=2169d9bcfa6d8b5c1493b96d5862a408e07231a2
CandidateCDHashFull sha256=2169d9bcfa6d8b5c1493b96d5862a408e07231a2f600600d1c4cc6ec5b69f4bb
Hash choices=sha256
CMSDigest=2169d9bcfa6d8b5c1493b96d5862a408e07231a2f600600d1c4cc6ec5b69f4bb
CMSDigestType=2
CDHash=2169d9bcfa6d8b5c1493b96d5862a408e07231a2
Signature size=8970
Authority=Developer ID Application: David Hoyt (7KJ5XYCA8X)
Authority=Developer ID Certification Authority
Authority=Apple Root CA
Timestamp=Nov 26, 2023 at 13:06:20
Info.plist entries=2
TeamIdentifier=7KJ5XYCA8X
Sealed Resources version=2 rules=10 files=2
Internal requirements count=1 size=180

% file image.app/image
image.app/image: Mach-O 64-bit executable arm64
```

### exr-loader.app example
```
 ./runner exr-loader.app/exr-loader
[+] Child process created with pid: 67855
[*] Instrumenting process with PID 67855...
[*] Attempting to attach to task with PID 67855...
[+] Successfully attached to task with PID 67855
[*] Finding patch point...
[*] _amfi_check_dyld_policy_self at offset 0x6e728 in /usr/lib/dyld
[*] Attaching to target process...
[*] Scanning for /usr/lib/dyld in target's memory...
[*] /usr/lib/dyld mapped at 0x100300000
[*] Patching _amfi_check_dyld_policy_self...
[+] Sucessfully patched _amfi_check_dyld_policy_self
[*] Sending SIGCONT to continue child
2023-11-26 14:33:37.773 img2[67855:652901] Image details - Width: 784, Height: 734
2023-11-26 14:33:37.773 img2[67855:652901] Creating bitmap context...
2023-11-26 14:33:37.773 img2[67855:652901] Bitmap context created.
2023-11-26 14:33:37.773 img2[67855:652901] Drawing image in bitmap context...
2023-11-26 14:33:37.777 img2[67855:652901] Image drawn in bitmap context.
```
## Interposing via dyld
- The Example is just a placeholder, working on an Implementation for main.app
- Work in Progress.. any input appreciated
```
Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_PROTECTION_FAILURE at 0x000000016a797ff0
Exception Codes:       0x0000000000000002, 0x000000016a797ff0

Termination Reason:    Namespace SIGNAL, Code 11 Segmentation fault: 11
Terminating Process:   exc handler [98805]

VM Region Info: 0x16a797ff0 is in 0x166f94000-0x16a798000;  bytes after start: 58736624  bytes before end: 15
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      MALLOC_SMALL                136800000-137000000    [ 8192K] rw-/rwx SM=PRV  
      GAP OF 0x2ff94000 BYTES
--->  STACK GUARD                 166f94000-16a798000    [ 56.0M] ---/rwx SM=NUL  ... for thread 0
      Stack                       16a798000-16af94000    [ 8176K] rw-/rwx SM=SHM  thread 0

Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   interpose.dylib               	       0x1052d7f04 my_puts + 4 (interpose.c:9)
1   interpose.dylib               	       0x1052d7f60 my_puts + 96 (interpose.c:16)
2   interpose.dylib               	       0x1052d7f60 my_puts + 96 (interpose.c:16)
...
509 interpose.dylib               	       0x1052d7f60 my_puts + 96 (interpose.c:16)
510 interpose.dylib               	       0x1052d7f60 my_puts + 96 (interpose.c:16)


Thread 0 crashed with ARM Thread State (64-bit):
    x0: 0x00000001052d7f7d   x1: 0x000000001f08000c   x2: 0x00000001052d7f00   x3: 0x0000000000000000
    x4: 0x0000000000000000   x5: 0x0000000000000000   x6: 0x0000000000000000   x7: 0x0000000000000000
    x8: 0x00000001052d7f00   x9: 0xce59a7ff2b04006a  x10: 0x000000018d775510  x11: 0x00000000002d33b0
   x12: 0x0000000000000002  x13: 0x00000001802d2000  x14: 0x000000000007effc  x15: 0x0000000000008000
   x16: 0x0000000000000000  x17: 0x00000001052d7f00  x18: 0x0000000000000000  x19: 0x0000000105281bd0
   x20: 0x0000000104e6ff50  x21: 0x000000016af933f0  x22: 0x0000000105281910  x23: 0x000000016af93470
   x24: 0x000000016af934b0  x25: 0x000000018d5b45bb  x26: 0x0000000000000000  x27: 0x0000000000000000
   x28: 0x0000000000000000   fp: 0x000000016a798010   lr: 0x00000001052d7f60
    sp: 0x000000016a797fe0   pc: 0x00000001052d7f04 cpsr: 0x20001000
   far: 0x000000016a797ff0  esr: 0x92000047 (Data Abort) byte write Translation fault

Binary Images:
       0x1052d4000 -        0x1052d7fff interpose.dylib (*) <a38112e0-f0c4-31cd-9928-9f6cf7d46246> /Users/USER/*/interpose.dylib
       0x104e6c000 -        0x104e6ffff cx.srd.main-interpose (*) <0271c554-7512-3030-b2a1-931053c3f5ec> /Users/USER/*/main.app/main
               0x0 - 0xffffffffffffffff ??? (*) <00000000-0000-0000-0000-000000000000> ???
       0x18d74a000 -        0x18d7c8ffb libsystem_c.dylib (*) <decb8685-f34a-3979-afcb-71fb55747e41> /usr/lib/system/libsystem_c.dylib
       0x18d52f000 -        0x18d5c3317 dyld (*) <ec7a3ba0-f9bf-3ab8-a0f4-8622e5606b20> /usr/lib/dyld
...
```

### env vars
```
export CG_PDF_VERBOSE=1
export CG_CONTEXT_SHOW_BACKTRACE=1
export CG_CONTEXT_SHOW_BACKTRACE_ON_ERROR=1
export CG_IMAGE_SHOW_MALLOC=1
export CG_LAYER_SHOW_BACKTRACE=1
export CGBITMAP_CONTEXT_LOG=1
export CGCOLORDATAPROVIDER_VERBOSE=1
export CGPDF_LOG_PAGES=1
export CGBITMAP_CONTEXT_LOG_ERRORS=1
export CG_RASTERIZER_VERBOSE=1
export CG_VERBOSE_COPY_IMAGE_BLOCK_DATA=1
export CG_VERBOSE=1
export CGPDF_VERBOSE=1
export CG_FONT_RENDERER_VERBOSE=1
export CGPDF_DRAW_VERBOSE=1
export CG_POSTSCRIPT_VERBOSE=1
export CG_COLOR_CONVERSION_VERBOSE=1
export CG_IMAGE_LOG_FORCE=1
export CG_INFO=1
export CGPDFCONTEXT_VERBOSE=1
export QuartzCoreDebugEnabled=1
export CI_PRINT_TREE=1
```
