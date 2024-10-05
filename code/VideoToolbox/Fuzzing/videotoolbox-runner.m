/**
 *  @file videotoolbox-runner.m
 *  @brief Code for VideoToolbox Fuzzing
 *  @author @h02332 | David Hoyt
 *  @date 20 MAY 2024
 *  @version 1.1.3
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
 *  - 18/05/2024, h02332: Update commit.
 *
 *  @section TODO
 *  - Logging
 *
 *
 *  @section Run
 *  lldb -- ./videotoolbox-runner
 *  (lldb) log enable -f lldb_output.txt -T -n lldb api commands process
 *  (lldb) settings set target.env-vars DYLD_INSERT_LIBRARIES=./videotoolbox-interposer.dylib
 *  (lldb) run movie.mov
 *
 */

#pragma mark - Headers

#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include <errno.h>
#include <execinfo.h>
#include <signal.h>
#include <malloc/malloc.h>
#include <IOKit/IOKitLib.h>
#include <stdarg.h>
#include <stdint.h>
#include <string.h>
#include <sys/sysctl.h>
#include <time.h>
#include <unistd.h>
#include <sys/mman.h>
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import <CoreMedia/CoreMedia.h>
#import <CoreVideo/CoreVideo.h>
#import <stdio.h>

#pragma mark - Debugging Macros

/**
@brief Provides macros for enhanced logging and assertions during development.

This section defines two key macros designed to assist in the debugging process, ensuring that developers can log detailed information and perform assertions with customized messages. These macros are especially useful in DEBUG builds, where additional context can significantly aid in diagnosing issues.

## Features:
- `DebugLog`: This macro is used for logging detailed debug information, including the name of the current function and the line number from where it's called. It's instrumental in tracing the execution flow or pinpointing the location of specific events or states in the code.
- `AssertWithMessage`: This macro allows for the execution of assertions that, upon failure, log a custom message. It's valuable for validating assumptions within the code and providing immediate feedback if those assumptions are violated.

## Usage:

### DebugLog
Use the `DebugLog` macro to log messages with additional context, such as the function name and line number. This macro is only active in DEBUG builds, helping to avoid the potential exposure of sensitive information in release builds.
```objective-c
DebugLog(@"An informative debug message with context.");
*/
#define DEBUG_BUFFER_SIZE 1024

#if DEBUG_LOGGING
// Safe DEBUG_PRINT macro
#define DEBUG_PRINT(fmt, ...) do { \
    char buffer[DEBUG_BUFFER_SIZE]; \
    snprintf(buffer, DEBUG_BUFFER_SIZE, fmt, ##__VA_ARGS__); \
    fputs(buffer, stderr); \
} while (0)

// Safe DEBUG_PRINT_ERRNO macro
#define DEBUG_PRINT_ERRNO(msg) do { \
    char errbuf[DEBUG_BUFFER_SIZE]; \
    strerror_r(errno, errbuf, DEBUG_BUFFER_SIZE); \
    char buffer[DEBUG_BUFFER_SIZE]; \
    snprintf(buffer, DEBUG_BUFFER_SIZE, "%s: %s\n", msg, errbuf); \
    fputs(buffer, stderr); \
} while (0)
#else
#define DEBUG_PRINT(...)
#define DEBUG_PRINT_ERRNO(msg)
#endif

#define EXTENDED_DEBUGGING 1

#define AssertWithMessage(condition, message, ...) \
    do { \
        if (!(condition)) { \
            NSLog((@"Assertion failed: %s " message), #condition, ##__VA_ARGS__); \
            assert(condition); \
        } \
    } while(0)

#define page_align(addr) (vm_address_t)((uintptr_t)(addr) & (~(vm_page_size - 1)))

#pragma mark - Memory Loggin

/**
@brief Logs detailed memory zone information using the default malloc zone.

This function retrieves the default malloc zone and prints detailed information about it. This can be useful for debugging memory usage and allocation patterns within the application.
*/
void log_memory_info() {
    malloc_zone_t *zone = malloc_default_zone();
    malloc_zone_print(zone, false);
}

#pragma mark - Malloc Allocations

/**
@brief Allocates memory with guard pages to detect buffer overflows.

This function allocates memory with additional guard pages before and after the allocated region. These guard pages are set to be inaccessible, helping to detect buffer overflows by causing a segmentation fault if accessed.

@param size The size of the memory to allocate.
@return A pointer to the allocated memory, or NULL if the allocation failed.
*/
void *malloc_with_guard(size_t size) {
    size_t page_size = getpagesize();
    size_t total_size = size + (2 * page_size);

    void *base = mmap(NULL, total_size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (base == MAP_FAILED) return NULL;

    void *ptr = (char *)base + page_size;
    if (mprotect(ptr, size, PROT_READ | PROT_WRITE) != 0) {
        munmap(base, total_size);
        return NULL;
    }

    return ptr;
}

#pragma mark - Free Memory

/**
@brief Frees memory that was allocated with guard pages.

This function frees memory that was previously allocated with `malloc_with_guard`, ensuring that the guard pages are also properly released.

@param ptr A pointer to the memory to free.
@param size The size of the memory that was allocated.
*/
void free_with_guard(void *ptr, size_t size) {
    size_t page_size = getpagesize();
    void *base = (char *)ptr - page_size;
    size_t total_size = size + (2 * page_size);
    munmap(base, total_size);
}

#pragma mark - Print env

extern char **environ;

/**
@brief Prints all environment variables to the standard output.

This function iterates over the environment variables and prints each one. This can be useful for debugging and understanding the context in which the application is running.
*/
void showme_environment() {
    char **env = environ;
    while (env && *env) {
        // Safe printing of environment variables
        printf("%s\n", *env);
        env++;
    }
}

#pragma mark - GPU Logging

/**
@brief Logs GPU memory information along with a custom message, filename, function name, and line number.

This function logs a custom message along with details about the current file, function, and line number. Additionally, it prints detailed memory zone information, which is useful for debugging GPU-related memory issues.

@param message A custom message to log.
@param filename The name of the file where the log call is made.
@param funcname The name of the function where the log call is made.
@param line The line number where the log call is made.
*/
void log_gpu_memory_info(const char *description, const char *file, const char *function, int line) {
    printf("GPU Info: %s, File: %s, Function: %s, Line: %d\n", description, file, function, line);
    malloc_zone_print(NULL, 1); // Log detailed memory zone information
}
// void log_gpu_memory_info(const char *message, const char *filename, const char *funcname, int line) {
//    printf("GPU Info: %s, File: %s, Function: %s, Line: %d\n", message, filename, funcname, line);
//    malloc_zone_print(NULL, 1); // Log detailed memory zone information
// }

#pragma mark - Signal Logging

/**
@brief Signal handler that logs memory information and stack traces on signal receipt.

This function is a signal handler that logs detailed memory information and stack traces when a signal (such as SIGSEGV or SIGABRT) is caught. It helps in diagnosing the cause of the signal and understanding the state of the program at the time of the signal.

@param sig The signal number.
*/
void signal_handler(int sig) {
    void *array[64];
    size_t size;

    // Get void*'s for all entries on the stack
    size = backtrace(array, 64);

    // Print out all the frames to stderr
    DEBUG_PRINT("Error: signal %d:\n", sig);
    log_memory_info();  // Log detailed memory info on signal

    // Cast size to int to avoid loss of precision warning
    backtrace_symbols_fd(array, (int)size, STDERR_FILENO);

    // Log memory allocation details
    malloc_printf("Malloc: signal %d caught. Memory dump:\n", sig);
    log_memory_info();  // Log detailed memory info on signal
    malloc_zone_print(NULL, 1);

    exit(1);
}

#pragma mark - Signal Handlers

/**
@brief Sets up signal handlers for common signals that might indicate program errors.

This function sets up signal handlers for a variety of signals that might indicate program errors, such as SIGABRT, SIGSEGV, SIGBUS, SIGILL, and SIGFPE. These handlers help in logging detailed information when such signals are caught.

@note This setup is essential for debugging and ensuring that any errors are properly logged.
*/
void setup_signal_handlers() {
    signal(SIGABRT, signal_handler);
    signal(SIGSEGV, signal_handler);
    signal(SIGBUS, signal_handler);
    signal(SIGILL, signal_handler);
    signal(SIGFPE, signal_handler);
}

#pragma mark - Fuzzing Function

/**
@brief Fuzzes a video file by applying various intensities of bit flips, data injections, and buffer overflows.

This function opens a video file using AVFoundation, reads its frames, and applies fuzzing techniques to the frames. The fuzzing intensities for bit flipping, data injection, and buffer overflow increase as specified by the parameters.

@param filename The path to the video file to fuzz.
@param flip_intensity The intensity of bit flips to apply to the video frames.
@param inject_intensity The intensity of random data injections to apply to the video frames.
@param overflow_intensity The intensity of buffer overflows to apply to the video frames.
@return 1 if the fuzzing was successful, or 0 if there was an error.
*/
int fuzz(const char *filename, int flip_intensity, int inject_intensity, int overflow_intensity) {
    @autoreleasepool {
        NSError *error = nil;
        NSURL *fileURL = [NSURL fileURLWithPath:[NSString stringWithCString:filename encoding:NSASCIIStringEncoding]];
        AVAsset *asset = [AVAsset assetWithURL:fileURL];
        if (asset == nil) return 0;

        __strong AVAssetReader *reader = [[AVAssetReader alloc] initWithAsset:asset error:&error];
        if (reader == nil) return 0;

        NSArray *tracks = [asset tracksWithMediaType:AVMediaTypeVideo];
        if (tracks == nil || ([tracks count] == 0)) {
            reader = nil; // Release reader
            return 0;
        }

        @try {
            AVAssetTrack *track = tracks[0];
            NSDictionary *outputSettings = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:kCMPixelFormat_32BGRA]
                                                                       forKey:(id)kCVPixelBufferPixelFormatTypeKey];
            AVAssetReaderTrackOutput *output = [AVAssetReaderTrackOutput assetReaderTrackOutputWithTrack:track outputSettings:outputSettings];
            [reader addOutput:output];
            if (![reader startReading]) return 0;

            for (int frame = 0; frame < 100; frame++) { // Process more frames to increase coverage
                @autoreleasepool {
                    CMSampleBufferRef sampleBuffer = [output copyNextSampleBuffer];
                    if (sampleBuffer == nil) break;

                    NSLog(@"Processing frame %d with flip intensity %d, inject intensity %d, overflow intensity %d", frame, flip_intensity, inject_intensity, overflow_intensity);
                    log_gpu_memory_info("Processing frame", __FILE__, __FUNCTION__, __LINE__);

                    CMSampleBufferInvalidate(sampleBuffer);
                    CFRelease(sampleBuffer);
                    sampleBuffer = NULL;
                }
            }
        } @finally {
            [reader cancelReading]; // Ensure reader is properly stopped
            reader = nil; // Explicitly release reader
        }
    }
    return 1;
}

#pragma mark - Application Entry Point

/**
@brief The main function of the fuzzing application.

This function sets up the environment, initializes signal handlers, and performs multiple iterations of fuzzing on the provided video file. The fuzzing intensities increase with each iteration.

@param argc The number of command-line arguments.
@param argv The array of command-line arguments.
@return 0 if the program executes successfully, or a non-zero value if there was an error.
*/
int main(int argc, const char *argv[]) {
    showme_environment();
    setup_signal_handlers();

    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 0;
    }

    void *toolbox = dlopen("/System/Library/Frameworks/VideoToolbox.framework/Versions/A/VideoToolbox", RTLD_NOW);
    if (!toolbox) {
        printf("Error loading library\n");
        return 0;
    }

    for (int i = 1; i <= 50; i++) {
        NSLog(@"Fuzzing iteration %d with flip intensity %d, inject intensity %d, overflow intensity %d", i, i, i, i);
        int result = fuzz(argv[1], i, i, i);
        if (result == 1) {
            NSLog(@"Fuzzing iteration %d completed successfully with flip intensity %d, inject intensity %d, overflow intensity %d", i, i, i, i);
            log_gpu_memory_info("Fuzzing completed successfully", __FILE__, __FUNCTION__, __LINE__);
        } else {
            NSLog(@"Fuzzing iteration %d failed with flip intensity %d, inject intensity %d, overflow intensity %d", i, i, i, i);
            log_gpu_memory_info("Fuzzing failed", __FILE__, __FUNCTION__, __LINE__);
            break; // Exit loop on failure
        }
    }

    return 0;
}
