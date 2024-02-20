# XNU Image Fuzzer 

Last Updated: February 20, 2024, 0000Z

This code is a stand-alone Image Fuzzer for XNU Research.

- This was built as a Cross Check for various Pixel functions
- Stand alone iOS App, command line with a default storyboard
- Xcode Project .. ready to compile...
- Got Questions? Open an Issue
- Works on iPad Pro - M2 Chip
- Works on iPhone 12 Pro, 14 Pro Max & 15 Pro Max
- arm64e code for Fuzzing, Learning or Education
 
## Background
I had been using Jackalope for Fuzzing and to confirm that it could find easy to identify Bugs.  Looking deeper I found AUF, OOB, NPTR and other issues that concealed Bugs. 

This Project is for anyone wanting to Learn & Educate on XNU Image Fuzzing. You can use Jackalope with the Example code provided in Imageio, and have your own Stand Alone XNU Image Fuzzer to expand your horizons.

Are you new to XNU? 

This Code is for you!

If you have Questions Open an Issue. This Code is meant to stimulate discussion on the Bugs that can be hit from the Remote, No-Auth position.

### Overview
This is a Stand Alone iOS Proof of Concept Fuzzer for the CreateCG Image context.
The Args passed on Launch are:
- ./Flowers.exr
- 1
- Change the second arg to shift thru the fuzzer manually

This code provides the basis for anyone to take and begin their own exploration of the XNU Image & Video Handling Code, which offer a massive exploit surface opportunity to find Bugs that may not yet be known to Apple :-)

### XNU Image Fuzzer Pictures
-XNU Image Fuzzer Xcode Sample 1
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-1.png" alt="XNU Image Fuzzer Xcode View 1" style="height:1100px; width:1500px;"/>
- XNU Image Fuzzer Xcode Sample 2
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-2.png" alt="XNU Image Fuzzer Xcode View 2" style="height:1100px; width:1500px;"/>
- XNU Image Fuzzer Xcode Sample 3
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-3.png" alt="XNU Image Fuzzer Xcode View 3" style="height:1100px; width:1500px;"/>
- XNU Image Fuzzer iPhone 14 Pro Max View 1
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-4.png" alt="XNU Image Fuzzer iPhone 14 Pro Max View 1" style="height:500px; width:400px;"/>

Have Fun!!!

### Console log
```
cx.srd.img-fuzz-001(3223,0x1f4bba240) malloc: enabling scribbling to detect mods to free blocks
Starting up...
Loading file: Flowers.exr
Image path: /private/var/containers/Bundle/Application/575279A1-2417-44E3-B97D-6B9906F996A3/cx.srd.img-fuzz-001.app/Flowers.exr
UIImage created: <UIImage:0x10740c750 anonymous {784, 734} renderingMode=automatic(original)>, Size: {width: 784.00, height: 734.00}, Scale: 1.000000, Orientation: 0
CGImage created from UIImage. Dimensions: 784 x 734
Case: Creating bitmap context with Standard RGB settings
Chunk @ 0x102498000
Chunk @ 0x1024a8000
Chunk @ 0x1024b8000
Chunk @ 0x1024c8000
Chunk @ 0x1024d8000
Chunk @ 0x1024e8000
Chunk @ 0x1026c0000
Chunk @ 0x1026d0000
Chunk @ 0x1026e0000
Chunk @ 0x1026f0000
Chunk @ 0x102700000
Chunk @ 0x102710000
Chunk @ 0x102720000
Chunk @ 0x102730000
Chunk @ 0x102740000
Chunk @ 0x102750000
Chunk @ 0x102760000
Chunk @ 0x102770000
Chunk @ 0x102780000
Chunk @ 0x102790000
Chunk @ 0x1027a0000
Chunk @ 0x1027b0000
Chunk @ 0x1027c0000
Chunk @ 0x1027d0000
Chunk @ 0x1027e0000
Chunk @ 0x1027f0000
Chunk @ 0x1029d8000
Chunk @ 0x1029e8000
Chunk @ 0x102b24000
Chunk @ 0x1051d4000
Chunk @ 0x1051e4000
Chunk @ 0x10aa00000
Chunk @ 0x10aa10000
Chunk @ 0x10aa20000
Chunk @ 0x10aa30000
Chunk @ 0x10aa40000
Chunk @ 0x10aa50000
Chunk @ 0x10aa60000
Chunk @ 0x10aa70000
Chunk @ 0x10aa80000
Chunk @ 0x10aa90000
Chunk @ 0x10aaa0000
Chunk @ 0x10aab0000
Chunk @ 0x10aac0000
Chunk @ 0x10aad0000
Chunk @ 0x10aae0000
Chunk @ 0x10aaf0000
Chunk @ 0x10ab00000
Chunk @ 0x10ab10000
Chunk @ 0x10ab20000
Chunk @ 0x10ab30000
Chunk @ 0x10ab40000
Chunk @ 0x10ab50000
Chunk @ 0x10ab60000
Chunk @ 0x10ab70000
Chunk @ 0x10ab80000
Chunk @ 0x10ab90000
Chunk @ 0x10aba0000
Chunk @ 0x10abb0000
Chunk @ 0x10abc0000
Chunk @ 0x10abd0000
Chunk @ 0x10abe0000
Chunk @ 0x10abf0000
Chunk @ 0x10ac00000
Successfully unmapped chunk @ 0x102498000
Successfully unmapped chunk @ 0x1024a8000
Successfully unmapped chunk @ 0x1024b8000
Successfully unmapped chunk @ 0x1024c8000
Successfully unmapped chunk @ 0x1024d8000
Successfully unmapped chunk @ 0x1024e8000
Successfully unmapped chunk @ 0x1026c0000
Successfully unmapped chunk @ 0x1026d0000
Successfully unmapped chunk @ 0x1026e0000
Successfully unmapped chunk @ 0x1026f0000
Successfully unmapped chunk @ 0x102700000
Successfully unmapped chunk @ 0x102710000
Successfully unmapped chunk @ 0x102720000
Successfully unmapped chunk @ 0x102730000
Successfully unmapped chunk @ 0x102740000
Successfully unmapped chunk @ 0x102750000
Successfully unmapped chunk @ 0x102760000
Successfully unmapped chunk @ 0x102770000
Successfully unmapped chunk @ 0x102780000
Successfully unmapped chunk @ 0x102790000
Successfully unmapped chunk @ 0x1027a0000
Successfully unmapped chunk @ 0x1027b0000
Successfully unmapped chunk @ 0x1027c0000
Successfully unmapped chunk @ 0x1027d0000
Successfully unmapped chunk @ 0x1027e0000
Successfully unmapped chunk @ 0x1027f0000
Successfully unmapped chunk @ 0x1029d8000
Successfully unmapped chunk @ 0x1029e8000
Successfully unmapped chunk @ 0x102b24000
Successfully unmapped chunk @ 0x1051d4000
Successfully unmapped chunk @ 0x1051e4000
Successfully unmapped chunk @ 0x10aa00000
Successfully unmapped chunk @ 0x10aa10000
Successfully unmapped chunk @ 0x10aa20000
Successfully unmapped chunk @ 0x10aa30000
Successfully unmapped chunk @ 0x10aa40000
Successfully unmapped chunk @ 0x10aa50000
Successfully unmapped chunk @ 0x10aa60000
Successfully unmapped chunk @ 0x10aa70000
Successfully unmapped chunk @ 0x10aa80000
Successfully unmapped chunk @ 0x10aa90000
Successfully unmapped chunk @ 0x10aaa0000
Successfully unmapped chunk @ 0x10aab0000
Successfully unmapped chunk @ 0x10aac0000
Successfully unmapped chunk @ 0x10aad0000
Successfully unmapped chunk @ 0x10aae0000
Successfully unmapped chunk @ 0x10aaf0000
Successfully unmapped chunk @ 0x10ab00000
Successfully unmapped chunk @ 0x10ab10000
Successfully unmapped chunk @ 0x10ab20000
Successfully unmapped chunk @ 0x10ab30000
Successfully unmapped chunk @ 0x10ab40000
Successfully unmapped chunk @ 0x10ab50000
Successfully unmapped chunk @ 0x10ab60000
Successfully unmapped chunk @ 0x10ab70000
Successfully unmapped chunk @ 0x10ab80000
Successfully unmapped chunk @ 0x10ab90000
Successfully unmapped chunk @ 0x10aba0000
Successfully unmapped chunk @ 0x10abb0000
Successfully unmapped chunk @ 0x10abc0000
Successfully unmapped chunk @ 0x10abd0000
Successfully unmapped chunk @ 0x10abe0000
Successfully unmapped chunk @ 0x10abf0000
Successfully unmapped chunk @ 0x10ac00000
Creating bitmap context with Standard RGB settings and applying fuzzing
Drawing image into the bitmap context
Before fuzzing - Basic pixel logging executed.
Applying secondary fuzzing logic to the bitmap context
After fuzzing - Basic pixel logging executed.
Creating CGImage from the modified bitmap context
Fuzzed image saved to /var/mobile/Containers/Data/Application/3FD3205B-496F-44B1-8212-C565F6E7673D/Documents/fuzzed_image.png
Modified UIImage created successfully
New image size: {784, 734}, scale: 1.000000, rendering mode: 0
Bitmap context processing complete
Bitmap context with Standard RGB settings created and fuzzing applied
Completed image processing for permutation 1
End of Run...
```
