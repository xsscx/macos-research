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

## Impact Samples - Remote, No-Auth
### macOS Mail Crash - DoS
<img src="https://xss.cx/2024/02/20/img/outlook-preview-out_tif-crash-002.png" alt="Picture shows the macOS Mail Client Crashing with my PoC and Flowers.exr" style="height:600px; width:800px;"/>

### Havoc
- Your PoC should Demonstrate some amount of Control :-[]
<img src="https://xss.cx/2024/02/20/img/shortcut-privacy-warning-send-to-facetime-sample-019.png" alt="Picture shows the PoC Create a Shortcut and send the Crash to FaceTime" style="height:600px; width:900px;"/>

## Why
We are reminded that the reference implementation indicates:
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
Apple may be handling this as a Product Defect. The Bug is unreported to the OpenEXR Project Maintainers because it should have been found with ClusterFuzz and is easily within the Scope of any rudimentary Fuzzing Campaign.

### Python Code for Sub-Sampling
<img src="https://xss.cx/2024/02/20/img/data-reshapred-exr-file-sub-sampling-example-poc-001.png" alt="Python Code for Data Reshaping PoC" style="height:564px; width:1500px;"/>

```
import OpenEXR
import Imath
import numpy as np
import matplotlib.pyplot as plt
import logging
import sys

def process_channel_data(exr_file, header, size):
    channel_data = {}
    channels = header['channels'].keys()
    pt = Imath.PixelType(Imath.PixelType.HALF)
    for c in channels:
        try:
            channel = header['channels'][c]
            x_sampling, y_sampling = channel.xSampling, channel.ySampling
            buffer = exr_file.channel(c, pt)
            data = np.frombuffer(buffer, dtype=np.float16)
            new_size = (size[0] // x_sampling, size[1] // y_sampling)
            reshaped_data = data.reshape(-1)
            channel_data[c] = reshaped_data[:new_size[0] * new_size[1]].reshape(new_size[1], new_size[0])
            logging.info(f"Processed channel '{c}' with subsampling {x_sampling}x{y_sampling} and reshaped to {new_size[1]}x{new_size[0]}")
        except Exception as e:
            logging.error(f"Error processing channel {c}: {e}")
    return channel_data

def plot_channel_data(channel_data):
    if len(channel_data) > 0:
        fig, axs = plt.subplots(1, len(channel_data), figsize=(15, 5))
        for i, c in enumerate(channel_data):
            axs[i].imshow(channel_data[c], cmap='gray')
            axs[i].set_title(c)
        plt.show()
        logging.info("Plotting completed.")
    else:
        logging.warning("No channel data available for plotting.")

def main(file_path):
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
    logging.info(f"Processing EXR file: {file_path}")

    try:
        exr_file = OpenEXR.InputFile(file_path)
        header = exr_file.header()
        dw = header['dataWindow']
        size = (dw.max.x - dw.min.x + 1, dw.max.y - dw.min.y + 1)
        logging.info(f"Image size: {size[0]} x {size[1]}")

        channel_data = process_channel_data(exr_file, header, size)
        plot_channel_data(channel_data)
        exr_file.close()
        logging.info("EXR file closed.")
    except Exception as e:
        logging.error(f"Error processing EXR file: {e}")

if __name__ == "__main__":
    file_path = sys.argv[1] if len(sys.argv) > 1 else '/Users/xss/Documents/Flowers.exr'
    main(file_path)
```
