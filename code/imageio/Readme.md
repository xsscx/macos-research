# Jackalope Fuzzer for ImageIO + Other Dylibs
The code originated from Google Project Zero
- https://github.com/googleprojectzero/Jackalope/blob/main/examples/ImageIO/imageio.m
- I modified the Google code and wrote some examples to cross-check some Bugs
- Examples are based on iOSOnMac Interposing Code at URL https://github.com/xsscx/macos-research/tree/main/code/iOSOnMac
- There is a clang scan-build report at URL https://xss.cx/2023/12/09/src/jackalope-scan-build-report/index.html
## My Code Modifications
- ~~Removed are the references for Windows to focus on native X86_64 and arm64e Fuzzing~~
- Windows Fuzzer Code Updates in process
- The Example Code adds a few supported file types and cleans up the autorelease pool use on macOS
- The Scripts and Example Code show how to Target other Dylibs depending on the Image Type, or Fuzz them all with the sample Script [https://raw.githubusercontent.com/xsscx/macos-research/main/code/imageio/imageio-fuzzer.zsh]
- There is a larger code base for iOS Fuzzing that has yet to be implemented in these examples, see URL https://github.com/xsscx/macos-research/blob/main/code/iOSOnMac/ios-image-fuzzer-example.m
- The arm64 code is my current focus to get consistent results from A/B testing with X86_64 and arm64 Platform ABI's, See https://github.com/xsscx/macos-research/issues/3

## Setup this Code & Build
- Copy the CMakeLists.txt to ./Jackalope-main/
- Copy imageio-test-002.m, imageio-test-002.m to ./Jackalope-main/examples/ImageIO/
- cd ./Jackalope
- Follow the Build Instructions at https://github.com/googleprojectzero/Jackalope 
## My Suggested Build
```
cmake  -G Xcode
cmake --build . --config Debug
```
- Now you have Xcode Project
- Now you have cmake build system
## Suggested cmake clean
```
rm -rf CMakeScripts CMakeFiles Release Debug build
cmake --build . --target clean
```
## Bigger Picture
- Whether a specific target function is defined or not changes the behavior of the fuzzing process in Jackalope. 
- These changes includes how the fuzzing iterations are handled, when to clear coverage data, and how timeouts are managed. 
- The presence of a specific target function is a targeted fuzzing approach, as opposed to a broader, more general fuzzing strategy as shown in the Example Code.
- The presence or absence of a defined target function influences the behavior of the fuzzing process. This is seen in the conditional checks like if (instrumentation->IsTargetFunctionDefined()). 
## Jackalope Example Command Lines
#### Default
```
./fuzzer -in in -out out -t 200 -t1 5000 -delivery shmem -instrument_module ImageIO -target_module test_imageio -target_method _fuzz -nargs 1 -iterations 1000 -persist -loop -cmp_coverage -generate_unwind -- ../examples/ImageIO/Release/test_imageio -m @@
```
#### Run Fuzzer with ASAN against CoreSVG with SVG UTT File Types
```
./fuzzer  -target_env DYLD_INSERT_LIBRARIES=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/15.0.0/lib/darwin/libclang_rt.tsan_osx_dynamic.dylib  -dump_coverage    -in /mnt/fuzz/svg -out /tmp/svg -t 200 -t3 500 -delivery shmem -instrument_module CoreSVG -target_module test_imageio -target_method _fuzz -nargs 1 -iterations 100 -persist -loop -cmp_coverage -generate_unwind -nthreads 20 -- ../examples/ImageIO/Debug/test_imageio -m @@ | grep -E 'Fuzzer version|input files read|Running input sample|Total execs|Unique samples|Crashes|Hangs|Offsets|Execs/s|WARNING|Width|Sanitizer|Hint|DEADLY'
```
#### Run Fuzzer with TSAN against LibPng with PNG UTT File Types
```
./fuzzer  -target_env DYLD_INSERT_LIBRARIES=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/15.0.0/lib/darwin/libclang_rt.tsan_osx_dynamic.dylib  -dump_coverage    -in /mnt/fuzz/png -out /tmp/png -t 200 -t3 500 -delivery shmem -instrument_module LibPng -target_module test_imageio -target_method _fuzz -nargs 1 -iterations 100 -persist -loop -cmp_coverage -generate_unwind -nthreads 20 -- ../examples/ImageIO/Debug/test_imageio -m @@ | grep -E 'Fuzzer version|input files read|Running input sample|Total execs|Unique samples|Crashes|Hangs|Offsets|Execs/s|WARNING|Width|Sanitizer|Hint|DEADLY'
```
#### Run Fuzzer with libgmalloc.dylib against libJPEG.dylib with JPEG UTT File Types
```
./fuzzer  -target_env MallocStackLogging=1 MallocScribble=1 DYLD_INSERT_LIBRARIES=/usr/lib/libgmalloc.dylib  -in /mnt/fuzz/jpg -out /mnt/jpg -t 200 -t3 500 -delivery shmem -instrument_module libJPEG.dylib -target_module test_imageio -target_method _fuzz -nargs 1 -iterations 1000 -persist -loop -cmp_coverage -generate_unwind -nthreads 20 -- ../examples/ImageIO/Debug/test_imageio -m @@ | grep -E 'Fuzzer version|input files read|Running input sample|Total execs|Fuzzing|Unique samples|Crashes|Hangs|Offsets|Execs/s|WARNING|Width|Sanitizer|Hint|DEADLY'
```
#### Find the Dylibs
To find out which modules are loaded for a particular input file, you can run, more below.
```
../TinyInst/Debug/litecov -trace_debug_events -- ../examples/ImageIO/Debug/test_imageio -f <filename>
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

### Fuzzer Output
#### Sample for Instrumented module AppleJPEG
```
Total execs: 153265
Unique samples: 107 (100 discarded)
Crashes: 0 (0 unique)
Hangs: 1547
Offsets: 4775
Execs/s: 1093
Fuzzing sample 00101
Instrumented module AppleJPEG, code size: 311288
...
```
#### Sample for Instrumented module libGIF.dylib
````
Total execs: 20504264
Unique samples: 34 (28 discarded)
Crashes: 0 (0 unique)
Hangs: 31486
Offsets: 1066
Execs/s: 2538
Instrumented module libGIF.dylib, code size: 24576
Instrumented module libGIF.dylib, code size: 24576
Fuzzing sample 00027
Fuzzing sample 00002
Fuzzing sample 00001
Instrumented module libGIF.dylib, code size: 24576
Instrumented module libGIF.dylib, code size: 24576
Fuzzing sample 00000
Instrumented module libGIF.dylib, code size: 24576
Instrumented module libGIF.dylib, code size: 24576
````
#### Expanded Logging Function on arm64
```
Instrumented module CoreSVG, code size: 241664
Instrumented module MPSCore, code size: 516096
Instrumented module XCTTargetBootstrap, code size: 24576
Instrumented module libsystem_configuration.dylib, code size: 20480
Instrumented module libsystem_sandbox.dylib, code size: 24564
Additionally added modules to align to pages:
  CoreImage
  CoreSVG
  MPSCore
  XCTTargetBootstrap
  libsystem_configuration.dylib
  libsystem_sandbox.dylib
Fuzzing sample 00037
Instrumented module ImageIO, code size: 3252224
Instrumented module CoreImage, code size: 3686400
Instrumented module CoreSVG, code size: 241664
[!] WARNING: Target function not reached, retrying with a clean process

Instrumented module MPSCore, code size: 516096
Instrumented module XCTTargetBootstrap, code size: 24576
Instrumented module libsystem_configuration.dylib, code size: 20480
Instrumented module libsystem_sandbox.dylib, code size: 24564
[!] WARNING: Target function not reached, retrying with a clean process

Instrumented module ImageIO, code size: 3252224
Instrumented module CoreImage, code size: 3686400
Instrumented module CoreSVG, code size: 241664

```
### Sample for Crash in libAppleEXR.dylib and abort() due to Error in Sub-sampling
```
libAppleEXR.dylib             	       0x1ca82f6e8 axr_error_t LaunchBlocks<ReadPixelsArgs>(void (*)(void*, unsigned long), ReadPixelsArgs const*, unsigned long, axr_flags_t) + 480
libAppleEXR.dylib             	       0x1ca83245c TileDecoder::ReadYccRGBAPixels(double, YccMatrix const&, void*, unsigned long) const + 2384
libAppleEXR.dylib             	       0x1ca825be8 Part::ReadRGBAPixels(axr_decoder*, void*, unsigned long, double, axr_flags_t) const + 2540
ImageIO                       	       0x1919384f4 EXRReadPlugin::decodeBlockAppleEXR(void*, unsigned long) + 364 
```

#### Sample Bug Output | Null Pointer DeRef at CoreSVG:x86_64+0x52be
Source URL https://github.com/xsscx/Commodity-Injection-Signatures/tree/master/svg
```
Jackalope Fuzzer version 1.11 with @h02332 SVG Reproduction of a Null Pointer DeRef at CoreSVG:x86_64+0x52be
4 input files read

Running input sample /mnt/fuzz/svg/xss-xml-svg-font-example-poc-1.svg
Running input sample /mnt/fuzz/svg/xss-xml-svg-font-example-poc-2.svg
Running input sample /mnt/fuzz/svg/xss-xml-svg-font-example-poc-3.svg

Total execs: 9
Unique samples: 0 (0 discarded)
Crashes: 0 (0 unique)
Hangs: 0
Offsets: 0
Execs/s: 9
Total execs: 9
Unique samples: 0 (0 discarded)
Crashes: 0 (0 unique)
Hangs: 0
Offsets: 0
Execs/s: 0
[!] WARNING: Target function not reached, retrying with a clean process
[!] WARNING: Target function not reached, retrying with a clean process
[!] WARNING: Target function not reached, retrying with a clean process
[!] WARNING: Target function not reached, retrying with a clean process
[!] WARNING: Target function not reached, retrying with a clean process
[!] WARNING: Target function not reached, retrying with a clean process
[!] WARNING: Input sample has no new stable coverage
[!] WARNING: Input sample resulted in a hang
Total execs: 10
Unique samples: 0 (0 discarded)
Crashes: 0 (0 unique)
Hangs: 1
Offsets: 0
Execs/s: 1
...
ThreadSanitizer:DEADLYSIGNAL
==46560==ERROR: ThreadSanitizer: SEGV on unknown address 0x000000000f22 (pc 0x000000000f22 bp 0x7ff7b8283fe0 sp 0x7ff7b8283b90 T405770)
==46560==Hint: pc points to the zero page.
==46560==The signal is caused by a READ memory access.
==46560==Hint: address points to the zero page.
ThreadSanitizer:DEADLYSIGNAL
==46572==ERROR: ThreadSanitizer: SEGV on unknown address 0x000000000f22 (pc 0x000000000f22 bp 0x7ff7b72e9fe0 sp 0x7ff7b72e9b90 T405825)
==46572==Hint: pc points to the zero page.
==46572==The signal is caused by a READ memory access.
==46572==Hint: address points to the zero page.
```
#### More Bugs
```
Running input sample /mnt/fuzz/asan_heap-oob_xxxxxx.exr
Total execs: 27
Unique samples: 0 (0 discarded)
Crashes: 0 (0 unique)
Hangs: 6
Offsets: 0
Execs/s: 1

Running input sample /mnt/fuzz/asan_heap-oob_xxxxxx.exr
AddressSanitizer:DEADLYSIGNAL
=================================================================
==22220==ERROR: AddressSanitizer: BUS on unknown address (pc 0x7ff92818129c bp 0x7ff7bf7b6d00 sp 0x7ff7bf7b6c98 T0)
==22220==The signal is caused by a READ memory access.
==22220==Hint: this fault was caused by a dereference of a high value address (see register values below).  Disassemble the provided pc to learn which register was used.
```
### Use of Sanitizers and libgmallic
```
-target_env DYLD_INSERT_LIBRARIES={path}libclang_rt.asan_osx_dynamic.dylib
-target_env DYLD_INSERT_LIBRARIES={path}libclang_rt.ubsan_osx_dynamic.dylib
-target_env DYLD_INSERT_LIBRARIES={path}libclang_rt.tsan_osx_dynamic.dylib
-target_env DYLD_INSERT_LIBRARIES=/usr/lib/libgmalloc.dylib
```
### Build Other Fuzzing Runners via examples/Imageio/CMakeLists.txt for Fuzzing other Bitmap Contexts shown below
```
  add_executable(imageio-test-002_imageio
    imageio-test-002.m
  )

  target_link_libraries(imageio-test-002_imageio
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )

  add_executable(imageio-test-003_imageio
    imageio-test-003.m
  )

  target_link_libraries(imageio-test-003_imageio
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )
```

#### Example Implementation for 10+ Functions
See URL https://raw.githubusercontent.com/xsscx/macos-research/main/code/iOSOnMac/ios-image-fuzzer-example.m so you can understand the Code shown below and have it running locally.

### Bitmap Context Notes

Creating a bitmap context with CGBitmapContextCreate involves several parameters that define the characteristics of the context, such as the width, height, bit depth, bytes per row, color space, and alpha info. Varying these parameters can significantly alter the behavior and output of the context. Below are 10 permutations of the CGBitmapContextCreate function call, each demonstrating a different configuration:
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

### Example Implementation for createBitmapContext8BitInvertedColors(size_t width, size_t height)
```
+CGContextRef createBitmapContext8BitInvertedColors(size_t width, size_t height) {
+    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
+    size_t bytesPerRow = 4 * width;
+    CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Big | kCGImageAlphaNoneSkipLast;
+
+    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, bytesPerRow, colorSpace, bitmapInfo);
+    CGColorSpaceRelease(colorSpace);
+
+    if (context) {
+        unsigned char *data = CGBitmapContextGetData(context);
+        if (data) {
+            size_t bufferLength = width * height * 4;
+            for (size_t i = 0; i < bufferLength; i += 4) {
+                data[i] = 255 - data[i];
+                data[i + 1] = 255 - data[i + 1];
+                data[i + 2] = 255 - data[i + 2];
+            }
+        }
+    }
+    return context;
+}
+
```
### Example Pixel Functions in CoreVideo - Potential Function Targets
Reference URL https://developer.apple.com/documentation/corevideo/cvpixelformatdescription/1563591-pixel_format_identifiers
```
  kCVPixelFormatType_1Monochrome    = 0x00000001, /* 1 bit indexed */
  kCVPixelFormatType_2Indexed       = 0x00000002, /* 2 bit indexed */
  kCVPixelFormatType_4Indexed       = 0x00000004, /* 4 bit indexed */
  kCVPixelFormatType_8Indexed       = 0x00000008, /* 8 bit indexed */
  kCVPixelFormatType_1IndexedGray_WhiteIsZero = 0x00000021, /* 1 bit indexed gray, white is zero */
  kCVPixelFormatType_2IndexedGray_WhiteIsZero = 0x00000022, /* 2 bit indexed gray, white is zero */
  kCVPixelFormatType_4IndexedGray_WhiteIsZero = 0x00000024, /* 4 bit indexed gray, white is zero */
  kCVPixelFormatType_8IndexedGray_WhiteIsZero = 0x00000028, /* 8 bit indexed gray, white is zero */
  kCVPixelFormatType_16BE555        = 0x00000010, /* 16 bit BE RGB 555 */
  kCVPixelFormatType_16LE555        = 'L555',     /* 16 bit LE RGB 555 */
  kCVPixelFormatType_16LE5551       = '5551',     /* 16 bit LE RGB 5551 */
  kCVPixelFormatType_16BE565        = 'B565',     /* 16 bit BE RGB 565 */
  kCVPixelFormatType_16LE565        = 'L565',     /* 16 bit LE RGB 565 */
  kCVPixelFormatType_24RGB          = 0x00000018, /* 24 bit RGB */
  kCVPixelFormatType_24BGR          = '24BG',     /* 24 bit BGR */
  kCVPixelFormatType_32ARGB         = 0x00000020, /* 32 bit ARGB */
  kCVPixelFormatType_32BGRA         = 'BGRA',     /* 32 bit BGRA */
  kCVPixelFormatType_32ABGR         = 'ABGR',     /* 32 bit ABGR */
  kCVPixelFormatType_32RGBA         = 'RGBA',     /* 32 bit RGBA */
  kCVPixelFormatType_64ARGB         = 'b64a',     /* 64 bit ARGB, 16-bit big-endian samples */
  kCVPixelFormatType_48RGB          = 'b48r',     /* 48 bit RGB, 16-bit big-endian samples */
  kCVPixelFormatType_32AlphaGray    = 'b32a',     /* 32 bit AlphaGray, 16-bit big-endian samples, black is zero */
  kCVPixelFormatType_16Gray         = 'b16g',     /* 16 bit Grayscale, 16-bit big-endian samples, black is zero */
  kCVPixelFormatType_30RGB          = 'R10k',     /* 30 bit RGB, 10-bit big-endian samples, 2 unused padding bits (at least significant end). */
  kCVPixelFormatType_422YpCbCr8     = '2vuy',     /* Component Y'CbCr 8-bit 4:2:2, ordered Cb Y'0 Cr Y'1 */
  kCVPixelFormatType_4444YpCbCrA8   = 'v408',     /* Component Y'CbCrA 8-bit 4:4:4:4, ordered Cb Y' Cr A */
  kCVPixelFormatType_4444YpCbCrA8R  = 'r408',     /* Component Y'CbCrA 8-bit 4:4:4:4, rendering format. full range alpha, zero biased YUV, ordered A Y' Cb Cr */
  kCVPixelFormatType_4444AYpCbCr8   = 'y408',     /* Component Y'CbCrA 8-bit 4:4:4:4, ordered A Y' Cb Cr, full range alpha, video range Y'CbCr. */
  kCVPixelFormatType_4444AYpCbCr16  = 'y416',     /* Component Y'CbCrA 16-bit 4:4:4:4, ordered A Y' Cb Cr, full range alpha, video range Y'CbCr, 16-bit little-endian samples. */
  kCVPixelFormatType_444YpCbCr8     = 'v308',     /* Component Y'CbCr 8-bit 4:4:4 */
  kCVPixelFormatType_422YpCbCr16    = 'v216',     /* Component Y'CbCr 10,12,14,16-bit 4:2:2 */
  kCVPixelFormatType_422YpCbCr10    = 'v210',     /* Component Y'CbCr 10-bit 4:2:2 */
  kCVPixelFormatType_444YpCbCr10    = 'v410',     /* Component Y'CbCr 10-bit 4:4:4 */
  kCVPixelFormatType_420YpCbCr8Planar = 'y420',   /* Planar Component Y'CbCr 8-bit 4:2:0.  baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrPlanar struct */
  kCVPixelFormatType_420YpCbCr8PlanarFullRange    = 'f420',   /* Planar Component Y'CbCr 8-bit 4:2:0, full range.  baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrPlanar struct */
  kCVPixelFormatType_422YpCbCr_4A_8BiPlanar = 'a2vy', /* First plane: Video-range Component Y'CbCr 8-bit 4:2:2, ordered Cb Y'0 Cr Y'1; second plane: alpha 8-bit 0-255 */
  kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange = '420v', /* Bi-Planar Component Y'CbCr 8-bit 4:2:0, video-range (luma=[16,235] chroma=[16,240]).  baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrBiPlanar struct */
  kCVPixelFormatType_420YpCbCr8BiPlanarFullRange  = '420f', /* Bi-Planar Component Y'CbCr 8-bit 4:2:0, full-range (luma=[0,255] chroma=[1,255]).  baseAddr points to a big-endian CVPlanarPixelBufferInfo_YCbCrBiPlanar struct */ 
  kCVPixelFormatType_422YpCbCr8_yuvs = 'yuvs',     /* Component Y'CbCr 8-bit 4:2:2, ordered Y'0 Cb Y'1 Cr */
  kCVPixelFormatType_422YpCbCr8FullRange = 'yuvf', /* Component Y'CbCr 8-bit 4:2:2, full range, ordered Y'0 Cb Y'1 Cr */
  kCVPixelFormatType_OneComponent8  = 'L008',     /* 8 bit one component, black is zero */
  kCVPixelFormatType_TwoComponent8  = '2C08',     /* 8 bit two component, black is zero */
  kCVPixelFormatType_30RGBLEPackedWideGamut = 'w30r', /* little-endian RGB101010, 2 MSB are zero, wide-gamut (384-895) */
  kCVPixelFormatType_OneComponent16Half  = 'L00h',     /* 16 bit one component IEEE half-precision float, 16-bit little-endian samples */
  kCVPixelFormatType_OneComponent32Float = 'L00f',     /* 32 bit one component IEEE float, 32-bit little-endian samples */
  kCVPixelFormatType_TwoComponent16Half  = '2C0h',     /* 16 bit two component IEEE half-precision float, 16-bit little-endian samples */
  kCVPixelFormatType_TwoComponent32Float = '2C0f',     /* 32 bit two component IEEE float, 32-bit little-endian samples */
  kCVPixelFormatType_64RGBAHalf          = 'RGhA',     /* 64 bit RGBA IEEE half-precision float, 16-bit little-endian samples */
  kCVPixelFormatType_128RGBAFloat        = 'RGfA',     /* 128 bit RGBA IEEE float, 32-bit little-endian samples */
  kCVPixelFormatType_14Bayer_GRBG        = 'grb4',     /* Bayer 14-bit Little-Endian, packed in 16-bits, ordered G R G R... alternating with B G B G... */
  kCVPixelFormatType_14Bayer_RGGB        = 'rgg4',     /* Bayer 14-bit Little-Endian, packed in 16-bits, ordered R G R G... alternating with G B G B... */
  kCVPixelFormatType_14Bayer_BGGR        = 'bgg4',     /* Bayer 14-bit Little-Endian, packed in 16-bits, ordered B G B G... alternating with G R G R... */
  kCVPixelFormatType_14Bayer_GBRG        = 'gbr4',     /* Bayer 14-bit Little-Endian, packed in 16-bits, ordered G B G B... alternating with R G R G... */
```
### Tinyinst Example to find Graphics Dylibs for File Extensions for target_link_libraries and -instrument_module
To find out which modules are loaded for a particular input file, you can run, more below.
```
../TinyInst/Debug/litecov -trace_debug_events -- ../examples/ImageIO/Debug/test_imageio -f <filename>
```
```
Debugger: Mach exception (5) @ address 0x113a4e070
Debugger: Process created or attached
Debugger: Loaded module dyld at 0x113a49000
Debugger: Loaded module test_imageio at 0x10e5d0000
Debugger: Loaded module ImageIO at 0x7ff8227fb000
Debugger: Loaded module CoreFoundation at 0x7ff8189e6000
Debugger: Loaded module Foundation at 0x7ff81988e000
Debugger: Loaded module CoreGraphics at 0x7ff81d9ef000
Debugger: Loaded module IOSurface at 0x7ff82200d000
...
Debugger: Loaded module CoreBluetooth at 0x7ff82cae0000
Width: 32, height: 32
Failed to load image.
Failed to load image.
Width: 32, height: 32
Width: 32, height: 32
Width: 400, height: 300
Width: 1280, height: 960
Debugger: Process exit
Process finished normally
```
### You need to know the dylibs your Image(s) load
Tip - you'll need to know what dylibs and frameworks to target, use tinyinst to show you what gets loaded for a given file type. Use multiple file types, target multiple frameworks and dylibs for Linking. 
I Posted a shell script as example. You're going to see that the script iterates the dylibs and frameworks with the option -instrument_module {} as shown below:
```
-instrument_module ImageIO
-instrument_module CoreSVG
-instrument_module AppleJPEG
....
-instrument_module [Framework | dylib]
```
See the Script for an Example https://raw.githubusercontent.com/xsscx/macos-research/main/code/imageio/imageio-fuzzer.zsh

### Script Targets for -instrument_module
```
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
```

### Coverage Functions - Example functions you may want to Target once Instrumented
```
11  libAppleEXR.dylib             	    0x7ffa0d7b7fce axr_error_t LaunchBlocks<ReadPixelsArgs>(void (*)(void*, unsigned long), ReadPixelsArgs const*, unsigned long, axr_flags_t) + 355
12  libAppleEXR.dylib             	    0x7ffa0d7bb422 TileDecoder::ReadYccRGBAPixels(double, YccMatrix const&, void*, unsigned long) const + 2242
13  libAppleEXR.dylib             	    0x7ffa0d7ad5f9 Part::ReadRGBAPixels(axr_decoder*, void*, unsigned long, double, axr_flags_t) const + 2511
14  ImageIO                       	    0x7ff812001783 EXRReadPlugin::decodeBlockAppleEXR(void*, unsigned long) + 337
15  ImageIO                       	    0x7ff8120014d4 EXRReadPlugin::decodeImageImp(IIODecodeParameter*, IIOImageType, __IOSurface**, __CVBuffer**, CGImageBlockSet**) + 688
16  ImageIO                       	    0x7ff811fc0625 IIOReadPlugin::callDecodeImage(IIODecodeParameter*, IIOImageType, __IOSurface**, __CVBuffer**, CGImageBlockSet**) + 851
17  ImageIO                       	    0x7ff811f31e00 IIO_Reader::CopyImageBlockSetProc(void*, CGImageProvider*, CGRect, CGSize, __CFDictionary const*) + 836
18  ImageIO                       	    0x7ff811f4f682 IIOImageProviderInfo::copyImageBlockSetWithOptions(CGImageProvider*, CGRect, CGSize, __CFDictionary const*) + 684
19  ImageIO                       	    0x7ff811f31999 IIOImageProviderInfo::CopyImageBlockSetWithOptions(void*, CGImageProvider*, CGRect, CGSize, __CFDictionary const*) + 871
20  CoreGraphics                  	    0x7ff80cdb2dbf imageProvider_retain_data + 77
21  CoreGraphics                  	    0x7ff80cdb2d32 CGDataProviderRetainData + 75
22  CoreGraphics                  	    0x7ff80cdb2d57 provider_for_destination_retain_data + 17
23  CoreGraphics                  	    0x7ff80cdb2d32 CGDataProviderRetainData + 75
24  CoreGraphics                  	    0x7ff80cdb2bee CGAccessSessionCreate + 98
25  CoreGraphics                  	    0x7ff80cdb1bf6 img_data_lock + 3006
26  CoreGraphics                  	    0x7ff80cdad5b3 CGSImageDataLock + 1286
27  CoreGraphics                  	    0x7ff80cdad075 RIPImageDataInitializeShared + 170
28  CoreGraphics                  	    0x7ff80cdacd22 RIPImageCacheGetRetained + 679
29  CoreGraphics                  	    0x7ff80cdac817 ripc_AcquireRIPImageData + 371
30  CoreGraphics                  	    0x7ff80cdab5ff ripc_DrawImage + 919
31  CoreGraphics                  	    0x7ff80cdaaa88 CGContextDrawImageWithOptions + 676
32  ImageIO                       	    0x7ff811faadf0 CGImageCreateCopyWithParametersNew(CGImage*, CGColor*, CGAffineTransform, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, CGColorSpace*, unsigned int, bool, CGColorRenderingIntent, CGInterpolationQuality, bool) + 2095
33  ImageIO                       	    0x7ff811f8c076 IIOImageSource::createThumbnailAtIndex(unsigned long, IIODictionary*) + 3902
34  ImageIO                       	    0x7ff811f70fdd CGImageSourceCreateThumbnailAtIndex + 466
35  ImageKit                      	    0x7ff90d4affa0 +[IKImageViewUtils _newScaledImageFromSource:index:imageScale:canUseExistingThumbnail:displayProperties:] + 503
36  ImageKit                      	    0x7ff90d4afd8b +[IKImageViewUtils newCGImageFromImgSrc:index:displayProperties:imageScale:forceScale:canUseExistingThumbnail:createBitmapImmediately:] + 171
37  ImageKit                      	    0x7ff90d4865be __82-[IKImageContentView _setImageFromImageSource:imageAtIndex:withDisplayProperties:]_block_invoke + 67
38  ImageKit                      	    0x7ff90d48693d __82-[IKImageContentView _setImageFromImageSource:imageAtIndex:withDisplayProperties:]_block_invoke.284 + 21
```

### Coverage Samples
- Sample for libPng https://raw.githubusercontent.com/xsscx/macos-research/main/code/imageio/coverage-sample-libPng.txt
- Sample for LibGif https://raw.githubusercontent.com/xsscx/macos-research/main/code/imageio/coverage-sample-libGIF.txt
- Sample for CoreSVG https://raw.githubusercontent.com/xsscx/macos-research/main/code/imageio/coverage-sample-CoreSVG.txt
- Sample for CoreGraphics https://raw.githubusercontent.com/xsscx/macos-research/main/code/imageio/coverage-sample-CoreGraphics.txt

### qlmanage Cache Reset
- Bugs in the Thumbnailer in the Sub-sampling Code as shown above in libAppleEXR.dylib | TileDecoder::ReadYccRGBAPixels(double, YccMatrix const&, void*, unsigned long) const + 2384
```
qlmanage -r
qlmanage -r cache
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
export CORESVG_VERBOSE=1
```
## Problems & troubleshooting
- See Issue [https://github.com/xsscx/macos-research/issues/1]

IF you are seeing these messages:
```
    if (status != DEBUGGER_TARGET_START) {
      switch (status) {
      case DEBUGGER_CRASHED:
        FATAL("Process crashed before reaching the target method\n");
        break;
      case DEBUGGER_HANGED:
        FATAL("Process hanged before reaching the target method\n");
        break;
      case DEBUGGER_PROCESS_EXIT:
        FATAL("Process exited before reaching the target method\n");
        break;
      default:
        FATAL("An unknown problem occured before reaching the target method\n");
        break;
      }
    }

```
- Try incresing the -t1 to -t5
- Try using fewer Threads

## Suggestion
- Use A/B/C Testing of Code via the Examples shown in https://github.com/xsscx/macos-research/blob/main/code/imageio/CMakeLists.txt
```
  add_executable(imageio-test-003_imageio
    imageio-test-003.m
  )

  target_link_libraries(imageio-test-003_imageio
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )
```
- Benchmark code modifications and results against the baseline code included in the Project
## TinyInst Debugger Implementation
- Break or Drop to lldb
- ninja code for those who enjoy the bleeding edge approach to memory patch and fuzz action
### TinyInst Changes 
- make clean
- manually replace the main.cpp in Jackalope, Background https://github.com/xsscx/macos-research/issues/4
- manually replace instrumentation.cpp and instrumentation.h files in ./TinyInst
- make
- Fuzz
- See Issue https://github.com/xsscx/macos-research/issues/2 for more info
- The modified .cpp and.h files add Live Debugging Mode and other Changes

### TinyInst Global Debug Flag
```
// Global debug flag
bool debugMode = true;

void DebugBreakpoint(const std::string& message) {
    if (debugMode) {
        std::cout << "[DEBUG BREAK] " << message << "\n";
        std::cout << "Press enter to continue...\n";
        std::cin.get();
    }
}

void SignalHandler(int signal) {
    std::cout << "Caught signal " << signal << ". Entering debug mode.\n";
    debugMode = true;
}

void SetupDebugMode() {
    signal(SIGINT, SignalHandler);
}

```
