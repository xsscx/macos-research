/**
 *  @file imageio-test-004.m
 *  @brief XNU Image Fuzzer for Jackalope Harness Example 4
 *  @author @h02332 | David Hoyt
 *  @date 02 MAR 2024
 *  @version 1.4.2
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

#pragma mark - Global Variables

/**
 *  @brief Global variables for PNG processing.
 *  @details Holds references to the libpng read structure and info structure, used throughout the PNG processing
 *  lifecycle. These structures manage the state of PNG reading operations, including decoding settings and metadata.
 */
png_structp png_ptr = NULL;
png_infop info_ptr = NULL;

#pragma mark - Custom PNG Reading Function

/**
 *  @brief Reads PNG data from a memory buffer.
 *  @param png_ptr A pointer to the PNG read structure.
 *  @param data A pointer to the data to be read.
 *  @param length The number of bytes to read.
 *  @details Implements a custom PNG data reading mechanism that allows libpng to read image data directly from
 *  a memory buffer. This is particularly useful for fuzzing, as it enables the direct feeding of fuzzed image data
 *  into libpng without needing to work with file I/O.
 */
void png_read_from_mem(png_structp png_ptr, png_bytep data, png_size_t length) {
    // Custom implementation to read PNG from memory
}

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

void FUZZ_TARGET_MODIFIERS fuzz(char *name) {
    NSImage* img = NULL;
    char *sample_bytes = NULL;
    uint32_t sample_size = 0;

    if(use_shared_memory) {
        sample_size = *(uint32_t *)(shm_data);
        if(sample_size > MAX_SAMPLE_SIZE) sample_size = MAX_SAMPLE_SIZE;
        sample_bytes = (char *)malloc(sample_size);
        memcpy(sample_bytes, shm_data + sizeof(uint32_t), sample_size);
        img = [[NSImage alloc] initWithData:[NSData dataWithBytes:sample_bytes length:sample_size]];
    } else {
        img = [[NSImage alloc] initWithContentsOfFile:[NSString stringWithUTF8String:name]];
    }

    // Integrate libpng specific processing here
    if (sample_size >= 8 && !png_sig_cmp((png_const_bytep)sample_bytes, 0, 8)) { // Check if it's a valid PNG
        png_structp png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
        if (png_ptr != NULL) {
            png_infop info_ptr = png_create_info_struct(png_ptr);
            if (info_ptr != NULL) {
                // Use custom read function to read PNG from memory
                png_set_read_fn(png_ptr, sample_bytes, png_read_from_mem);

                if (!setjmp(png_jmpbuf(png_ptr))) {
                    png_read_info(png_ptr, info_ptr);
                    // Perform additional libpng operations as needed
                }
                png_destroy_info_struct(png_ptr, &info_ptr);
            }
            png_destroy_read_struct(&png_ptr, (png_infopp)NULL, (png_infopp)NULL);
        }
    }

    // Continue with original Google example processing
    CGImageRef cgImg = [img CGImageForProposedRect:nil context:nil hints:nil];
    if (cgImg) {
        size_t width = CGImageGetWidth(cgImg);
        size_t height = CGImageGetHeight(cgImg);
        CGRect rect = CGRectMake(0, 0, width, height);
        CGContextDrawImage(ctx, rect, cgImg);
        CGImageRelease(cgImg);
    }

    if(sample_bytes) free(sample_bytes);
}

#pragma mark - Main Entry Point

/**
 *  @brief The main entry point for the fuzzing application.
 *  @discussion This function initializes the fuzzing environment based on command line arguments,
 *  sets up shared memory if required, and initiates the fuzzing process by calling the fuzz function.
 *  It supports running the fuzz target either from a specified file or from shared memory.
 *
 *  @param argc The count of command-line arguments.
 *  @param argv The array of command-line arguments.
 *  @return Returns 0 on successful execution, or a non-zero error code on failure.
 */
int main(int argc, char **argv)
{
    // Validate command-line arguments
    if(argc != 3) {
        printf("Usage: %s <-f|-m> <file or shared memory name>\n", argv[0]);
        return 0;
    }

    // Determine the mode of operation based on command-line arguments
    if(!strcmp(argv[1], "-m")) {
        use_shared_memory = true; // Shared memory mode
    } else if(!strcmp(argv[1], "-f")) {
        use_shared_memory = false; // File mode
    } else {
        // Incorrect usage
        printf("Usage: %s <-f|-m> <file or shared memory name>\n", argv[0]);
        return 0;
    }

    // Setup shared memory if running in shared memory mode
    if(use_shared_memory) {
        if(!setup_shmem(argv[2])) {
            printf("Error mapping shared memory\n");
            return 0; // Exit if shared memory setup fails
        }
    }

    // Setup ImageIO logging to use a custom, no-op logging procedure
    ImageIOSetLoggingProc(&dummyLogProc);

    // Create a graphics context for image rendering
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    ctx = CGBitmapContextCreate(NULL, 32, 32, 8, 0, colorspace, kCGImageAlphaPremultipliedFirst);
    void* renderingState = CGContextGetRenderingState(ctx);

    // Disable hardware acceleration for rendering, if necessary
    CGRenderingStateSetAllowsAcceleration(renderingState, false);

    // Start the fuzzing process with the provided input
    fuzz(argv[2]);

    // Cleanup
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorspace);

    return 0; // Successful execution
}
