/**
 *  @file imageio-test-002.m
 *  @brief XNU Image Fuzzer for Jackalope Harness Example #5
 *  @author @h02332 | David Hoyt
 *  @date 01 MAR 2024
 *  @version 1.2.6
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

/**
 *  @brief The main entry point for the fuzzer.
 *  @discussion Initializes the fuzzing environment, including shared memory setup
 *  and graphics context preparation. It then invokes the fuzz function to analyze
 *  the input image data.
 */
int main(int argc, char **argv)
{
  if(argc != 3) {
    printf("Usage: %s <-f|-m> <file or shared memory name>\n", argv[0]);
    return 0;
  }

  if(!strcmp(argv[1], "-m")) {
    use_shared_memory = true;
  } else if(!strcmp(argv[1], "-f")) {
    use_shared_memory = false;
  } else {
    printf("Usage: %s <-f|-m> <file or shared memory name>\n", argv[0]);
    return 0;
  }

  // map shared memory here as we don't want to do it
  // for every operation
  if(use_shared_memory) {
    if(!setup_shmem(argv[2])) {
      printf("Error mapping shared memory\n");
    }
  }

  ImageIOSetLoggingProc(&dummyLogProc);
  CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
  ctx = CGBitmapContextCreate(0, 32, 32, 8, 0, colorspace, 1);
  void* renderingState = CGContextGetRenderingState(ctx);
  CGRenderingStateSetAllowsAcceleration(renderingState, false);

  fuzz(argv[2]);

  return 0;
}
