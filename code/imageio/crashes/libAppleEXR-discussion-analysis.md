# libAppleEXR Abort due to Sub Sampling

## Discussion & Analysis
The crashes occur when processing EXR files with subsampled channels in Apple's libAppleEXR.dylib and the open-source libOpenEXR.
The crash in libAppleEXR.dylib involves functions like TileDecoder::ReadYccRGBAPixels and occurs during the decoding process in ImageIO and CoreGraphics frameworks.
In libOpenEXR, the crash is in the processing of channels marked as 'HALF (2, 2)', indicating subsampling.

## EXR File Info
Flowers.exr Header Info: {'channels': {'BY': HALF (2, 2), 'RY': HALF (2, 2), 'Y': HALF (1, 1)}, 'compression': B44_COMPRESSION, 'dataWindow': (0, 0) - (783, 733), 'displayWindow': (0, 0) - (783, 733), 'lineOrder': INCREASING_Y, 'owner': b'Copyright 2006 Industrial Light & Magic', 'pixelAspectRatio': 1.0, 'screenWindowCenter': (0.0, 0.0), 'screenWindowWidth': 1.0}
### dict_keys
```
dict_keys(['BY', 'RY', 'Y']), {'BY': (143864,), 'RY': (143864,), 'Y': (575456,)})
```
- The issues arises when BY and RY do not equal 25% of Y
- This leads to memory management issues in a wide array of products, and services.
## Apple Bug
We can see that the subsampled channels ('BY' and 'RY') are not standard in size compared to the full-resolution 'Y' channel. 
These channels are a quarter of the total pixel count, potentially leading to incorrect buffer size allocations.
The crashes are likely due to buffer overflows or memory mismanagement when handling these non-standard sizes.

## Why
We are reminder the the reference implementation indicates:
```
Tiled image files do not support subsampled chroma channels
```
Given this critical detail, we can now begin constructing the Seeds for Fuzzing the EXR Libraries.

### PoC
Reproduction Image: Flowers.exr from the OpenEXR Distribution using libOpenEXR-3_2.31.3.2.1.dylib
```
Crash in libOpenEXR-3_2.31.3.2.1.dylib
frame #10: 0x0000000101010ca8 libOpenEXR-3_2.31.3.2.1.dylib`Imf_3_2::Header::dataWindow() const + 16
libOpenEXR-3_2.31.3.2.1.dylib`Imf_3_2::Header::dataWindow:
->  0x101010ca8 <+16>: addq   $0x8, %rax

libOpenEXR-3_2.31.3.2.1.dylib`Imf_3_2::Header::pixelAspectRatio:
    0x101010cae <+0>:  pushq  %rbp

libOpenEXR-3_2.31.3.2.1.dylib`Imf_3_2::Header::dataWindow:
    0x101010c9c <+4>:  leaq   0x233419(%rip), %rsi      ; "dataWindow"
    0x101010ca3 <+11>: callq  0x101010912               ; Imf_3_2::Header::operator[](char const*) const
->  0x101010ca8 <+16>: addq   $0x8, %rax
```
 
Reproduction Image: Flowers.exr via Mail, Notes, Freeform, Shortcut etc.. using libAppleEXR.dylib with Build 23B92 on X86_64 or arm64
```
Crash in libAppleEXR.dylib
libAppleEXR.dylib             	       0x1ca82f6e8 axr_error_t LaunchBlocks<ReadPixelsArgs>(void (*)(void*, unsigned long), ReadPixelsArgs const*, unsigned long, axr_flags_t) + 480
libAppleEXR.dylib             	       0x1ca83245c TileDecoder::ReadYccRGBAPixels(double, YccMatrix const&, void*, unsigned long) const + 2384
libAppleEXR.dylib             	       0x1ca825be8 Part::ReadRGBAPixels(axr_decoder*, void*, unsigned long, double, axr_flags_t) const + 2540
ImageIO                       	       0x1919384f4 EXRReadPlugin::decodeBlockAppleEXR(void*, unsigned long) + 364 
```

## Summary
Apple is handling this as a Product Defect

