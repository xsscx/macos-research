/**
 *  @file imageio-test-006.m
 *  @brief XNU Image Fuzzer for Jackalope Harness Example 6
 *  @author @h02332 | David Hoyt
 *  @date 03 MAR 2024
 *  @version 1.6.8
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 *  @section CHANGES
 *  - 26/11/2023, h02332: Initial commit.
 *  - 21/02/2024, h02332: Refactor Fuzzing Contexts for Floats & Alpha, Fix Coverage, Math & Programming Mistakes.
 *  - 21/02/2024, h02332: PermaLink https://srd.cx/xnu-image-fuzzer/.
 *
 *  @section TODO
 *  - Grayscale Implementation.
 *  - ICC Color Profiles.
 *  - Refactor Example Fuzzer.
 */

#pragma mark - Headers

/**
 *  @brief Core and external libraries necessary for the fuzzer functionality.
 *  @discussion This section includes the necessary headers for the Foundation framework, UIKit, Core Graphics,
 *  standard input/output, standard library, memory management, mathematical functions,
 *  Boolean type, floating-point limits, and string functions. These libraries support
 *  image processing, UI interaction, and basic C operations essential for the application.
 */
#include <Foundation/Foundation.h>
#include <Foundation/NSURL.h>
#include <dlfcn.h>
#include <stdint.h>
#include <sys/shm.h>
#include <dirent.h>
#include <sys/resource.h>
#include <CoreGraphics/CoreGraphics.h>
#include <stdlib.h>

#import <ImageIO/ImageIO.h>
#import <AppKit/AppKit.h>
#import <CoreGraphics/CoreGraphics.h>

#pragma mark - Shared Memory Configuration

/**
 * @brief Defines for cross-platform compatibility.
 */
#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)
#include <windows.h>
#else
#include <sys/mman.h>
#endif

/**
 * @brief Maximum size for the sample data.
 */
#define MAX_SAMPLE_SIZE 1000000

/**
 * @brief Size of the shared memory segment.
 */
#define SHM_SIZE (4 + MAX_SAMPLE_SIZE)

/**
 * @brief Pointer to the shared memory data.
 */
unsigned char *shm_data;

/**
 * @brief Flag to indicate if shared memory is being used.
 */
bool use_shared_memory;

#pragma mark - Shared Memory Setup Functions

#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)

/**
 * @brief Sets up shared memory on Windows platforms.
 * @param name The name of the shared memory segment.
 * @return 1 on success, 0 on failure.
 */
int setup_shmem(const char* name) {
    HANDLE map_file;

    // Open the named file mapping object.
    map_file = OpenFileMapping(
        FILE_MAP_ALL_ACCESS,   // read/write access
        FALSE,                 // do not inherit the name
        name);                 // name of mapping object

    if (map_file == NULL) {
        printf("Error accessing shared memory\n");
        return 0;
    }

    // Map the shared memory to the process's address space.
    shm_data = (unsigned char*)MapViewOfFile(map_file, // handle to map object
                                             FILE_MAP_ALL_ACCESS,  // read/write permission
                                             0,
                                             0,
                                             SHM_SIZE);

    if (shm_data == NULL) {
        printf("Error accessing shared memory\n");
        return 0;
    }

    return 1;
}

#else

/**
 * @brief Sets up shared memory on POSIX-compliant systems.
 * @param name The name of the shared memory segment.
 * @return 1 on success, 0 on failure.
 */
int setup_shmem(const char *name) {
    int fd;

    // Open the shared memory segment.
    fd = shm_open(name, O_RDONLY, S_IRUSR | S_IWUSR);
    if (fd == -1) {
        printf("Error in shm_open\n");
        return 0;
    }

    // Map the shared memory to the process's address space.
    shm_data = (unsigned char *)mmap(NULL, SHM_SIZE, PROT_READ, MAP_SHARED, fd, 0);
    if (shm_data == MAP_FAILED) {
        printf("Error in mmap\n");
        return 0;
    }

    return 1;
}

#endif

/**
 * Creates a simple color table with predefined colors.
 *
 * - Parameters:
 *   - colorTable: A pointer to an array where the color table data will be stored.
 *   - maxColors: The maximum number of colors that can be stored in the color table.
 */
void createSimpleColorTable(uint8_t *colorTable, size_t maxColors) {
    // Ensure the color table can hold at least 4 colors
    if (maxColors < 4) return;

    // Color 0: Black
    colorTable[0] = 0; // R
    colorTable[1] = 0; // G
    colorTable[2] = 0; // B

    // Color 1: Red
    colorTable[3] = 255; // R
    colorTable[4] = 0;   // G
    colorTable[5] = 0;   // B

    // Color 2: Green
    colorTable[6] = 0;   // R
    colorTable[7] = 255; // G
    colorTable[8] = 0;   // B

    // Color 3: Blue
    colorTable[9] = 0;   // R
    colorTable[10] = 0;  // G
    colorTable[11] = 255;// B
}

#pragma mark - Configuration and External Declarations

// Ensures compatibility across platforms by modifying the target function's linkage and visibility
#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)
#define FUZZ_TARGET_MODIFIERS __declspec(dllexport)
#else
#define FUZZ_TARGET_MODIFIERS __attribute__ ((noinline))
#endif

#pragma mark - External Functions

/**
 @abstract Retrieves the current acceleration state of the rendering context.
 @param context The rendering context to query.
 @return A Boolean value indicating whether acceleration is allowed.
 */
extern bool CGRenderingStateGetAllowsAcceleration(void* context);

/**
 @abstract Sets the acceleration state of the rendering context.
 @param context The rendering context to modify.
 @param allow A Boolean value indicating whether to allow acceleration.
 @return A Boolean value indicating the success of the operation.
 */
extern bool CGRenderingStateSetAllowsAcceleration(void* context, bool allow);

/**
 @abstract Retrieves the rendering state from a CGContext.
 @param context The CGContext from which to retrieve the rendering state.
 @return A pointer to the rendering state object.
 */
extern void* CGContextGetRenderingState(CGContextRef context);

#pragma mark - Logging Setup

/**
 @abstract A dummy logging procedure to suppress ImageIO logging output.
 @discussion This function serves as a placeholder to pass to ImageIOSetLoggingProc, effectively silencing
 logging from the ImageIO framework. It's used to reduce noise during fuzzing operations.
 */
void dummyLogProc() { }

/**
 @abstract Configures the logging procedure for ImageIO operations.
 @discussion This function allows customizing the logging behavior of ImageIO, which is particularly useful
 for controlling output during fuzzing. Here, it's used to set a dummy procedure to suppress logs.
 */
extern void ImageIOSetLoggingProc(void*);

#pragma mark - Graphics Context

// Global variable for the graphics context used in image rendering.
CGContextRef ctx;

#pragma mark - Context Creation Functions

/**
 Creates a bitmap graphics context with High Dynamic Range (HDR) and floating-point components.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextHDRFloatComponents(size_t width, size_t height) {
    printf("Creating bitmap context with HDR and floating-point components\n");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapFloatComponents;
    size_t bitsPerComponent = 32;
    size_t bytesPerRow = 4 * width * sizeof(float);
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context optimized for alpha-only components.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextAlphaOnly(size_t width, size_t height) {
    printf("Creating bitmap context with AlphaOnly\n");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGBitmapInfo bitmapInfo = kCGImageAlphaOnly;
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = width;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context with premultiplied first alpha component.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextPremultipliedFirstAlpha(size_t width, size_t height) {
    printf("Creating bitmap context with PreMultipliedFirstAlpha\n");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width;
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedFirst;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context with non-premultiplied alpha component.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextNonPremultipliedAlpha(size_t width, size_t height) {
    printf("Creating bitmap context with NonPreMultipliedFirstAlpha\n");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width;
    CGBitmapInfo bitmapInfo = kCGImageAlphaLast;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context with 16-bit depth per component.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContext16BitDepth(size_t width, size_t height) {
    printf("Creating bitmap context with 16-bit Depth\n");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 16;
    size_t bytesPerRow = 8 * width; // 2 bytes per component * 4 components per pixel
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder16Big;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context with standard RGB settings.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextStandardRGB(size_t width, size_t height) {
    printf("Creating bitmap context with Standard RGB settings\n");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width; // 4 components (RGBA) per pixel
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context for 1-bit monochrome images.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContext1BitMonochrome(size_t width, size_t height) {
    printf("Creating bitmap context for 1-bit Monochrome\n");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    size_t bitsPerComponent = 1;
    size_t bytesPerRow = width / 8; // 1 bit per pixel, 8 pixels per byte
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context with big endian pixel format.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextBigEndian(size_t width, size_t height) {
    printf("Creating bitmap context with Big Endian pixel format\n");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width; // 4 components (RGBA) per pixel
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context with little endian pixel format.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextLittleEndian(size_t width, size_t height) {
    printf("Creating bitmap context with Little Endian pixel format\n");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width; // 4 components (RGBA) per pixel
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Little;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context optimized for grayscale images with alpha.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextGrayscaleWithAlpha(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = width;
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context optimized for wide color content.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextWideColor(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width;
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Big;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context optimized for CMYK color space.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextCMYKColorSpace(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceCMYK();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 5 * width; // CMYK+Alpha
    CGBitmapInfo bitmapInfo = kCGImageAlphaNoneSkipLast;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context optimized for pattern rendering.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextForPattern(size_t width, size_t height) {
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width; // Assuming RGBA for pattern
    CGColorSpaceRef colorSpace = CGColorSpaceCreatePattern(NULL);
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context optimized for high efficiency image formats.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextHighEfficiency(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceITUR_2020);
    size_t bitsPerComponent = 10;
    size_t bytesPerRow = 4 * width; // Assuming 10-bit HDR content
    CGBitmapInfo bitmapInfo = kCGImageAlphaNone | kCGBitmapByteOrder32Little;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context optimized for non-interleaved planar images.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextNonInterleavedPlanar(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = width; // Non-interleaved planar format requires separate planes
    CGBitmapInfo bitmapInfo = kCGImageAlphaNone;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context optimized for indexed color images.

 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.

 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextIndexedColor(size_t width, size_t height) {
    // Define a color table with 4 entries (3 bytes per color)
    uint8_t colorTable[4 * 3];
    createSimpleColorTable(colorTable, 4);

    // Create the indexed color space using the color table
    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateIndexed(baseSpace, 3, colorTable);
    CGColorSpaceRelease(baseSpace); // Release the base color space after use

    size_t bitsPerComponent = 8;
    size_t bytesPerRow = width; // 1 byte per pixel for indexed colors
    
    // Create the bitmap context with the indexed color space
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace); // Release the color space after creating the context

    return context;
}

/**
 Creates a bitmap graphics context optimized for sRGB color space with linear gamma.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextsRGBLinear(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width; // Assuming RGBA
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context optimized for 10-bit grayscale images.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContext10BitGrayscale(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    size_t bitsPerComponent = 10;
    size_t bytesPerRow = (width * 10 + 7) / 8; // Calculate bytes per row for 10-bit components
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 Creates a bitmap graphics context using a custom L*a*b* color space.
 
 - Parameters:
    - width: The width of the bitmap context in pixels.
    - height: The height of the bitmap context in pixels.
 
 - Returns: A CGContextRef representing the created bitmap context.
 */
CGContextRef createBitmapContextCustomLabColorSpace(size_t width, size_t height) {
    CGFloat whitePoint[3] = {0.9505, 1.0, 1.0890}; // D65 white point
    CGFloat blackPoint[3] = {0, 0, 0};
    CGFloat range[4] = {-128, 127, -128, 127}; // L*a*b* range
    CGColorSpaceRef colorSpace = CGColorSpaceCreateLab(whitePoint, blackPoint, range);
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width; // Assuming L*a*b*a (4 components)
    CGBitmapInfo bitmapInfo = kCGImageAlphaNoneSkipLast;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

#pragma mark - Fuzzing Function

/**
 @function fuzz
 @abstract Fuzzes an image file or shared memory data using ImageIO.
 @discussion This function performs fuzz testing on an image by loading it into an NSImage object,
 either from a file or shared memory, and then drawing it onto a graphics context. This can help
 identify vulnerabilities or issues within the image processing pipeline.
 @param name The name of the file or shared memory segment containing the image data.
 */
void FUZZ_TARGET_MODIFIERS fuzz(char *name) {
    // Local variables for image processing
    NSImage* img = NULL;
    char *sample_bytes = NULL;
    uint32_t sample_size = 0;

    // Determine the source of the image data and prepare the NSImage object
    if(use_shared_memory) {
        // Reading image data from shared memory
        sample_size = *(uint32_t *)(shm_data);
        if(sample_size > MAX_SAMPLE_SIZE) sample_size = MAX_SAMPLE_SIZE;
        sample_bytes = (char *)malloc(sample_size);
        memcpy(sample_bytes, shm_data + sizeof(uint32_t), sample_size);
        img = [[NSImage alloc] initWithData:[NSData dataWithBytes:sample_bytes length:sample_size]];
    } else {
        // Loading image from file
        img = [[NSImage alloc] initWithContentsOfFile:[NSString stringWithUTF8String:name]];
    }

    // Drawing the image onto the graphics context
    CGImageRef cgImg = [img CGImageForProposedRect:nil context:nil hints:nil];
    if (cgImg) {
        size_t width = CGImageGetWidth(cgImg);
        size_t height = CGImageGetHeight(cgImg);
        CGRect rect = CGRectMake(0, 0, width, height);
        CGContextDrawImage(ctx, rect, cgImg);
        CGImageRelease(cgImg);
    }

    // Cleanup
    if(sample_bytes) free(sample_bytes);
}

#pragma mark - Program Entry Point

/**
 *  @brief The main entry point for the fuzzer.
 *  @discussion Initializes the fuzzing environment, including shared memory setup
 *  and graphics context preparation. It then invokes the fuzz function to analyze
 *  the input image data.
 */
int main(int argc, char **argv) {
    if (argc != 3) {
        printf("Usage: %s <-f|-m> <file or shared memory name>\n", argv[0]);
        return 0;
    }

    bool use_shared_memory = !strcmp(argv[1], "-m");

    if (use_shared_memory && !setup_shmem(argv[2])) {
        printf("Error mapping shared memory\n");
        return 0;
    }

    ImageIOSetLoggingProc(&dummyLogProc);

    // Array of context creation functions
    CGContextRef (*contextCreationFunctions[])(size_t, size_t) = {
        &createBitmapContextPremultipliedFirstAlpha,
        &createBitmapContextNonPremultipliedAlpha,
        &createBitmapContext16BitDepth,
        &createBitmapContextHDRFloatComponents,
        &createBitmapContextAlphaOnly,
        &createBitmapContextStandardRGB,
        &createBitmapContextBigEndian,
        &createBitmapContextLittleEndian,
        &createBitmapContext1BitMonochrome,
        &createBitmapContextGrayscaleWithAlpha,
        &createBitmapContextWideColor,
        &createBitmapContextCMYKColorSpace,
        &createBitmapContextForPattern,
        &createBitmapContextHighEfficiency,
        &createBitmapContextNonInterleavedPlanar,
        &createBitmapContextIndexedColor,
        &createBitmapContextsRGBLinear,
        &createBitmapContext10BitGrayscale,
        &createBitmapContextCustomLabColorSpace
    };
    int numberOfFunctions = sizeof(contextCreationFunctions) / sizeof(contextCreationFunctions[0]);

    // Iterate over each context creation function to fuzz the input
    for (int i = 0; i < numberOfFunctions; i++) {
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        CGContextRef ctx = contextCreationFunctions[i](32, 32);

        if (ctx == NULL) {
            CGColorSpaceRelease(colorspace);
            continue;
        }

        // Disable hardware acceleration for the rendering state
        void* renderingState = CGContextGetRenderingState(ctx);
        CGRenderingStateSetAllowsAcceleration(renderingState, false);

        // Perform fuzzing with the created bitmap context
        fuzz(argv[2]);

        // Clean up resources
        CGContextRelease(ctx);
        CGColorSpaceRelease(colorspace);
    }

    return 0;
}
