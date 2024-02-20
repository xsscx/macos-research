//
//  main.m
//  cx.srd.img-fuzz-001
//
//  Created by D Hoyt on 11/27/23.
//

#include <Foundation/Foundation.h>
#include <UIKit/UIKit.h>
#include <stdio.h>
#include <stdlib.h>

// Function declarations
BOOL isValidImagePath(NSString *path);
UIImage *loadImageFromFile(NSString *path);
void processImage(UIImage *image, int permutation);

// Permutation functions
void createBitmapContextStandardRGB(CGImageRef cgImg);
void createBitmapContextPremultipliedFirstAlpha(CGImageRef cgImg);
void createBitmapContextNonPremultipliedAlpha(CGImageRef cgImg);
void createBitmapContext16BitDepth(CGImageRef cgImg);
void createBitmapContextGrayscale(CGImageRef cgImg);
void createBitmapContextHDRFloatComponents(CGImageRef cgImg);
void createBitmapContextAlphaOnly(CGImageRef cgImg);
void createBitmapContext1BitMonochrome(CGImageRef cgImg);
void createBitmapContextBigEndian(CGImageRef cgImg);
void createBitmapContextLittleEndian(CGImageRef cgImg);
void createBitmapContext8BitInvertedColors(CGImageRef cgImg);
void createBitmapContext32BitFloat4Component(CGImageRef cgImg);
void applyFuzzingToBitmapContext(unsigned char *rawData, size_t width, size_t height);


void applyFuzzingToBitmapContext(unsigned char *rawData, size_t width, size_t height) {
    for (size_t y = 0; y < height; y++) {
        for (size_t x = 0; x < width; x++) {
            size_t pixelIndex = (y * width + x) * 4; // Assuming 4 bytes per pixel (RGBA)
            rawData[pixelIndex] += rand() % 5 - 2; // Alter Red value
            rawData[pixelIndex + 1] += rand() % 5 - 2; // Alter Green value
            rawData[pixelIndex + 2] += rand() % 5 - 2; // Alter Blue value
            // Alpha (offset + 3) is not altered
        }
    }
}

int main(int argc, const char * argv[]) {
    NSLog(@"Starting up...");
    @autoreleasepool {
        if (argc < 3) {
            NSLog(@"Usage: %s image_name permutation_number", argv[0]);
            return 0;
        }

        NSString* imageName = [NSString stringWithUTF8String:argv[1]];
        int permutation = atoi(argv[2]);

        UIImage *image = loadImageFromFile(imageName);
        if (!image) {
            NSLog(@"Failed to load image: %@", imageName);
            return 1;
        }

        processImage(image, permutation);
        NSLog(@"End of Run...");
    }

    return 0;
}

// BOOL isValidImagePath(NSString *path) {
//     BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
//     NSLog(fileExists ? @"Valid image path: %@" : @"Invalid image path: %@", path);
//     return fileExists;
// }

UIImage *loadImageFromFile(NSString *imageName) {
    NSLog(@"Loading file: %@", imageName);
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    if (!imagePath) {
        NSLog(@"Failed to find path for image: %@", imageName);
        return nil;
    }
    NSLog(@"Image path: %@", imagePath);

    NSData *content = [NSData dataWithContentsOfFile:imagePath];
    if (!content) {
        NSLog(@"Failed to load data from file: %@", imagePath);
        return nil;
    }

    UIImage *image = [UIImage imageWithData:content];
    if (!image) {
        NSLog(@"Failed to create UIImage from data.");
        return nil;
    }

    NSLog(@"UIImage created: %@", image);
    return image;
}

void processImage(UIImage *image, int permutation) {
    CGImageRef cgImg = [image CGImage];
    if (!cgImg) {
        NSLog(@"Failed to get CGImage from UIImage.");
        return;
    }
    NSLog(@"CGImage created from UIImage. Dimensions: %zu x %zu", CGImageGetWidth(cgImg), CGImageGetHeight(cgImg));
    
    switch (permutation) {
        case 1:
            NSLog(@"Case: Creating bitmap context with Standard RGB settings");
            createBitmapContextStandardRGB(cgImg);
            break;
        case 2:
            NSLog(@"Case: Creating bitmap context with Premultiplied First Alpha settings");
            createBitmapContextPremultipliedFirstAlpha(cgImg);
            break;
        case 3:
            NSLog(@"Case: Creating bitmap context with Non-Premultiplied Alpha settings");
            createBitmapContextNonPremultipliedAlpha(cgImg);
            break;
        case 4:
            NSLog(@"Case: Creating bitmap context with 16-bit depth settings");
            createBitmapContext16BitDepth(cgImg);
            break;
        case 5:
            NSLog(@"Case: Creating bitmap context with Grayscale settings");
            createBitmapContextGrayscale(cgImg);
            break;
        case 6:
            NSLog(@"Case: Creating bitmap context with HDR Float Components settings");
            createBitmapContextHDRFloatComponents(cgImg);
            break;
        case 7:
            NSLog(@"Case: Creating bitmap context with Alpha Only settings");
            createBitmapContextAlphaOnly(cgImg);
            break;
        case 8:
            NSLog(@"Case: Creating bitmap context with 1-bit Monochrome settings");
            createBitmapContext1BitMonochrome(cgImg);
            break;
        case 9:
            NSLog(@"Case: Creating bitmap context with Big Endian pixel format settings");
            createBitmapContextBigEndian(cgImg);
            break;
        case 10:
            NSLog(@"Case: Creating bitmap context with Little Endian pixel format settings");
            createBitmapContextLittleEndian(cgImg);
            break;
        case 11:
            NSLog(@"Case: Creating bitmap context with 8-bit depth, inverted colors settings");
            createBitmapContext8BitInvertedColors(cgImg);
            break;
        case 12:
            NSLog(@"Case: Creating bitmap context with 32-bit float, 4-component settings");
            createBitmapContext32BitFloat4Component(cgImg);
            break;
        default:
            NSLog(@"Case: Invalid permutation number %d", permutation);
            break;
    }

    NSLog(@"Completed image processing for permutation %d", permutation);
}

void createBitmapContextStandardRGB(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with Standard RGB settings and applying fuzzing");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 4; // 4 bytes per pixel for RGBA
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);

    if (!rawData) {
        NSLog(@"Failed to allocate memory for image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Standard RGB settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Here, newImage contains the modified image
        // You can log or use newImage as needed
        NSLog(@"Modified UIImage created successfully");

        // Example: Logging newImage details
        NSLog(@"New image size: %@, scale: %f, rendering mode: %ld",
              NSStringFromCGSize(newImage.size),
              newImage.scale,
              (long)newImage.renderingMode);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context processing complete");

    // Log or do something with newImage if needed
    NSLog(@"Bitmap context with Standard RGB settings created and fuzzing applied");
}

void createBitmapContextPremultipliedFirstAlpha(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with Premultiplied First Alpha settings and applying fuzzing");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 4; // 4 bytes per pixel for RGBA
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);

    if (!rawData) {
        NSLog(@"Failed to allocate memory for image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Premultiplied First Alpha settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Here, newImage contains the modified image
        // You can log or use newImage as needed
        NSLog(@"Modified UIImage created successfully");

        // Example: Logging newImage details
        NSLog(@"New image size: %@, scale: %f, rendering mode: %ld",
              NSStringFromCGSize(newImage.size),
              newImage.scale,
              (long)newImage.renderingMode);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with Premultiplied First Alpha settings created and fuzzing applied");
}

void createBitmapContextNonPremultipliedAlpha(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with Non-Premultiplied Alpha settings and applying fuzzing");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 4; // 4 bytes per pixel for RGBA
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);

    if (!rawData) {
        NSLog(@"Failed to allocate memory for image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaLast);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Non-Premultiplied Alpha settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Here, newImage contains the modified image
        // You can log or use newImage as needed
        NSLog(@"Modified UIImage created successfully");

        // Example: Logging newImage details
        NSLog(@"New image size: %@, scale: %f, rendering mode: %ld",
              NSStringFromCGSize(newImage.size),
              newImage.scale,
              (long)newImage.renderingMode);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with Non-Premultiplied Alpha settings created and fuzzing applied");
}

void createBitmapContext16BitDepth(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with 16-bit Depth settings and applying fuzzing");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 8; // 8 bytes per pixel for 16-bit RGBA
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);

    if (!rawData) {
        NSLog(@"Failed to allocate memory for image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 16, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with 16-bit Depth settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Here, newImage contains the modified image
        // You can log or use newImage as needed
        NSLog(@"Modified UIImage created successfully");

        // Example: Logging newImage details
        NSLog(@"New image size: %@, scale: %f, rendering mode: %ld",
              NSStringFromCGSize(newImage.size),
              newImage.scale,
              (long)newImage.renderingMode);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with 16-bit Depth settings created and fuzzing applied");
}

void createBitmapContextGrayscale(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with Grayscale settings and applying fuzzing");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width; // Assuming 1 byte per pixel for grayscale

    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for grayscale image processing");
        return;
    }

    CGColorSpaceRef graySpace = CGColorSpaceCreateDeviceGray();
    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, bytesPerRow, graySpace, kCGImageAlphaNone);
    CGColorSpaceRelease(graySpace);

    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Grayscale settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the grayscale bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the grayscale bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified grayscale bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from grayscale context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Here, newImage contains the modified grayscale image
        // You can log or use newImage as needed
        NSLog(@"Modified grayscale UIImage created successfully");

        // Example: Logging newImage details
        NSLog(@"New grayscale image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with Grayscale settings created and fuzzing applied");
}

void createBitmapContextHDRFloatComponents(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with HDR Float Components settings and applying fuzzing");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 16; // 16 bytes per pixel for HDR RGBA (4 components x 4 bytes per component)

    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for HDR image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 32, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedLast | kCGBitmapFloatComponents);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with HDR Float Components settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the HDR bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the HDR bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified HDR bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from HDR context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Here, newImage contains the modified HDR image
        // You can log or use newImage as needed
        NSLog(@"Modified HDR UIImage created successfully");

        // Example: Logging newImage details
        NSLog(@"New HDR image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with HDR Float Components settings created and fuzzing applied");
}

void createBitmapContextAlphaOnly(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with Alpha Only settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, width, NULL, kCGImageAlphaOnly);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Alpha Only settings");
        return;
    }
    NSLog(@"Bitmap context with Alpha Only settings created successfully");
    CGContextRelease(ctx);
}

void createBitmapContext1BitMonochrome(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with 1-bit Monochrome settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 1, width / 8, NULL, kCGImageAlphaNone);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with 1-bit Monochrome settings");
        return;
    }
    NSLog(@"Bitmap context with 1-bit Monochrome settings created successfully");
    CGContextRelease(ctx);
}

void createBitmapContextBigEndian(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with Big Endian settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, width * 4, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Big Endian settings");
        return;
    }
    NSLog(@"Bitmap context with Big Endian settings created successfully");
    CGContextRelease(ctx);
}

void createBitmapContextLittleEndian(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with Little Endian settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, width * 4, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Little);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Little Endian settings");
        return;
    }
    NSLog(@"Bitmap context with Little Endian settings created successfully");
    CGContextRelease(ctx);
}

void createBitmapContext8BitInvertedColors(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with 8-bit depth, inverted colors");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, width * 4, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaNoneSkipLast | kCGBitmapByteOrder32Little);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with 8-bit depth, inverted colors");
        return;
    }
    // Additional processing
    NSLog(@"Bitmap context with 8-bit depth, inverted colors created successfully");
    CGContextRelease(ctx);
}

void createBitmapContext32BitFloat4Component(CGImageRef cgImg) {
    NSLog(@"Creating bitmap context with 32-bit float, 4-component settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 32, width * 16, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedLast | kCGBitmapFloatComponents);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with 32-bit float, 4-component settings");
        return;
    }
    // Additional processing
    NSLog(@"Bitmap context with 32-bit float, 4-component settings created successfully");
    CGContextRelease(ctx);
}
