# XNU Image Fuzzer 

Last Updated: February 20, 2024, 1434 EST

This code is a stand-alone Image Fuzzer for XNU Research.
- This was built as a Cross Check for various Pixel functions
- Stand alone iOS App, command line with a default storyboard
- Xcode Project .. ready to compile...
- Got Questions? Open an Issue
- Works on iPad Pro - M2 Chip
- Works on iPhone 12 Pro, 14 Pro Max & 15 Pro Max
- arm64e code for Fuzzing, Learning or Education

## Quick Start
- Create a new iOS Application in Xcode
- Copy the Source File and Paste into main.m [https://github.com/xsscx/macos-research/blob/main/code/iOSOnMac/cx.srd.img-fuzz-001/cx.srd.img-fuzz-001/cx.srd.img-fuzz-001/main.m]
- Copy the Flowers.exr image into your XCode Project
- Edit the Scheme
  - For Arguements on Launch
    - Flowers.exr
    - -1
- Build & Run
- You can look at the pictures below to make sure you have added the Args Passed on Launch correctly.

## C++ Source Code
https://github.com/xsscx/macos-research/blob/main/code/iOSOnMac/cx.srd.img-fuzz-001/cx.srd.img-fuzz-001/cx.srd.img-fuzz-001/main.m

## Background
I had been using Jackalope for Fuzzing and to confirm that it could find easy to identify Bugs. Looking deeper at Jackalope, I found AUF, OOB, NPTR that impacted some results given the Seeding. I wrote this C++ XNU Image Fuzzer for A/B Testing along side Jackalope. The Results were so Interesting I imcrased this Fuzzer Scope, enjoy!

This Project is for anyone wanting to Learn C++ or XNU Image Fuzzing. 

You can use Jackalope with the Example code provided higher up the Repo in Imageio [https://github.com/xsscx/macos-research/blob/main/code/iOSOnMac/ios-image-fuzzer-example.m], and have your own Code running the XNU Image Fuzzer to expand your horizons.

Are you new to XNU? 

This Code is for you!

If you have Questions, then Open an Issue. 

This Code is meant to stimulate discussion on the Bugs that can be hit from the Remote, No-Auth position.

### Overview
This is an XCode Project contianing a iOS Proof of Concept Fuzzer for the CreateCG Image and CGColorSpace Context
The Args passed on Launch are:
- Flowers.exr
- -1
- Change the second arg to shift thru the fuzzer manually

This code provides the basis for anyone to take and begin their own exploration of the XNU Image & Video Handling Code, which offer a massive exploit surface opportunity to find Bugs that may not yet be known to Apple :-)

### XNU Image Fuzzer Pictures
- XNU Image Fuzzer Xcode Sample 1
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-11.png" alt="XNU Image Fuzzer Xcode View 1" style="height:1100px; width:1500px;"/>

- XNU Image Fuzzer Xcode Sample 2
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-22.png" alt="XNU Image Fuzzer Xcode View 2" style="height:1100px; width:1500px;"/>

- XNU Image Fuzzer Xcode Sample 3
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-3.png" alt="XNU Image Fuzzer Xcode View 3" style="height:1100px; width:1500px;"/>

- XNU Image Fuzzer iPhone 14 Pro Max View 1
<img src="https://xss.cx/2024/02/20/img/xnu-image-fuzzer-xcode-sample-screenshot-poc-4.png" alt="XNU Image Fuzzer iPhone 14 Pro Max View 1" style="height:500px; width:400px;"/>

## Code WIP
Currently working on adding a BOOL to the processImage() function
```
void processImage(UIImage *image, int permutation) {
     CGImageRef cgImg = [image CGImage];
     if (!cgImg) {
         NSLog(@"Failed to get CGImage from UIImage.");
         return;
     }
     NSLog(@"CGImage created from UIImage. Dimensions: %zu x %zu", CGImageGetWidth(cgImg), CGImageGetHeight(cgImg));

     if (permutation == -1) {
         for (int i = 1; i <= 12; i++) {
+            BOOL success = YES; // Assume success until proven otherwise
             switch (i) {
                 case 1:
                     NSLog(@"Case: Creating bitmap context with Standard RGB settings");
-                    createBitmapContextStandardRGB(cgImg, i);
+                    success = createBitmapContextStandardRGB(cgImg, i);
                     break;
                 case 2:
                     NSLog(@"Case: Creating bitmap context with Premultiplied First Alpha settings");
-                    createBitmapContextPremultipliedFirstAlpha(cgImg);
+                    success = createBitmapContextPremultipliedFirstAlpha(cgImg);
                     break;
                 // Implement similar success checks for cases 3 through 11.
                 case 4:
                     NSLog(@"Case: Creating bitmap context with 16-bit depth settings");
-                    createBitmapContext16BitDepth(cgImg);
+                    success = createBitmapContext16BitDepth(cgImg);
+                    if (!success) {
+                        NSLog(@"Failed to create bitmap context with 16-bit Depth settings");
+                    }
                     break;
                 // Insert additional cases here...
                 case 12:
                     NSLog(@"Case: Creating bitmap context with 32-bit float, 4-component settings");
-                    createBitmapContext32BitFloat4Component(cgImg);
+                    success = createBitmapContext32BitFloat4Component(cgImg);
                     break;
                 default:
                     NSLog(@"Unexpected case number %d", i);
+                    success = NO; // Mark as failure for unexpected cases
                     break;
             }
+            if (success) {
+                NSLog(@"Completed image processing for permutation %d", i);
+            } else {
+                NSLog(@"Failed image processing for permutation %d", i);
+                // You could add additional error recovery or logging here if needed
+            }
         }
     } else {
         // Similar logic for handling a single permutation with error checking
         // Ensure the specific function called for the single permutation also follows this pattern
     }
 }

```

### Console log
```
cx.srd.img-fuzz-001(3276,0x1f4bba240) malloc: enabling scribbling to detect mods to free blocks
Starting up...
Loading file: Flowers.exr
Image path: /private/var/containers/Bundle/Application/CE39E385-81DC-4E89-A875-0E00B05337D0/cx.srd.img-fuzz-001.app/Flowers.exr
UIImage created: <UIImage:0x107e0c750 anonymous {784, 734} renderingMode=automatic(original)>, Size: {width: 784.00, height: 734.00}, Scale: 1.000000, Orientation: 0
CGImage created from UIImage. Dimensions: 784 x 734
Case: Creating bitmap context with Standard RGB settings
Chunk @ 0x102de0000
Chunk @ 0x102df0000
Chunk @ 0x102fc0000
Chunk @ 0x102fd0000
Chunk @ 0x102fe0000
Chunk @ 0x102ff0000
Chunk @ 0x103000000
Chunk @ 0x103010000
Chunk @ 0x103020000
Chunk @ 0x103030000
Chunk @ 0x103040000
Chunk @ 0x103050000
Chunk @ 0x103060000
Chunk @ 0x103070000
Chunk @ 0x103080000
Chunk @ 0x103090000
Chunk @ 0x1030a0000
Chunk @ 0x1030b0000
Chunk @ 0x1030c0000
Chunk @ 0x1030d0000
Chunk @ 0x1030e0000
Chunk @ 0x1030f0000
Chunk @ 0x103100000
Chunk @ 0x103110000
Chunk @ 0x103120000
Chunk @ 0x105bd0000
Chunk @ 0x105be0000
Chunk @ 0x105bf0000
Chunk @ 0x10b400000
Chunk @ 0x10b410000
Chunk @ 0x10b420000
Chunk @ 0x10b430000
Chunk @ 0x10b440000
Chunk @ 0x10b450000
Chunk @ 0x10b460000
Chunk @ 0x10b470000
Chunk @ 0x10b480000
Chunk @ 0x10b490000
Chunk @ 0x10b4a0000
Chunk @ 0x10b4b0000
Chunk @ 0x10b4c0000
Chunk @ 0x10b4d0000
Chunk @ 0x10b4e0000
Chunk @ 0x10b4f0000
Chunk @ 0x10b500000
Chunk @ 0x10b510000
Chunk @ 0x10b520000
Chunk @ 0x10b530000
Chunk @ 0x10b540000
Chunk @ 0x10b550000
Chunk @ 0x10b560000
Chunk @ 0x10b570000
Chunk @ 0x10b580000
Chunk @ 0x10b590000
Chunk @ 0x10b5a0000
Chunk @ 0x10b5b0000
Chunk @ 0x10b5c0000
Chunk @ 0x10b5d0000
Chunk @ 0x10b5e0000
Chunk @ 0x10b5f0000
Chunk @ 0x10b600000
Chunk @ 0x10b610000
Chunk @ 0x10b620000
Chunk @ 0x10b630000
Successfully unmapped chunk @ 0x102de0000
Successfully unmapped chunk @ 0x102df0000
Successfully unmapped chunk @ 0x102fc0000
Successfully unmapped chunk @ 0x102fd0000
Successfully unmapped chunk @ 0x102fe0000
Successfully unmapped chunk @ 0x102ff0000
Successfully unmapped chunk @ 0x103000000
Successfully unmapped chunk @ 0x103010000
Successfully unmapped chunk @ 0x103020000
Successfully unmapped chunk @ 0x103030000
Successfully unmapped chunk @ 0x103040000
Successfully unmapped chunk @ 0x103050000
Successfully unmapped chunk @ 0x103060000
Successfully unmapped chunk @ 0x103070000
Successfully unmapped chunk @ 0x103080000
Successfully unmapped chunk @ 0x103090000
Successfully unmapped chunk @ 0x1030a0000
Successfully unmapped chunk @ 0x1030b0000
Successfully unmapped chunk @ 0x1030c0000
Successfully unmapped chunk @ 0x1030d0000
Successfully unmapped chunk @ 0x1030e0000
Successfully unmapped chunk @ 0x1030f0000
Successfully unmapped chunk @ 0x103100000
Successfully unmapped chunk @ 0x103110000
Successfully unmapped chunk @ 0x103120000
Successfully unmapped chunk @ 0x105bd0000
Successfully unmapped chunk @ 0x105be0000
Successfully unmapped chunk @ 0x105bf0000
Successfully unmapped chunk @ 0x10b400000
Successfully unmapped chunk @ 0x10b410000
Successfully unmapped chunk @ 0x10b420000
Successfully unmapped chunk @ 0x10b430000
Successfully unmapped chunk @ 0x10b440000
Successfully unmapped chunk @ 0x10b450000
Successfully unmapped chunk @ 0x10b460000
Successfully unmapped chunk @ 0x10b470000
Successfully unmapped chunk @ 0x10b480000
Successfully unmapped chunk @ 0x10b490000
Successfully unmapped chunk @ 0x10b4a0000
Successfully unmapped chunk @ 0x10b4b0000
Successfully unmapped chunk @ 0x10b4c0000
Successfully unmapped chunk @ 0x10b4d0000
Successfully unmapped chunk @ 0x10b4e0000
Successfully unmapped chunk @ 0x10b4f0000
Successfully unmapped chunk @ 0x10b500000
Successfully unmapped chunk @ 0x10b510000
Successfully unmapped chunk @ 0x10b520000
Successfully unmapped chunk @ 0x10b530000
Successfully unmapped chunk @ 0x10b540000
Successfully unmapped chunk @ 0x10b550000
Successfully unmapped chunk @ 0x10b560000
Successfully unmapped chunk @ 0x10b570000
Successfully unmapped chunk @ 0x10b580000
Successfully unmapped chunk @ 0x10b590000
Successfully unmapped chunk @ 0x10b5a0000
Successfully unmapped chunk @ 0x10b5b0000
Successfully unmapped chunk @ 0x10b5c0000
Successfully unmapped chunk @ 0x10b5d0000
Successfully unmapped chunk @ 0x10b5e0000
Successfully unmapped chunk @ 0x10b5f0000
Successfully unmapped chunk @ 0x10b600000
Successfully unmapped chunk @ 0x10b610000
Successfully unmapped chunk @ 0x10b620000
Successfully unmapped chunk @ 0x10b630000
Creating bitmap context with Standard RGB settings and applying fuzzing
Drawing image into the bitmap context
Before fuzzing - Basic pixel logging executed.
Applying secondary fuzzing logic to the bitmap context
After fuzzing - Basic pixel logging executed.
Creating CGImage from the modified bitmap context
Fuzzed image saved to /var/mobile/Containers/Data/Application/64F831C7-A853-4D03-9DB1-727B57E5B732/Documents/fuzzed_image.png
Modified UIImage created successfully
New image size: {784, 734}, scale: 1.000000, rendering mode: 0
Bitmap context processing complete
Bitmap context with Standard RGB settings created and fuzzing applied
Completed image processing for permutation 1
Case: Creating bitmap context with Premultiplied First Alpha settings
Creating bitmap context with Premultiplied First Alpha settings and applying fuzzing
Drawing image into the bitmap context
Applying fuzzing logic to the bitmap context
Fuzzing applied to RGB components of the bitmap context
Creating CGImage from the modified bitmap context
Modified UIImage created successfully
New image size: {784, 734}, scale: 1.000000, rendering mode: 0
Bitmap context with Premultiplied First Alpha settings created and fuzzing applied
Completed image processing for permutation 2
Case: Creating bitmap context with Non-Premultiplied Alpha settings
Creating bitmap context with Non-Premultiplied Alpha settings and applying fuzzing

CGBitmapContextCreate: unsupported parameter combination:
 	RGB 
	8 bits/component, integer
 	3136 bytes/row
	kCGImageAlphaLast
	kCGImageByteOrderDefault
	kCGImagePixelFormatPacked
	Valid parameters for RGB color space model are:
	16  bits per pixel,		 5  bits per component,		 kCGImageAlphaNoneSkipFirst
	32  bits per pixel,		 8  bits per component,		 kCGImageAlphaNoneSkipFirst
	32  bits per pixel,		 8  bits per component,		 kCGImageAlphaNoneSkipLast
	32  bits per pixel,		 8  bits per component,		 kCGImageAlphaPremultipliedFirst
	32  bits per pixel,		 8  bits per component,		 kCGImageAlphaPremultipliedLast
	32  bits per pixel,		 10 bits per component,		 kCGImageAlphaNone|kCGImagePixelFormatRGBCIF10|kCGImageByteOrder16Little
	64  bits per pixel,		 16 bits per component,		 kCGImageAlphaPremultipliedLast
	64  bits per pixel,		 16 bits per component,		 kCGImageAlphaNoneSkipLast
	64  bits per pixel,		 16 bits per component,		 kCGImageAlphaPremultipliedLast|kCGBitmapFloatComponents|kCGImageByteOrder16Little
	64  bits per pixel,		 16 bits per component,		 kCGImageAlphaNoneSkipLast|kCGBitmapFloatComponents|kCGImageByteOrder16Little
	128 bits per pixel,		 32 bits per component,		 kCGImageAlphaPremultipliedLast|kCGBitmapFloatComponents
	128 bits per pixel,		 32 bits per component,		 kCGImageAlphaNoneSkipLast|kCGBitmapFloatComponents
See Quartz 2D Programming Guide (available online) for more information.
Failed to create bitmap context with Non-Premultiplied Alpha settings
Completed image processing for permutation 3
Case: Creating bitmap context with 16-bit depth settings
Creating bitmap context with 16-bit Depth settings and applying fuzzing

CGBitmapContextCreate: unsupported parameter combination:
 	RGB 
	16 bits/component, integer
 	6272 bytes/row
	kCGImageAlphaPremultipliedFirst
	kCGImageByteOrderDefault
	kCGImagePixelFormatPacked
	Valid parameters for RGB color space model are:
	16  bits per pixel,		 5  bits per component,		 kCGImageAlphaNoneSkipFirst
	32  bits per pixel,		 8  bits per component,		 kCGImageAlphaNoneSkipFirst
	32  bits per pixel,		 8  bits per component,		 kCGImageAlphaNoneSkipLast
	32  bits per pixel,		 8  bits per component,		 kCGImageAlphaPremultipliedFirst
	32  bits per pixel,		 8  bits per component,		 kCGImageAlphaPremultipliedLast
	32  bits per pixel,		 10 bits per component,		 kCGImageAlphaNone|kCGImagePixelFormatRGBCIF10|kCGImageByteOrder16Little
	64  bits per pixel,		 16 bits per component,		 kCGImageAlphaPremultipliedLast
	64  bits per pixel,		 16 bits per component,		 kCGImageAlphaNoneSkipLast
	64  bits per pixel,		 16 bits per component,		 kCGImageAlphaPremultipliedLast|kCGBitmapFloatComponents|kCGImageByteOrder16Little
	64  bits per pixel,		 16 bits per component,		 kCGImageAlphaNoneSkipLast|kCGBitmapFloatComponents|kCGImageByteOrder16Little
	128 bits per pixel,		 32 bits per component,		 kCGImageAlphaPremultipliedLast|kCGBitmapFloatComponents
	128 bits per pixel,		 32 bits per component,		 kCGImageAlphaNoneSkipLast|kCGBitmapFloatComponents
See Quartz 2D Programming Guide (available online) for more information.
Failed to create bitmap context with 16-bit Depth settings
Completed image processing for permutation 4
Grayscale image processing is currently pending implementation.
...
Random noise applied at Pixel[699, 733]
Shift pixel values applied at Pixel[700, 733]
Conditional color swap at Pixel[701, 733]
Random color set at Pixel[702, 733]
Random noise applied at Pixel[703, 733]
Inversion applied at Pixel[704, 733]
Inversion applied at Pixel[705, 733]
Random noise applied at Pixel[706, 733]
Conditional color swap at Pixel[707, 733]
Shift pixel values applied at Pixel[708, 733]
Random noise applied at Pixel[709, 733]
Conditional color swap at Pixel[710, 733]
Shift pixel values applied at Pixel[711, 733]
Extreme contrast adjustment at Pixel[712, 733]
Inversion applied at Pixel[713, 733]
Extreme contrast adjustment at Pixel[714, 733]
Extreme contrast adjustment at Pixel[715, 733]
Shift pixel values applied at Pixel[716, 733]
Random color set at Pixel[717, 733]
Random color set at Pixel[718, 733]
Shift pixel values applied at Pixel[719, 733]
Shift pixel values applied at Pixel[720, 733]
Shift pixel values applied at Pixel[721, 733]
Random noise applied at Pixel[722, 733]
Random noise applied at Pixel[723, 733]
Random noise applied at Pixel[724, 733]
Random color set at Pixel[725, 733]
Conditional color swap at Pixel[726, 733]
Random noise applied at Pixel[727, 733]
Random color set at Pixel[728, 733]
Shift pixel values applied at Pixel[729, 733]
Random color set at Pixel[730, 733]
Inversion applied at Pixel[731, 733]
Inversion applied at Pixel[732, 733]
Random color set at Pixel[733, 733]
Random color set at Pixel[734, 733]
Extreme contrast adjustment at Pixel[735, 733]
Conditional color swap at Pixel[736, 733]
Random noise applied at Pixel[737, 733]
Random color set at Pixel[738, 733]
Extreme contrast adjustment at Pixel[739, 733]
Random color set at Pixel[740, 733]
Inversion applied at Pixel[741, 733]
Random noise applied at Pixel[742, 733]
Random color set at Pixel[743, 733]
Extreme contrast adjustment at Pixel[744, 733]
Random color set at Pixel[745, 733]
Random color set at Pixel[746, 733]
Random noise applied at Pixel[747, 733]
Random color set at Pixel[748, 733]
Random noise applied at Pixel[749, 733]
Random color set at Pixel[750, 733]
Extreme contrast adjustment at Pixel[751, 733]
Shift pixel values applied at Pixel[752, 733]
Inversion applied at Pixel[753, 733]
Extreme contrast adjustment at Pixel[754, 733]
Shift pixel values applied at Pixel[755, 733]
Random noise applied at Pixel[756, 733]
Extreme contrast adjustment at Pixel[757, 733]
Conditional color swap at Pixel[758, 733]
Extreme contrast adjustment at Pixel[759, 733]
Random color set at Pixel[760, 733]
Random noise applied at Pixel[761, 733]
Random noise applied at Pixel[762, 733]
Inversion applied at Pixel[763, 733]
Random noise applied at Pixel[764, 733]
Random noise applied at Pixel[765, 733]
Random noise applied at Pixel[766, 733]
Shift pixel values applied at Pixel[767, 733]
Inversion applied at Pixel[768, 733]
Inversion applied at Pixel[769, 733]
Shift pixel values applied at Pixel[770, 733]
Inversion applied at Pixel[771, 733]
Random color set at Pixel[772, 733]
Inversion applied at Pixel[773, 733]
Shift pixel values applied at Pixel[774, 733]
Random color set at Pixel[775, 733]
Extreme contrast adjustment at Pixel[776, 733]
Shift pixel values applied at Pixel[777, 733]
Extreme contrast adjustment at Pixel[778, 733]
Random color set at Pixel[779, 733]
Random color set at Pixel[780, 733]
Shift pixel values applied at Pixel[781, 733]
Random noise applied at Pixel[782, 733]
Shift pixel values applied at Pixel[783, 733]
Enhanced fuzzing on bitmap context completed
After fuzzing - Logging 5 random pixels:
After fuzzing - Pixel[188, 620]: R=0, G=0, B=0, A=0
After fuzzing - Pixel[112, 699]: R=128, G=128, B=128, A=0
After fuzzing - Pixel[597, 467]: R=0, G=24, B=0, A=13
After fuzzing - Pixel[160, 183]: R=37, G=126, B=125, A=0
After fuzzing - Pixel[624, 224]: R=0, G=0, B=0, A=0
Creating CGImage from the modified bitmap context
Fuzzed image saved to /var/mobile/Containers/Data/Application/1CBCFB1E-BC2F-4F6C-88D0-A57BFE378ACF/Documents/fuzzed_image.png
Modified UIImage created successfully
New image size: {784, 734}, scale: 1.000000, rendering mode: 0
Bitmap context processing complete
Bitmap context with Standard RGB settings created and fuzzing applied
Completed image processing for permutation 1
Case: Creating bitmap context with Premultiplied First Alpha settings
Creating bitmap context with Premultiplied First Alpha settings and applying fuzzing
Drawing image into the bitmap context
Applying fuzzing logic to the bitmap context
Fuzzing applied to RGB components of the bitmap context
Creating CGImage from the modified bitmap context
Modified UIImage created successfully
New image size: {784, 734}, scale: 1.000000, rendering mode: 0
Bitmap context with Premultiplied First Alpha settings created and fuzzing applied
Completed image processing for permutation 2
Case: Creating bitmap context with Non-Premultiplied Alpha settings
Creating bitmap context with Non-Premultiplied Alpha settings and applying fuzzing

CGBitmapContextCreate: unsupported parameter combination:
	RGB | 8 bits/component, integer | 3136 bytes/row.
	kCGImageAlphaLast | kCGImageByteOrderDefault | kCGImagePixelFormatPacked
Set CGBITMAP_CONTEXT_LOG_ERRORS environmental variable to see more details.
Failed to create bitmap context with Non-Premultiplied Alpha settings
Completed image processing for permutation 3
Case: Creating bitmap context with 16-bit depth settings
Creating bitmap context with 16-bit Depth settings and applying fuzzing

CGBitmapContextCreate: unsupported parameter combination:
	RGB | 16 bits/component, integer | 6272 bytes/row.
	kCGImageAlphaPremultipliedFirst | kCGImageByteOrderDefault | kCGImagePixelFormatPacked
Set CGBITMAP_CONTEXT_LOG_ERRORS environmental variable to see more details.
Failed to create bitmap context with 16-bit Depth settings
Completed image processing for permutation 4
Grayscale image processing is currently pending implementation.
End of Run...
```
