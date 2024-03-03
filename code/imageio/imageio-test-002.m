/**
 *  @file imageio-test-002.m
 *  @brief XNU Image Fuzzer for Jackalope Harness Example 2
 *  @author @h02332 | David Hoyt
 *  @date 03 MAR 2024
 *  @version 1.2.8
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
 *  - 03/03/2024, h02332: Fix use of strok() causing Crash when Injection env vars
 *
 *  @section TODO
 *  - Expand PNG Scope
 *  - ICC Color Profiles.
 */

#pragma mark - Headers

/**
 *  @brief Core and external libraries necessary for the fuzzer functionality.
 *  @details Includes headers for the Foundation framework, Core Graphics,
 *  standard input/output, memory management, and other utilities. These support
 *  image processing, UI interaction, and basic operations essential for the application.
 */

#include <Foundation/Foundation.h>
#include <Foundation/NSURL.h>
#include <dlfcn.h>
#include <stdint.h>
#include <sys/shm.h>
#include <dirent.h>
#include <sys/resource.h>
#include <png.h>
#include <sys/mman.h> // Used for shared memory setup on all platforms

#import <ImageIO/ImageIO.h>
#import <AppKit/AppKit.h>
#import <CoreGraphics/CoreGraphics.h>

#define MAX_SAMPLE_SIZE 1000000
#define SHM_SIZE (4 + MAX_SAMPLE_SIZE)
unsigned char *shm_data;
bool use_shared_memory;

#pragma mark - Shared Memory Setup

/**
 *  @brief Sets up shared memory for inter-process communication.
 *  @details Attempts to open and map a shared memory segment for reading. This is crucial for
 *  fuzzing processes that share data between different instances or with the fuzzing harness.
 *  @param name The unique identifier for the shared memory segment.
 *  @return Returns 1 on success and 0 on failure, indicating problems with accessing or mapping the shared memory.
 */

#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)

#include <windows.h>

int setup_shmem(const char* name) {
    // Windows-specific shared memory setup
    HANDLE map_file = OpenFileMapping(FILE_MAP_ALL_ACCESS, FALSE, name); // Open shared memory
    if (map_file == NULL) {
        printf("Error accessing shared memory: %s\n", name);
        return 0;
    }

    shm_data = (unsigned char*)MapViewOfFile(map_file, FILE_MAP_ALL_ACCESS, 0, 0, SHM_SIZE);
    if (shm_data == NULL) {
        printf("Error mapping shared memory: %s\n", name);
        CloseHandle(map_file);
        return 0;
    }

    return 1;
}

#else // UNIX-like systems shared memory setup

#include <sys/mman.h>
#include <fcntl.h> // For O_* constants

int setup_shmem(const char *name)
{
  int fd;

  // get shared memory file descriptor (NOT a file)
  fd = shm_open(name, O_RDONLY, S_IRUSR | S_IWUSR);
  if (fd == -1)
  {
    printf("Error in shm_open\n");
    return 0;
  }

  // map shared memory to process address space
  shm_data = (unsigned char *)mmap(NULL, SHM_SIZE, PROT_READ, MAP_SHARED, fd, 0);
  if (shm_data == MAP_FAILED)
  {
    printf("Error in mmap\n");
      close(fd);
      return 0;
  }

  return 1;
}

#endif

#pragma mark - Function Modifiers

/**
 *  @brief Defines function visibility and optimization attributes.
 *  @details Adjusts the visibility and optimization of the fuzz target function depending on the platform.
 *  This ensures the function is accessible where needed and that compiler optimizations do not inline the function,
 *  which is crucial for accurate fuzzing behavior.
 */

#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)
#define FUZZ_TARGET_MODIFIERS __declspec(dllexport)
#else
#define FUZZ_TARGET_MODIFIERS __attribute__ ((noinline))
#endif

#pragma mark - External Function Declarations

/**
 *  @brief Declarations for external graphics state management functions.
 *  @details These functions are used to manage graphics rendering states, specifically for enabling or disabling
 *  hardware acceleration. This can be crucial for reproducing certain types of bugs or ensuring consistent behavior
 *  across different hardware configurations.
 */
extern bool CGRenderingStateGetAllowsAcceleration(void*);
extern bool CGRenderingStateSetAllowsAcceleration(void*, bool);
extern void* CGContextGetRenderingState(CGContextRef);

#pragma mark - Logging Procedure

/**
 *  @brief Dummy logging procedure for ImageIO.
 *  @details Intended to replace the default logging procedure of ImageIO with a no-operation (noop) implementation.
 *  This can be useful for suppressing verbose logging during fuzzing, which can clutter output and slow down execution.
 */
void dummyLogProc() { }

#pragma mark - ImageIO Logging Configuration

/**
 *  @brief Configures the logging procedure for ImageIO.
 *  @details This external function allows setting a custom logging procedure for ImageIO operations. By default,
 *  this implementation sets a dummy (noop) logging procedure to minimize noise during fuzzing.
 */
extern void ImageIOSetLoggingProc(void*);

#pragma mark - Graphics Context Reference

/**
 *  @brief Global reference to the graphics context.
 *  @details Holds a reference to the graphics context used for drawing operations. This context is configured
 *  and used for rendering images loaded during fuzzing, allowing for the examination of rendering behavior
 *  and potential vulnerabilities in image processing.
 */
CGContextRef ctx;

#pragma mark - Bitmap Context Creation Functions

/**
 *  @brief Creates a bitmap graphics context with High Dynamic Range (HDR) and floating-point components.
 *  @param width The width of the context in pixels.
 *  @param height The height of the context in pixels.
 *  @return A new bitmap graphics context.
 */
CGContextRef createBitmapContextHDRFloatComponents(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapFloatComponents;
    size_t bitsPerComponent = 32;
    size_t bytesPerRow = 4 * width * sizeof(float);
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 *  @brief Creates a bitmap graphics context optimized for alpha-only components.
 *  @param width The width of the context in pixels.
 *  @param height The height of the context in pixels.
 *  @return A new bitmap graphics context.
 */
CGContextRef createBitmapContextAlphaOnly(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGBitmapInfo bitmapInfo = kCGImageAlphaOnly;
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = width;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 *  @brief Creates a bitmap graphics context with premultiplied first alpha component.
 *  @param width The width of the context in pixels.
 *  @param height The height of the context in pixels.
 *  @return A new bitmap graphics context.
 */
CGContextRef createBitmapContextPremultipliedFirstAlpha(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width;
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedFirst;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 *  @brief Creates a bitmap graphics context with non-premultiplied alpha components.
 *  @param width The width of the context in pixels.
 *  @param height The height of the context in pixels.
 *  @return A new bitmap graphics context.
 */
CGContextRef createBitmapContextNonPremultipliedAlpha(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = 4 * width;
    CGBitmapInfo bitmapInfo = kCGImageAlphaLast;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

/**
 *  @brief Creates a bitmap graphics context with 16-bit depth per component.
 *  @param width The width of the context in pixels.
 *  @param height The height of the context in pixels.
 *  @return A new bitmap graphics context.
 */
CGContextRef createBitmapContext16BitDepth(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bitsPerComponent = 16;
    size_t bytesPerRow = 8 * width; // 2 bytes per component * 4 components per pixel
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder16Big;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}


#pragma mark - Fuzz Target Function

/**
 *  @brief Processes the given image name or shared memory for fuzzing.
 *  @discussion This function attempts to load image data from a specified file or shared memory segment.
 *  It then renders the image using a Core Graphics context to validate image processing and potentially
 *  uncover vulnerabilities within the rendering pipeline.
 *  @param name The file path to the image or an identifier for a shared memory segment containing image data.
 */
void FUZZ_TARGET_MODIFIERS fuzz(char *name) {
    NSImage* img = NULL;
    char *sample_bytes = NULL;
    uint32_t sample_size = 0;

    // Load image data from shared memory or from a file
    if(use_shared_memory) {
        // Extract the size of the image data from shared memory
        sample_size = *(uint32_t *)(shm_data);
        if(sample_size > MAX_SAMPLE_SIZE) sample_size = MAX_SAMPLE_SIZE; // Clamp to max size
        sample_bytes = (char *)malloc(sample_size);
        if (!sample_bytes) {
            printf("Memory allocation failed\n");
            return;
        }
        memcpy(sample_bytes, shm_data + 4, sample_size); // Copy data from shared memory
        img = [[NSImage alloc] initWithData:[NSData dataWithBytesNoCopy:sample_bytes length:sample_size freeWhenDone:YES]];
    } else {
        // Load the image from a file path
        img = [[NSImage alloc] initWithContentsOfFile:[NSString stringWithUTF8String:name]];
    }

    // Attempt to render the image if it was successfully loaded
    if (img) {
        CGImageRef cgImg = [img CGImageForProposedRect:nil context:nil hints:nil];
        if (cgImg) {
            size_t width = CGImageGetWidth(cgImg);
            size_t height = CGImageGetHeight(cgImg);
            CGRect rect = CGRectMake(0, 0, width, height);
            CGContextDrawImage(ctx, rect, cgImg); // Render the image
            CGImageRelease(cgImg); // Release the CGImageRef
        }
    }

    // Clean up dynamically allocated memory
    if(sample_bytes) {
        free(sample_bytes);
    }
}

#pragma mark - Environment Variable Setup

/**
 *  @brief Configures environment variables for detailed graphics debugging.
 *  @discussion Sets numerous environment variables to enable verbose logging for various graphics operations.
 *  This can significantly aid in diagnosing issues with image processing and rendering, providing insight into
 *  the internal workings of graphics frameworks used by the application.
 */
void setupEnvironmentVariables() {
    char *vars[] = {
        "CG_PDF_VERBOSE=1",
        "CG_CONTEXT_SHOW_BACKTRACE=1",
        "CG_CONTEXT_SHOW_BACKTRACE_ON_ERROR=1",
        "CG_IMAGE_SHOW_MALLOC=1",
        "CG_LAYER_SHOW_BACKTRACE=1",
        "CGBITMAP_CONTEXT_LOG=1",
        "CGCOLORDATAPROVIDER_VERBOSE=1",
        "CGPDF_LOG_PAGES=1",
        "CGBITMAP_CONTEXT_LOG_ERRORS=1",
        "CG_RASTERIZER_VERBOSE=1",
        "CG_VERBOSE_COPY_IMAGE_BLOCK_DATA=1",
        "CG_VERBOSE=1",
        "CGPDF_VERBOSE=1",
        "CG_FONT_RENDERER_VERBOSE=1",
        "CGPDF_DRAW_VERBOSE=1",
        "CG_POSTSCRIPT_VERBOSE=1",
        "CG_COLOR_CONVERSION_VERBOSE=1",
        "CG_IMAGE_LOG_FORCE=1",
        "CG_INFO=1",
        "CGPDFCONTEXT_VERBOSE=1",
        "QuartzCoreDebugEnabled=1",
        "CI_PRINT_TREE=1",
        "CORESVG_VERBOSE=1",
        NULL
    };
    for (int i = 0; vars[i] != NULL; ++i) {
        char *var = strdup(vars[i]); // Duplicate the string.
        char *key = strtok(var, "=");
        char *value = strtok(NULL, "");
        setenv(key, value, 1);
        free(var); // Free the duplicated string.
    }

}

#pragma mark - Main Function

/**
 *  @brief The main entry point of the fuzzing application.
 *  @param argc Argument count.
 *  @param argv Argument vector.
 *  @return Returns 0 on successful execution, or a non-zero value on error.
 *  @discussion Initializes the fuzzing environment, including setting up shared memory if necessary,
 *  and iterates through different bitmap context creation functions to perform fuzzing operations.
 */
int main(int argc, char **argv) {
    @autoreleasepool {
        setupEnvironmentVariables();

        if(argc != 3) {
            NSLog(@"Usage: %s <-f|-m> <file or shared memory name>", argv[0]);
            return 0;
        }

        BOOL use_shared_memory = !strcmp(argv[1], "-m");
        NSLog(@"Shared memory usage is set to: %@", use_shared_memory ? @"YES" : @"NO");

        if(use_shared_memory && !setup_shmem(argv[2])) {
            NSLog(@"Error mapping shared memory");
            return 0;
        }

        ImageIOSetLoggingProc(&dummyLogProc);

        CGContextRef (*contextCreationFunctions[])(size_t, size_t) = {
            createBitmapContextPremultipliedFirstAlpha,
            createBitmapContextNonPremultipliedAlpha,
            createBitmapContext16BitDepth,
            createBitmapContextHDRFloatComponents,
            createBitmapContextAlphaOnly
        };
        int numberOfFunctions = sizeof(contextCreationFunctions) / sizeof(contextCreationFunctions[0]);

        for (int i = 0; i < numberOfFunctions; i++) {
            CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();

            NSLog(@"Creating bitmap context with function index: %d", i);
            CGContextRef ctx = contextCreationFunctions[i](32, 32);

            if (ctx == NULL) {
                NSLog(@"Failed to create bitmap context for function index %d", i);
                CGColorSpaceRelease(colorspace);
                continue;
            }

            void* renderingState = CGContextGetRenderingState(ctx);
            CGRenderingStateSetAllowsAcceleration(renderingState, false);

            NSLog(@"Fuzzing with the created bitmap context");
            fuzz(argv[2]);

            CGContextRelease(ctx);
            CGColorSpaceRelease(colorspace);
            NSLog(@"Bitmap context and color space released");
        }

        NSLog(@"Completed all iterations");
    }
    return 0;
}
