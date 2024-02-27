/**
 * @file       xnuimagefuzzer.m
 * @brief      Proof of concept iOS Image Fuzzer
 * @author     @h02332 | David Hoyt
 * @date       Modified 27 FEB 2024
 * @time                 0845 EST
 *
 * Detailed description of the file, if necessary.
 *
 * @section    CHANGES
 * [Date] [Author] - [Description of Changes]
 * - [26/11/2023] [h02332] - Initial commit
 * - [27/11/2023] [h02332] - Removed Grayscale Feature pending Implementation
 * - [28/11/2023] [h02332] - Refactor Code & fuzzing
 * - [27/02/2024] [h02332] - Refactor Code & fuzzing & logging & pragma marks
 *
 * @section    TODO
 * - [ ] Grayscale Implementation
 * - [ ] ICC Color Profiles
 * - [ ] Refactor Example Fuzzer
 * - [ ] Add Logging Toggle as global variable  - testing in createBitmapContextStandardRGB function
 * - [ ] Modify File Name at function()
 * Compile : xcrun -sdk iphoneos clang -arch arm64 -framework UIKit -framework Foundation -framework CoreGraphics -miphoneos-version-min=12.0 -g -o imagefuzzer ios-image-fuzzer-example.m  interpose.dylib
 *
 */

#include <Foundation/Foundation.h>
#include <UIKit/UIKit.h>
#include <CoreGraphics/CoreGraphics.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <assert.h>

#pragma mark - Macros and Constants

// Define constants for fuzzing control
#define ALL -1 // Assuming this is used to indicate that all items should be processed
#define MAX_PERMUTATION 12 // Maximum number of permutations allowed, adjust according to your needs

// Enable detailed logging for debug builds only
#ifdef DEBUG
#define DebugLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DebugLog(...)
#endif

// Assert with message - Extends assert to include a message on failure, useful for debugging
#define AssertWithMessage(condition, message, ...) \
    do { \
        if (!(condition)) { \
            NSLog((@"Assertion failed: %s " message), #condition, ##__VA_ARGS__); \
            assert(condition); \
        } \
    } while(0)

#pragma mark - Global Variables

// Global variable to control verbosity
int verboseLogging = 0; // Set to 1 for detailed logging, 0 for minimal logging

#pragma mark - Function Declarations

// Function declarations
BOOL isValidImagePath(NSString *path);
UIImage *loadImageFromFile(NSString *path);
void processImage(UIImage *image, int permutation, NSString *sessionDirectory);
void processPermutation(UIImage *image, int permutation, NSString *sessionDirectory);
NSString *createUniqueDirectoryForSavingImages(void);
void logPixelData(unsigned char *rawData, size_t width, size_t height, const char *message);
void applyFuzzingToBitmapContext(unsigned char *rawData, size_t width, size_t height);

#pragma mark - Bitmap Context Creation

// Bitmap context creation functions
void createBitmapContextStandardRGB(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextPremultipliedFirstAlpha(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextNonPremultipliedAlpha(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContext16BitDepth(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextHDRFloatComponents(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextAlphaOnly(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContext1BitMonochrome(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextBigEndian(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextLittleEndian(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContext8BitInvertedColors(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContext32BitFloat4Component(CGImageRef cgImg, NSString *sessionDirectory, int permutation);

// TODO: Implement Grayscale context creation
void createBitmapContextGrayscale(CGImageRef cgImg);

#pragma mark - Directory Management

NSString *createUniqueDirectoryForSavingImages(void) {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd_HH-mm-ss-SSS"];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];

    // Generating a random component to append to the directory name for uniqueness
    uint32_t randomComponent = arc4random_uniform(10000);
    NSString *uniqueDirectoryName = [NSString stringWithFormat:@"%@_%u", dateString, randomComponent];

    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *uniqueDirPath = [documentsDirectory stringByAppendingPathComponent:uniqueDirectoryName];

    NSError *error;
    if (![[NSFileManager defaultManager] createDirectoryAtPath:uniqueDirPath withIntermediateDirectories:YES attributes:nil error:&error]) {
        NSLog(@"Error creating directory for saving images: %@", error.localizedDescription);
        // Consider additional error handling logic here, depending on application requirements
        return nil;
    }

    return uniqueDirPath;
}

#pragma mark - Pixel Data Logging

void logPixelData(unsigned char *rawData, size_t width, size_t height, const char *message) {
    if (!rawData || width == 0 || height == 0) {
        NSLog(@"%s - Invalid data or dimensions. Logging aborted.", message);
        return;
    }

    const int numberOfPixelsToLog = 5; // Number of random pixels to log

    if (verboseLogging) {
        NSLog(@"%s - Logging %d random pixels:", message, numberOfPixelsToLog);

        for (int i = 0; i < numberOfPixelsToLog; i++) {
            unsigned int randomX = arc4random_uniform((unsigned int)width);
            unsigned int randomY = arc4random_uniform((unsigned int)height);
            size_t pixelIndex = (randomY * width + randomX) * 4;

            // Ensure we're not accessing out of bounds
            if (pixelIndex + 3 < width * height * 4) {
                NSLog(@"%s - Pixel[%u, %u]: R=%d, G=%d, B=%d, A=%d",
                      message, randomX, randomY,
                      rawData[pixelIndex], rawData[pixelIndex + 1],
                      rawData[pixelIndex + 2], rawData[pixelIndex + 3]);
            } else {
                NSLog(@"%s - Out of bounds pixel access prevented at [%u, %u].", message, randomX, randomY);
            }
        }
    } else {
        NSLog(@"%s - Basic pixel logging executed.", message);
    }
}

#pragma mark - Fuzzing Methods

void applyEnhancedFuzzingToBitmapContext(unsigned char *rawData, size_t width, size_t height) {
    if (!rawData || width == 0 || height == 0) {
        NSLog(@"No valid raw data or dimensions available for enhanced fuzzing.");
        return;
    }

    if (verboseLogging) {
        NSLog(@"Starting enhanced fuzzing on bitmap context");
    }

    for (size_t y = 0; y < height; y++) {
        for (size_t x = 0; x < width; x++) {
            size_t pixelIndex = (y * width + x) * 4;
            int fuzzMethod = arc4random_uniform(6); // Six methods

            switch (fuzzMethod) {
                case 0: // Inversion
                    if (verboseLogging) {
                        NSLog(@"Inversion applied at Pixel[%zu, %zu]", x, y);
                    }
                    for (int i = 0; i < 3; i++) {  // Apply inversion to RGB
                        rawData[pixelIndex + i] = 255 - rawData[pixelIndex + i];
                    }
                    break;
                case 1: // Random noise
                    if (verboseLogging) {
                        NSLog(@"Random noise applied at Pixel[%zu, %zu]", x, y);
                    }
                    for (int i = 0; i < 4; i++) {
                        int noise = arc4random_uniform(101) - 50;
                        int newValue = rawData[pixelIndex + i] + noise;
                        rawData[pixelIndex + i] = (unsigned char)fmax(0, fmin(255, newValue));
                    }
                    break;
                case 2: // Random color
                    if (verboseLogging) {
                        NSLog(@"Random color set at Pixel[%zu, %zu]", x, y);
                    }
                    rawData[pixelIndex] = arc4random_uniform(256);
                    rawData[pixelIndex + 1] = arc4random_uniform(256);
                    rawData[pixelIndex + 2] = arc4random_uniform(256);
                    break;
                case 3: // Shift pixel values
                    if (verboseLogging) {
                        NSLog(@"Shift pixel values applied at Pixel[%zu, %zu]", x, y);
                    }
                    for (int i = 0; i < 3; i++) {
                        rawData[pixelIndex + i] = (rawData[pixelIndex + i] + 128) % 256;
                    }
                    break;
                case 4: // Extreme contrast adjustment
                    if (verboseLogging) {
                        NSLog(@"Extreme contrast adjustment at Pixel[%zu, %zu]", x, y);
                    }
                    for (int i = 0; i < 3; i++) {
                        rawData[pixelIndex + i] = rawData[pixelIndex + i] < 128 ? 0 : 255;
                    }
                    break;
                case 5: // Conditional color swap
                    if (verboseLogging) {
                        NSLog(@"Conditional color swap at Pixel[%zu, %zu]", x, y);
                    }
                    if ((x + y) % 10 < 5) {
                        unsigned char temp = rawData[pixelIndex];
                        rawData[pixelIndex] = rawData[pixelIndex + 2];
                        rawData[pixelIndex + 2] = temp;
                    }
                    break;
            }
        }
    }

    if (verboseLogging) {
        NSLog(@"Enhanced fuzzing on bitmap context completed");
    }
}

void applyFuzzingToBitmapContext(unsigned char *rawData, size_t width, size_t height) {
    if (!rawData || width == 0 || height == 0) {
        NSLog(@"No valid raw data or dimensions available for fuzzing.");
        return;
    }

    // Example assertion for non-null data, not enough to ensure full initialization
    assert(rawData != NULL);

    // Potentially, add runtime checks for expected value ranges in a debug mode
    // This is more for illustration; actual implementation would depend on expected data characteristics
    #ifdef DEBUG
    for (size_t i = 0; i < width * height * 4; ++i) {
        assert(rawData[i] >= 0 && rawData[i] <= 255); // Given unsigned char, this is always true, but similar checks could be applied based on expected data state
    }
    #endif

    logPixelData(rawData, width, height, "Before fuzzing");

    for (size_t y = 0; y < height; y++) {
        for (size_t x = 0; x < width; x++) {
            size_t pixelIndex = (y * width + x) * 4;

            for (int i = 0; i < 4; i++) {
                int fuzzMethod = arc4random_uniform(5);

                switch (fuzzMethod) {
                    case 0: // Inversion
                        rawData[pixelIndex + i] = 255 - rawData[pixelIndex + i];
                        break;
                    case 1: // Random addition/subtraction
                        {
                            int fuzzFactor = (int)arc4random_uniform(201) - 100; // Range: [-100, 100]
                            int newValue = rawData[pixelIndex + i] + fuzzFactor;
                            // Ensure newValue is within unsigned char bounds
                            newValue = fmax(0, fmin(255, newValue));
                            rawData[pixelIndex + i] = (unsigned char)newValue;
                        }
                        break;
                    case 2: // Conditional alteration
                        if ((x + y + i) % 5 == 0) {
                            rawData[pixelIndex + i] = arc4random_uniform(256);
                        }
                        break;
                    case 3: // Noise addition
                        {
                            int noise = (int)arc4random_uniform(50) - 25; // Range: [-25, 25]
                            int newValue = rawData[pixelIndex + i] + noise;
                            // Ensure newValue is within unsigned char bounds
                            newValue = fmax(0, fmin(255, newValue));
                            rawData[pixelIndex + i] = (unsigned char)newValue;
                        }
                        break;
                    case 4: // Periodic pattern introduction
                        if ((x / 10 + y / 10) % 2 == 0) {
                            rawData[pixelIndex + i] = (rawData[pixelIndex + i] + 128) % 256;
                        }
                        break;
                }

                // Log the action if verboseLogging is enabled
                if (verboseLogging) {
                    NSLog(@"Fuzzing applied at Pixel[%zu, %zu]: New Value=%d", x, y, rawData[pixelIndex + i]);
                }
            }
        }
    }

    logPixelData(rawData, width, height, "After fuzzing");
}

#pragma mark - Memory Handling

void debugMemoryHandling(void) {
    const size_t sz = 0x10000;
    char* chunks[64] = { NULL };
    for (int i = 0; i < 64; i++) {
        char* chunk = (char *)mmap(0, sz, PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
        if (chunk == MAP_FAILED) {
            NSLog(@"Failed to map memory for chunk %d", i);
            continue;
        }
        memset(chunk, 0x41, sz);
        NSLog(@"Chunk @ %p", chunk);
        chunks[i] = chunk;
    }

    for (int i = 0; i < 64; i++) {
        if (chunks[i] != NULL) {
            if (munmap(chunks[i], sz) == -1) {
                NSLog(@"Failed to unmap chunk @ %p", chunks[i]);
            } else {
                NSLog(@"Successfully unmapped chunk @ %p", chunks[i]);
            }
        }
    }
}

#pragma mark - Main Function

int main(int argc, const char * argv[]) {
    NSLog(@"Starting up...");
//    debugMemoryHandling(); // Call the debug function
    @autoreleasepool {
        if (argc < 3) {
            NSLog(@"Usage: %s path/to/image permutation_number", argv[0]);
            return 0;
        }

        NSString* imagePath = [NSString stringWithUTF8String:argv[1]];
        int permutation = atoi(argv[2]);

        if (!isValidImagePath(imagePath)) {
            NSLog(@"Invalid image path: %@", imagePath);
            return 1;
        }

        UIImage *image = loadImageFromFile(imagePath);
        if (!image) {
            NSLog(@"Failed to load image: %@", imagePath);
            return 1;
        }

        NSString *sessionDirectory = createUniqueDirectoryForSavingImages();
        if (!sessionDirectory) {
            NSLog(@"Failed to create a session directory.");
            return 1;
        }

        // Process the image based on the permutation
        if (permutation == ALL) {
            for (int i = 1; i <= MAX_PERMUTATION; i++) {
                processPermutation(image, i, sessionDirectory);
            }
        } else {
            processPermutation(image, permutation, sessionDirectory);
        }

        NSLog(@"End of Run...");
    }

    return 0;
}



BOOL isValidImagePath(NSString *path) {
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
    NSLog(fileExists ? @"Valid image path: %@" : @"Invalid image path: %@", path);
    return fileExists;
}

UIImage *loadImageFromFile(NSString *path) {
    NSLog(@"Loading file from path: %@", path);
    NSData *content = [NSData dataWithContentsOfFile:path];
    if (!content) {
        NSLog(@"Failed to load data from file: %@", path);
        return nil;
    }
    NSLog(@"Data loaded from file: %@", path);

    UIImage *image = [[UIImage alloc] initWithData:content];
    if (!image) {
        NSLog(@"Failed to create UIImage from data.");
        return nil;
    }
    NSLog(@"UIImage created: %@", image);
    return image;
}

void processPermutation(UIImage *image, int permutation, NSString *sessionDirectory) {
    CGImageRef cgImg = [image CGImage];
    if (!cgImg) {
        NSLog(@"Failed to get CGImage from UIImage.");
        return;
    }

    switch (permutation) {
        case 1:
            NSLog(@"Case: Creating bitmap context with Standard RGB settings");
            createBitmapContextStandardRGB(cgImg, sessionDirectory, permutation);
            break;
        case 2:
            NSLog(@"Case: Creating bitmap context with Premultiplied First Alpha settings");
            createBitmapContextPremultipliedFirstAlpha(cgImg, sessionDirectory, permutation);
            break;
        case 3:
            NSLog(@"Case: Creating bitmap context with Non-Premultiplied Alpha settings");
            createBitmapContextNonPremultipliedAlpha(cgImg, sessionDirectory, permutation);
            break;
        case 4:
            NSLog(@"Case: Creating bitmap context with 16-bit depth settings");
            createBitmapContext16BitDepth(cgImg, sessionDirectory, permutation);
            break;
        case 5:
            NSLog(@"Grayscale image processing is currently pending implementation.");
            break;
        case 6:
            NSLog(@"Case: Creating bitmap context with HDR Float Components settings");
            createBitmapContextHDRFloatComponents(cgImg, sessionDirectory, permutation);
            break;
        case 7:
            NSLog(@"Case: Creating bitmap context with Alpha Only settings");
            createBitmapContextAlphaOnly(cgImg, sessionDirectory, permutation);
            break;
        case 8:
            NSLog(@"Case: Creating bitmap context with 1-bit Monochrome settings");
            createBitmapContext1BitMonochrome(cgImg, sessionDirectory, permutation);
            break;
        case 9:
            NSLog(@"Case: Creating bitmap context with Big Endian pixel format settings");
            createBitmapContextBigEndian(cgImg, sessionDirectory, permutation);
            break;
        case 10:
            NSLog(@"Case: Creating bitmap context with Little Endian pixel format settings");
            createBitmapContextLittleEndian(cgImg, sessionDirectory, permutation);
            break;
        case 11:
            NSLog(@"Case: Creating bitmap context with 8-bit depth, inverted colors settings");
            createBitmapContext8BitInvertedColors(cgImg, sessionDirectory, permutation);
            break;
        case 12:
            NSLog(@"Case: Creating bitmap context with 32-bit float, 4-component settings");
            createBitmapContext32BitFloat4Component(cgImg, sessionDirectory, permutation);
            break;
        default:
            NSLog(@"Case: Invalid permutation number %d", permutation);
            break;
    }
    NSLog(@"Completed image processing for permutation %d", permutation);
}

void processImage(UIImage *image, int permutation, NSString *sessionDirectory) {
    CGImageRef cgImg = [image CGImage];
    if (!cgImg) {
        NSLog(@"Failed to get CGImage from UIImage.");
        return;
    }

    if (permutation == ALL) {
        for (int i = 1; i <= MAX_PERMUTATION; i++) {
            processPermutation(image, i, sessionDirectory);
        }
    } else {
        processPermutation(image, permutation, sessionDirectory);
    }
    
    NSLog(@"Completed image processing for permutation %d", permutation);
}

void createBitmapContextStandardRGB(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    if (verboseLogging) {
        NSLog(@"Creating bitmap context with Standard RGB settings and applying fuzzing");
    }
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

    if (verboseLogging) {
        NSLog(@"Drawing image into the bitmap context");
    }
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    if (verboseLogging) {
        NSLog(@"Applying enhanced fuzzing logic to the bitmap context");
    }
    applyEnhancedFuzzingToBitmapContext(rawData, width, height);  // Assume this function applies more sophisticated fuzzing

    if (verboseLogging) {
        NSLog(@"Creating CGImage from the modified bitmap context");
    }
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextStandardRGB_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        if (verboseLogging) {
            NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);
            NSLog(@"Modified UIImage created successfully");
            NSLog(@"New image size: %@, scale: %f, rendering mode: %ld",
                  NSStringFromCGSize(newImage.size),
                  newImage.scale,
                  (long)newImage.renderingMode);
        }
    }

    CGContextRelease(ctx);
    free(rawData);

    if (verboseLogging) {
        NSLog(@"Bitmap context processing complete");
        NSLog(@"Bitmap context with Standard RGB settings created and fuzzing applied");
    }
}

void createBitmapContextPremultipliedFirstAlpha(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with Premultiplied First Alpha settings and applying fuzzing");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 4; // 4 bytes per pixel for RGBA

    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for image processing");
        return;
    }

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrderDefault;
    
    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);

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

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextPremultipliedFirstAlpha_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);

        // Log newImage details
        NSLog(@"Modified UIImage created successfully");
        NSLog(@"New image size: %@, scale: %f, rendering mode: %ld",
              NSStringFromCGSize(newImage.size),
              newImage.scale,
              (long)newImage.renderingMode);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context processing complete");
    NSLog(@"Bitmap context with Premultiplied First Alpha settings created and fuzzing applied");
}

void createBitmapContextNonPremultipliedAlpha(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
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

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextNonPremultipliedAlpha_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);

        // Log newImage details
        NSLog(@"Modified UIImage created successfully");
        NSLog(@"New image size: %@, scale: %f, rendering mode: %ld",
              NSStringFromCGSize(newImage.size),
              newImage.scale,
              (long)newImage.renderingMode);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with Non-Premultiplied Alpha settings created and fuzzing applied");
}

void createBitmapContext16BitDepth(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
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

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContext16BitDepth_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);

        // Log newImage details
        NSLog(@"Modified UIImage created successfully");
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
    NSLog(@"Grayscale image processing is not yet implemented.");
    // No further processing or memory allocations
}

void createBitmapContextHDRFloatComponents(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
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
        
        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextHDRFloatComponents_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);

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

void createBitmapContextAlphaOnly(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with Alpha Only settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width *16; // Need to check spec for bits

    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for Alpha Only image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, width, NULL, kCGImageAlphaOnly);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Alpha Only settings");
        return;
    }
    
    // Draw the image into the context
    NSLog(@"Drawing image into the Alpha Only bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to theAlpha Only bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified Alpha Only bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from Alpha Only context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextAlphaOnly_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);

    NSLog(@"Bitmap context with Alpha Only settings created successfully");
    
    // Example: Logging newImage details
        NSLog(@"New Alpha Only image size: %@, scale: %f",
        NSStringFromCGSize(newImage.size),
        newImage.scale);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with Alpha Only settings created and fuzzing applied");
}

void createBitmapContext1BitMonochrome(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with 1-bit Monochrome settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = ceil((double)width / 8.0); // 1 byte = 8 pixels in 1-bit Monochrome

    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for 1-bit Monochrome image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 1, bytesPerRow, NULL, kCGImageAlphaNone);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with 1-bit Monochrome settings");
        free(rawData);
        return;
    }

    NSLog(@"Drawing image into the 1-bit Monochrome bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    NSLog(@"Applying fuzzing logic to 1-bit Monochrome bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    NSLog(@"Creating CGImage from the modified 1-bit Monochrome bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from 1-bit Monochrome context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContext1BitMonochrome_fuzzed_image_1bit_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed 1-bit Monochrome image saved at: %@", fuzzedImagePath);
        NSLog(@"New 1-bit Monochrome image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with 1-bit Monochrome settings created and fuzzing applied");
}

void createBitmapContextBigEndian(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with Big Endian settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 16; // need to check Spec

    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for Big Endian processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 32, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedLast | kCGBitmapFloatComponents);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Big Endian settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the Big Endian context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the Big Endian context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified Big Endian context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from Big Endian context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextBigEndian_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);
        
        // Here, newImage contains the modified HDR image
        // You can log or use newImage as needed
        NSLog(@"Modified Big Endian created successfully");

        // Example: Logging newImage details
        NSLog(@"New Big Endian image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with Big Endian settings created and fuzzing applied");
}

void createBitmapContextLittleEndian(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with Little Endian settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 16; // need to check Spec
    
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for Big Endian processing");
        return;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, width * 4, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Little);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Little Endian settings");
        return;
    }
    // Draw the image into the context
    NSLog(@"Drawing image into the Little Endian context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the Little Endian context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified Little Endian context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from Little Endian context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextLittleEndian_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);
        
        // Here, newImage contains the modified HDR image
        // You can log or use newImage as needed
        NSLog(@"Modified Little Endian created successfully");

        // Example: Logging newImage details
        NSLog(@"New Little Endian image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with Little Endian settings created and fuzzing applied");
}

void createBitmapContext8BitInvertedColors(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with 8-bit depth, inverted colors");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 8; // need to check Spec
    
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for 8-bit depth, inverted colors processing");
        return;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, width * 4, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaNoneSkipLast | kCGBitmapByteOrder32Little);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with 8-bit depth, inverted colors");
        return;
    }
    // Draw the image into the context
    NSLog(@"Drawing image into the 8-bit depth, inverted colors context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);
    
    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the 8-bit depth, inverted colors context");
    applyFuzzingToBitmapContext(rawData, width, height);
    
    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified 8-bit depth, inverted colors context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from 8-bit depth, inverted colors context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContext8BitInvertedColors_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);
        
        // Here, newImage contains the modified HDR image
        // You can log or use newImage as needed
        NSLog(@"Modified 8-bit depth, inverted colors created successfully");
        
        // Example: Logging newImage details
        NSLog(@"New 8-bit depth, inverted colors image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }
    
    CGContextRelease(ctx);
    free(rawData);
    
    NSLog(@"Bitmap context with 8-bit depth, inverted colors settings created and fuzzing applied");
}
    
void createBitmapContext32BitFloat4Component(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with 32-bit float, 4-component settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 32; // need to check Spec
    
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for 32-bit float, 4-component processing");
        return;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 32, width * 16, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedLast | kCGBitmapFloatComponents);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with 32-bit float, 4-component settings");
        return;
    }
    // Draw the image into the context
    NSLog(@"Drawing image into the 32-bit float, 4-component context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);
    
    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the 32-bit float, 4-component context");
    applyFuzzingToBitmapContext(rawData, width, height);
    
    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified 32-bit float, 4-component context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from 8-bit depth, 32-bit float, 4-component context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);
        
        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContext32BitFloat4Component_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);
        
        // Here, newImage contains the modified HDR image
        // You can log or use newImage as needed
        NSLog(@"Modified 32-bit float, 4-component created successfully");
        
        // Example: Logging newImage details
        NSLog(@"New 32-bit float, 4-component image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }
    
    CGContextRelease(ctx);
    free(rawData);
    
    NSLog(@"Bitmap context with 32-bit float, 4-component settings created and fuzzing applied");
}
