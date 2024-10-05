
# XNU Image Fuzzer | iOSOnMac | Interposing iOS Applications
Last Modified: Thursday, 02 JUN 2024 at 0800 EDT
<img src="https://xss.cx/2024/05/20/img/xnu-videotoolbox-fuzzer-objective-c-code-project-example.webp" alt="XNU Image Fuzzer OSS Project" style="height:1024px; width:1024px;"/>

## Build & Install Status

| Build OS & Device Info | Build | Install |
|------------------------|-------|---------|
| macOS 14.5 X86_64      | ✅     | ✅       |
| macOS 14.5 arm         | ✅     | ✅       |
| iPadOS 17.5            | ✅     | ✅       |
| iPhoneOS 17.5         | ✅     | ✅       |
| VisionPro 1.2          | ✅     | ✅       |
| watchOS 10.5           | ✅     | ✅       |

## XNU Image Tools
- https://github.com/xsscx/xnuimagetools

#### Project Support
- Open an Issue

### whoami
- I am David Hoyt
  - https://xss.cx
  - https://srd.cx
  - https://hoyt.net

### Project Documentation 
URL https://xss.cx/public/docs/xnuimagefuzzer/

## Quick Start
- Open as Xcode Project or Clone
- Change the Team ID
- Click Run
- Open the Files App on the Device
  - Tap Share to Transfer the new Fuzzed Images to your Desktop
  - More details below on File Transfer via Share to Desktop
- Screen Grab on iPhone 14 Pro MAX

### Target Audience
- Security Research
- Tool Developer
- Fuzzing

### Run Target Jailbroken Device
#### File Access
If you have an SRD, Jailbroken, Desktop or Virtual Device, you have access directly to the Fuzzed Files via Container.
```
Starting up...
Loading file: seed-small-7.png
Image path: /private/var/folders/pj/.../d/Wrapper/XNU Image Fuzzer.app/seed-small-7.png
...
Shift pixel values applied at Pixel[343, 407]
Enhanced fuzzing on bitmap context completed
Fuzzed image for '16bit_depth' context saved to /Users/.../Library/Containers/.../Data/Documents/fuzzed_image_16bit_depth.png
...
Fuzzed image for 'hdr_float' context saved to /Users/.../Library/Containers/.../Data/Documents/fuzzed_image_hdr_float.png
Modified UIImage with HDR and floating-point components created and saved successfully.
Completed image processing for permutation 6
```
You can copy the newly Fuzzed Files somewhere for permanent storage, perhaps more automated via .zsh.
```
cp /Users/.../Library/Containers/.../Data/Documents/fuzzed_image_16bit_depth.png ~/Documents/fuzzed/xnuimagefuzzer/png/date/time/
```
### Run Target arm64 & arm64e 
#### File Access
File Sharing is Enabled via Info.plist

#### Access Files via iTunes or the Files App

- iTunes File Sharing: Connect your iPhone to a computer, open iTunes, select your device, go to the "File Sharing" section, select your app, and you should see the files listed. You can then save them to your computer.

- Files App: Open the Files app on your iPhone, navigate to the "On My iPhone" section, tap XNU Image Fuzzer folder, and you'll see the saved images. From here, you can select and share files via AirDrop. 

## XNU Image Fuzzer Samples
- PermaLink https://srd.cx/xnu-image-fuzzer/
- Generate Random & Ballistic Images for Fuzzing https://github.com/xsscx/macos-research/tree/main/code/png
- Project Zero Bug 2225 Seed <img src="https://xss.cx/2024/02/20/img/2225.png" alt="Seed - P0-2225" style="height:32px; width:32px;"/>
- Fuzzed RBG #1 <img src="https://xss.cx/2024/02/20/img/fuzzed_image_standard_rgb.png" alt="XNU Image Fuzzer Standard RBG" style="height:32px; width:32px;"/> Fuzzed RBG #2 <img src="https://xss.cx/2024/02/20/img/fuzzed_image_standard_rgb_series2.png" alt="XNU Image Fuzzer Standard RBG #2" style="height:32px; width:32px;"/>
- Fuzzed 16-bit Depth #1 <img src="https://xss.cx/2024/02/20/img/fuzzed_image_16bit_depth.png" alt="XNU Image Fuzzer 16-bit Depth" style="height:32px; width:32px;"/> Fuzzed 16-bit Depth #2 <img src="https://xss.cx/2024/02/20/img/fuzzed_image_16bit_depth_series2.png" alt="XNU Image Fuzzer 16-bit Depth #2" style="height:32px; width:32px;"/>
- HDR Float #1 <img src="https://xss.cx/2024/02/20/img/fuzzed_image_hdr_float.png" alt="XNU Image Fuzzer HDR Float" style="height:32px; width:32px;"/> HDR Float #2 <img src="https://xss.cx/2024/02/20/img/fuzzed_image_hdr_float_series2.png" alt="XNU Image Fuzzer HDR Float #2" style="height:32px; width:32px;"/>
- NonMultipliedAlpha #1 <img src="https://xss.cx/2024/02/20/img/fuzzed_image_non_premultiplied_alpha.png" alt="XNU Image Fuzzer NonPreMultipliedAlpha" style="height:32px; width:32px;"/> NonMultipliedAlpha #2 <img src="https://xss.cx/2024/02/20/img/fuzzed_image_non_premultiplied_alpha_series2.png" alt="XNU Image Fuzzer NonPreMultipliedAlpha #2" style="height:32px; width:32px;"/>
- MultipliedAlpha #1 <img src="https://xss.cx/2024/02/20/img/fuzzed_image_premultiplied_first_alpha.png" alt="XNU Image Fuzzer PreMultipliedAlpha" style="height:32px; width:32px;"/> MultipliedAlpha #2 <img src="https://xss.cx/2024/02/20/img/fuzzed_image_premultiplied_first_alpha_series2.png" alt="XNU Image Fuzzer PreMultipliedAlpha #2" style="height:32px; width:32px;"/>

#### iPhone 14 Pro Max Render 
<img src="https://xss.cx/2024/02/26/img/xnuimagefuzzer-arm64e-sample-output-files_app-sample-file-render-iphone14promax-001.png" alt="XNU Image Fuzzer iPhone 14 Pro Max Render #1" style="height:550px; width:330px;"/> <img src="https://xss.cx/2024/02/26/img/xnuimagefuzzer-arm64e-sample-output-files_app-sample-file-render-iphone14promax-002.png" alt="XNU Image Fuzzer iPhone 14 Pro Max Render #2" style="height:550px; width:330px;"/> 

## My Code Modifications
- The Example Code begin with instrumenting a few functions as Examples
```
// Functions to create a bitmap context 
CGContextRef createBitmapContextHDRFloatComponents(size_t width, size_t height) {
CGContextRef createBitmapContextAlphaOnly(size_t width, size_t height) {
CGContextRef createBitmapContextPremultipliedFirstAlpha(size_t width, size_t height) {
CGContextRef createBitmapContextNonPremultipliedAlpha(size_t width, size_t height) {
CGContextRef createBitmapContext16BitDepth(size_t width, size_t height) {
```

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

## Compile and Run my Code
```
make
make -f Makefile.xnuimagefuzzer
```
### Roll Your Own
```
xcrun -sdk iphoneos clang -arch arm64 -g -o xnuimagefuzzer onmac/main.m interpose.dylib -framework UIKit -framework Foundation -framework CoreGraphics -framework ImageIO -framework UniformTypeIdentifiersmkdir fuzzer.app
mv fuzzer fuzzer.app/
cp Info.plist fuzzer.app/
codesign -s "@@Apple Developer Id or Ad Hoc@@" --entitlements entitlements.xml --force fuzzer.app
./runner fuzzer.app/fuzzer /mnt/png/seed.png -1
```

### Build Reproduction
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

Creating a bitmap context with CGBitmapContextCreate involves several parameters that define the characteristics of the context, such as the width, height, bit depth, bytes per row, color space, and alpha info. Varying these parameters can significantly alter the behavior and output of the context. Below are 10 permutations of the CGBitmapContextCreate function call, each demonstrating a different configuration in the Source Code [https://raw.githubusercontent.com/xsscx/macos-research/main/code/iOSOnMac/xnuimagefuzzer.m]
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
- Work in Progress.
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
## Trophy Case
- CVE-2023-46602 https://nvd.nist.gov/vuln/detail/CVE-2023-46602
- CVE-2023-46603 https://nvd.nist.gov/vuln/detail/CVE-2023-46603
- CVE-2023-46866 https://nvd.nist.gov/vuln/detail/CVE-2023-46866
- CVE-2023-46867 https://nvd.nist.gov/vuln/detail/CVE-2023-46867
- CVE-2023-47249 https://nvd.nist.gov/vuln/detail/CVE-2023-47249
- CVE-2023-48736 https://nvd.nist.gov/vuln/detail/CVE-2023-48736
- libAppleEXR - Abort()  https://github.com/xsscx/macos-research/blob/main/code/imageio/crashes/libAppleEXR-discussion-analysis.md

## References
- https://github.com/InternationalColorConsortium/DemoIccMAX/pull/53
- https://github.com/InternationalColorConsortium/DemoIccMAX/issues/54
- https://github.com/InternationalColorConsortium/DemoIccMAX/issues/58
- https://raw.githubusercontent.com/xsscx/macos-research/main/code/imageio/crashes/crash-function-YCCAtoRGBA-libappleexr-sample-001.txt

## Companions 
### XNU Image Fuzzer
- iOS App Proof of Concept https://github.com/xsscx/xnuimagefuzzer
- Generate Fuzzed Images At Scale https://github.com/xsscx/macos-research/tree/main/code/iOSOnMac
- Generate Ballistic and Random PNG Images for Fuzzing
  - https://github.com/xsscx/macos-research/tree/main/code/png
