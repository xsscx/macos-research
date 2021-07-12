/**
 *  @file imageio-test-005.m
 *  @brief XNU Image Fuzzer for Jackalope Harness Example 5
 *  @author @h02332 | David Hoyt
 *  @date 01 MAR 2024
 *  @version 1.5.6
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
 *  - 03/03/2024, h02332:
 *
 *  @section TODO
 *  - Grayscale Implementation.
 *  - ICC Color Profiles.
 *  - Refactor Example Fuzzer.
 */

#pragma mark - Headers

/**
 *  @brief Core and external libraries necessary for the fuzzer functionality.
 *  @details This section includes the necessary headers for the Foundation framework, UIKit, Core Graphics,
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
#import <ImageIO/ImageIO.h>
#import <AppKit/AppKit.h>
#import <CoreGraphics/CoreGraphics.h>

// Shared memory configuration for cross-platform compatibility
#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)
#include <windows.h>
#else
#include <sys/mman.h>
#endif

#define MAX_SAMPLE_SIZE 1000000
#define SHM_SIZE (4 + MAX_SAMPLE_SIZE)
unsigned char *shm_data;

#pragma mark - Shared Memory Configuration

bool use_shared_memory;

/**
 *  @brief Setup shared memory for cross-platform compatibility.
 *  @details This function sets up shared memory, allowing for inter-process communication, which is essential for
 *  distributing fuzzing tasks across different processes or machines. It uses platform-specific APIs to create or open
 *  a shared memory segment.
 *  @param name The name of the shared memory segment.
 *  @return Returns 1 on success and 0 on failure, indicating problems with shared memory access or setup.
 */
#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)

int setup_shmem(const char* name) {
  HANDLE map_file = OpenFileMapping(FILE_MAP_ALL_ACCESS, FALSE, name);
  if (map_file == NULL) {
    printf("Error accessing shared memory\n");
    return 0;
  }

  shm_data = (unsigned char*)MapViewOfFile(map_file, FILE_MAP_ALL_ACCESS, 0, 0, SHM_SIZE);
  if (shm_data == NULL) {
    printf("Error accessing shared memory\n");
    CloseHandle(map_file);
    return 0;
  }

  return 1;
}

#else

int setup_shmem(const char *name) {
  int fd = shm_open(name, O_RDONLY, S_IRUSR | S_IWUSR);
  if (fd == -1) {
    printf("Error in shm_open\n");
    return 0;
  }

  shm_data = (unsigned char *)mmap(NULL, SHM_SIZE, PROT_READ, MAP_SHARED, fd, 0);
  if (shm_data == MAP_FAILED) {
    printf("Error in mmap\n");
    close(fd);
    return 0;
  }

  return 1;
}

#endif

#pragma mark - Function Modifiers

/**
 *  @brief Function modifiers to ensure the fuzz target is properly exported or attributed for optimization.
 *  @details These modifiers adjust the visibility and optimization of the fuzz target function depending on the platform.
 *  This ensures the function is accessible where it needs to be and that certain compiler optimizations do not inline the function.
 */
#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)
#define FUZZ_TARGET_MODIFIERS __declspec(dllexport)
#else
#define FUZZ_TARGET_MODIFIERS __attribute__ ((noinline))
#endif

/**
 *  @brief Logs a debug message to the console.
 *  @param message The message to log.
 *  @details This function is a simple utility to log debug messages, which can be useful for tracking the execution flow or identifying issues.
 */
void debugLog(NSString *format, ...) NS_FORMAT_FUNCTION(1,2) {
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    NSLog(@"%@", message);
}

// External function declarations for advanced graphics operations
extern bool CGRenderingStateGetAllowsAcceleration(void*);
extern bool CGRenderingStateSetAllowsAcceleration(void*, bool);
extern void* CGContextGetRenderingState(CGContextRef);
extern void ImageIOSetLoggingProc(void*);

#pragma mark - Utility Functions

/**
 *  @brief Dummy logging procedure for ImageIO.
 *  @details This function is intended to replace the default logging procedure of ImageIO with a no-operation implementation, potentially to avoid verbose logging during fuzzing.
 */
void dummyLogProc() {}

#pragma mark - Context Creation Functions


// Global variable to hold the graphics context reference
CGContextRef ctx;

// Function to create a bitmap context with HDR and floating-point components
CGContextRef createBitmapContextHDRFloatComponents(size_t width, size_t height) {
    debugLog(@"%@", @"Creating bitmap context with HDRFloatComponents");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapFloatComponents;
    size_t bitsPerComponent = 32;
    size_t bytesPerRow = 4 * width * sizeof(float);
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

// Function to create a bitmap context optimized for alpha-only components
CGContextRef createBitmapContextAlphaOnly(size_t width, size_t height) {
    debugLog(@"%@", @"Creating bitmap context with ContextAlphaOnly");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGBitmapInfo bitmapInfo = kCGImageAlphaOnly;
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = width;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

CGContextRef createBitmapContextPremultipliedFirstAlpha(size_t width, size_t height) {
    debugLog(@"%@", @"Creating bitmap context with PremultipliedFirstAlpha");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width;
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedFirst;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

CGContextRef createBitmapContextNonPremultipliedAlpha(size_t width, size_t height) {
    debugLog(@"%@", @"Creating bitmap context NonPremultipliedAlpha");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width;
    CGBitmapInfo bitmapInfo = kCGImageAlphaLast;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

CGContextRef createBitmapContext16BitDepth(size_t width, size_t height) {
    debugLog(@"%@", @"Creating bitmap context with 16-bit depth");
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 16;
    size_t bytesPerRow = 8 * width; // 2 bytes per component * 4 components per pixel
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder16Big;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

// Additional context creation functions...

#pragma mark - Fuzz Target Function

/**
 *  @brief Fuzz target function to process image samples.
 *  @param name The name or identifier for the sample being processed. This could be a filename or a memory segment name.
 *  @details This function is the main entry point for the fuzzing process. It takes image samples, either from shared memory or file, and processes them using various graphics contexts to uncover potential vulnerabilities or issues.
 */
void FUZZ_TARGET_MODIFIERS fuzz(char *name) {
    NSImage* img = NULL;
    char *sample_bytes = NULL;
    uint32_t sample_size = 0;

    if(use_shared_memory) {
        sample_size = *(uint32_t *)(shm_data);
        if(sample_size > MAX_SAMPLE_SIZE) sample_size = MAX_SAMPLE_SIZE;
        sample_bytes = (char *)malloc(sample_size);
        if (!sample_bytes) {
            printf("Memory allocation failed\n");
            return;
        }
        memcpy(sample_bytes, shm_data + 4, sample_size);
//        img = [[NSImage alloc] initWithData:[NSData dataWithBytesNoCopy:sample_bytes length:sample_size freeWhenDone:YES]];
        img = [[NSImage alloc] initWithData:[NSData dataWithBytes:sample_bytes length:sample_size]];
    } else {
        img = [[NSImage alloc] initWithContentsOfFile:[NSString stringWithUTF8String:name]];
    }

    if (img) {
        CGImageRef cgImg = [img CGImageForProposedRect:nil context:nil hints:nil];
        if (cgImg) {
            size_t width = CGImageGetWidth(cgImg);
            size_t height = CGImageGetHeight(cgImg);
            CGRect rect = CGRectMake(0, 0, width, height);
            CGContextDrawImage(ctx, rect, cgImg);
            CGImageRelease(cgImg);
        }
    }
}

#pragma mark - Main Function

/**
 * @brief The entry point of the fuzzer application.
 * @details This function initializes the fuzzer with command-line arguments to either read from a file or shared memory. It then iterates through different bitmap context creation functions to fuzz the input.
 * @param argc The number of command-line arguments.
 * @param argv The array of command-line arguments.
 * @return Returns 0 on successful execution or an error code on failure.
 */
int main(int argc, char **argv) {
    @autoreleasepool {
        // Validate command-line arguments
        if(argc != 3) {
//            debugLog(@"Usage: %s <-f|-m> <file or shared memory name>", argv[0]);
            return 0;
        }

//        debugLog([NSString stringWithFormat:@"Starting with arguments: %s %s", argv[1], argv[2]]);

        // Determine the mode of operation based on command-line arguments
        use_shared_memory = !strcmp(argv[1], "-m");
//        debugLog([NSString stringWithFormat:@"Shared memory usage is set to: %@", use_shared_memory ? @"YES" : @"NO"]);

        // Setup shared memory if required
        if(use_shared_memory && !setup_shmem(argv[2])) {
//            debugLog(@"Error mapping shared memory");
            return 0;
        }

        // Suppress ImageIO's default logging
        ImageIOSetLoggingProc(&dummyLogProc);

        // Array of context creation functions
        CGContextRef (*contextCreationFunctions[])(size_t, size_t) = {
            createBitmapContextPremultipliedFirstAlpha,
            createBitmapContextNonPremultipliedAlpha,
            createBitmapContext16BitDepth,
            createBitmapContextHDRFloatComponents,
            createBitmapContextAlphaOnly
        };
        int numberOfFunctions = sizeof(contextCreationFunctions) / sizeof(contextCreationFunctions[0]);

        // Iterate over each context creation function to fuzz the input
        for (int i = 0; i < numberOfFunctions; i++) {
            CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();

//            debugLog([NSString stringWithFormat:@"Creating bitmap context with function index: %d", i]);
            ctx = contextCreationFunctions[i](32, 32);

            if (ctx == NULL) {
//                debugLog([NSString stringWithFormat:@"Failed to create bitmap context for function index %d", i]);
                CGColorSpaceRelease(colorspace);
                continue;
            }

            // Disable hardware acceleration for the rendering state
            void* renderingState = CGContextGetRenderingState(ctx);
            CGRenderingStateSetAllowsAcceleration(renderingState, false);

            // Perform fuzzing with the created bitmap context
//            debugLog(@"Fuzzing with the created bitmap context");
            fuzz(argv[2]);

            // Clean up resources
            CGContextRelease(ctx);
            CGColorSpaceRelease(colorspace);
//            debugLog(@"Bitmap context and color space released");
        }

//        debugLog(@"Completed all iterations");
    }
    return 0;
}
