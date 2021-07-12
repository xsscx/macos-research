/**
 *  @file videotoolbox-interposer.c
 *  @brief Interposing Code for VideoToolbox Fuzzing
 *  @author @h02332 | David Hoyt
 *  @date 18 MAY 2024
 *  @version 1.1.1
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
 *
 */

#pragma mark - Headers

#include <IOKit/IOKitLib.h>
#include <dlfcn.h>
#include <execinfo.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/sysctl.h>
#include <time.h>
#include <unistd.h>
#include <sys/mman.h>
#include <zlib.h>
#include <CoreMedia/CoreMedia.h>
#include <CoreVideo/CoreVideo.h>
#include <VideoToolbox/VideoToolbox.h>

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
#ifdef DEBUG
#define DebugLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DebugLog(...)
#endif

#define AssertWithMessage(condition, message, ...) \
    do { \
        if (!(condition)) { \
            NSLog((@"Assertion failed: %s " message), #condition, ##__VA_ARGS__); \
            assert(condition); \
        } \
    } while(0)

#define page_align(addr) (vm_address_t)((uintptr_t)(addr) & (~(vm_page_size - 1)))

#define DEBUG_LOGGING 1

#if DEBUG_LOGGING
#define DEBUG_PRINT(...) fprintf(stderr, __VA_ARGS__)
#define DEBUG_PRINT_ERRNO(msg) fprintf(stderr, "%s: %s\n", msg, strerror(errno))
#else
#define DEBUG_PRINT(...)
#define DEBUG_PRINT_ERRNO(msg)
#endif

#define EXTENDED_DEBUGGING 1

#pragma mark - Function Declarations

void *malloc_with_guard(size_t size);
void free_with_guard(void *ptr, size_t size);
void log_fuzzing_info(const char *message, size_t size, void *buf, int intensity, int step);
void log_allocation(const char *message, void *buffer, size_t size);
void flip_bits(void *buf, size_t len, int num_flips, int step);
void inject_random_data(void *buf, size_t len, int num_injections, int step);
void buffer_overflow(void *buf, size_t len, int overflow_amount, int step);
int compress_data(void *input, size_t input_len, void *output, size_t *output_len);
int decompress_data(void *input, size_t input_len, void *output, size_t *output_len);
void compression_fuzz(void *buf, size_t len, int step);
void process_with_videotoolbox(void *buf, size_t len);

#pragma mark - Memory Allocation

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

#pragma mark - Fuzz Log

/**
@brief Logs detailed information about the fuzzing process.

This function logs information about the current fuzzing step, including the message, size of the buffer, buffer address, intensity of the fuzzing, and the step number.

@param message A custom message to log.
@param size The size of the buffer being fuzzed.
@param buf The address of the buffer being fuzzed.
@param intensity The intensity of the fuzzing operation.
@param step The current step number in the fuzzing process.
*/
void log_fuzzing_info(const char *message, size_t size, void *buf, int intensity, int step) {
    printf("Fuzzing Step %d: %s, Size: %zu, Buffer Address: %p, Intensity: %d\n", step, message, size, buf, intensity);
}

#pragma mark - Memory Log

/**
@brief Logs details about memory allocation.

This function logs information about memory allocation, including a custom message, the address of the allocated buffer, and its size.

@param message A custom message to log.
@param buffer The address of the allocated buffer.
@param size The size of the allocated buffer.
*/
void log_allocation(const char *message, void *buffer, size_t size) {
    printf("%s: Buffer Address: %p, Size: %zu\n", message, buffer, size);
}

#pragma mark - Bit Flip

/**
@brief Randomly flips bits in the buffer to increase fuzzing coverage.

This function randomly flips bits in the buffer to introduce errors and increase fuzzing coverage. The number of bits to flip and the step number are specified by the parameters.

@param buf The buffer to fuzz.
@param len The length of the buffer.
@param num_flips The number of bits to flip.
@param step The current step number in the fuzzing process.
*/
void flip_bits(void *buf, size_t len, int num_flips, int step) {
    if (!len || num_flips <= 0) return;

    log_fuzzing_info("Starting bit flips", len, buf, num_flips, step);

    for (int i = 0; i < num_flips; ++i) {
        size_t offset = rand() % len;
        int bit_position = rand() % 8;
        ((uint8_t *)buf)[offset] ^= (0x1 << bit_position);  // Flip a random bit in a random byte
    }

    log_fuzzing_info("Completed bit flips", len, buf, num_flips, step);
}

#pragma mark - Random Data

/**
@brief Injects random data into the buffer.

This function injects random bytes into the buffer to introduce errors and increase fuzzing coverage. The number of injections and the step number are specified by the parameters.

@param buf The buffer to fuzz.
@param len The length of the buffer.
@param num_injections The number of random data injections.
@param step The current step number in the fuzzing process.
*/
void inject_random_data(void *buf, size_t len, int num_injections, int step) {
    if (!len || num_injections <= 0) return;

    log_fuzzing_info("Starting data injection", len, buf, num_injections, step);

    for (int i = 0; i < num_injections; ++i) {
        size_t offset = rand() % len;
        int data_length = rand() % 4 + 1; // Random length between 1 and 4 bytes
        for (int j = 0; j < data_length; ++j) {
            if (offset + j < len) {
                ((uint8_t *)buf)[offset + j] = rand() % 256;  // Inject random byte
            }
        }
    }

    log_fuzzing_info("Completed data injection", len, buf, num_injections, step);
}

#pragma mark - Buffer Overflow

/**
@brief Performs a buffer overflow by extending or truncating the buffer.

This function creates a buffer overflow by extending the buffer and filling it with a specific pattern. The overflow amount and step number are specified by the parameters.

@param buf The buffer to overflow.
@param len The original length of the buffer.
@param overflow_amount The amount by which to overflow the buffer.
@param step The current step number in the fuzzing process.
*/
void buffer_overflow(void *buf, size_t len, int overflow_amount, int step) {
    if (overflow_amount == 0) return;

    log_fuzzing_info("Starting buffer overflow", len + overflow_amount, buf, overflow_amount, step);

    size_t new_len = len + overflow_amount;
    uint8_t *overflow_buf = (uint8_t *)malloc_with_guard(new_len);
    if (!overflow_buf) {
        log_allocation("Failed to allocate buffer", overflow_buf, new_len);
        return; // Check for allocation failure
    }

    memcpy(overflow_buf, buf, len);

    for (size_t i = len; i < new_len; ++i) {
        overflow_buf[i] = (rand() % 2) ? 0x41 : rand() % 256; // Fill overflow with 'A' or random byte
    }

    log_allocation("Allocating buffer", overflow_buf, new_len);
    log_fuzzing_info("Completed buffer overflow", new_len, overflow_buf, overflow_amount, step);

    free_with_guard(overflow_buf, new_len);
}

#pragma mark - Compression Fuzzing

/**
@brief Compresses the input buffer using zlib.

This function compresses the data in the input buffer using zlib and stores the compressed data in the output buffer. The output buffer size is updated to reflect the size of the compressed data.

@param input The buffer containing the data to be compressed.
@param input_len The length of the input buffer.
@param output The buffer to store the compressed data.
@param output_len The size of the output buffer. This will be updated to the actual size of the compressed data.

@return Returns Z_OK on success, or a zlib error code on failure.
*/
int compress_data(void *input, size_t input_len, void *output, size_t *output_len) {
    int ret;
    z_stream strm;

    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;

    ret = deflateInit(&strm, Z_BEST_COMPRESSION);
    if (ret != Z_OK) return ret;

    strm.avail_in = input_len;
    strm.next_in = input;
    strm.avail_out = *output_len;
    strm.next_out = output;

    ret = deflate(&strm, Z_FINISH);
    if (ret != Z_STREAM_END) {
        deflateEnd(&strm);
        return ret == Z_OK ? Z_BUF_ERROR : ret;
    }

    *output_len = strm.total_out;
    deflateEnd(&strm);
    return Z_OK;
}

/**
@brief Decompresses the input buffer using zlib.

This function decompresses the data in the input buffer using zlib and stores the decompressed data in the output buffer. The output buffer size is updated to reflect the size of the decompressed data.

@param input The buffer containing the data to be decompressed.
@param input_len The length of the input buffer.
@param output The buffer to store the decompressed data.
@param output_len The size of the output buffer. This will be updated to the actual size of the decompressed data.

@return Returns Z_OK on success, or a zlib error code on failure.
*/
int decompress_data(void *input, size_t input_len, void *output, size_t *output_len) {
    int ret;
    z_stream strm;

    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    strm.avail_in = input_len;
    strm.next_in = input;
    strm.avail_out = *output_len;
    strm.next_out = output;

    ret = inflateInit(&strm);
    if (ret != Z_OK) return ret;

    ret = inflate(&strm, Z_NO_FLUSH);
    if (ret != Z_STREAM_END) {
        inflateEnd(&strm);
        return ret == Z_OK ? Z_BUF_ERROR : ret;
    }

    *output_len = strm.total_out;
    inflateEnd(&strm);
    return Z_OK;
}

/**
@brief Applies compression fuzzing to the buffer.

This function compresses the data in the buffer, applies bit flips to the compressed data, decompresses the modified data, and then processes the decompressed data using the VideoToolbox functions. It logs the fuzzing process details.

@param buf The buffer to fuzz.
@param len The length of the buffer.
@param step The current step number in the fuzzing process.
*/
void compression_fuzz(void *buf, size_t len, int step) {
    if (!len) return;

    log_fuzzing_info("Starting compression fuzz", len, buf, 0, step);

    size_t compressed_len = compressBound(len);
    uint8_t *compressed_buf = (uint8_t *)malloc_with_guard(compressed_len);
    if (!compressed_buf) {
        log_fuzzing_info("Failed to allocate compressed buffer", compressed_len, compressed_buf, 0, step);
        return;
    }

    if (compress_data(buf, len, compressed_buf, &compressed_len) != Z_OK) {
        log_fuzzing_info("Compression failed", len, buf, 0, step);
        free_with_guard(compressed_buf, compressed_len);
        return;
    }

    // Apply bit flips to compressed data
    flip_bits(compressed_buf, compressed_len, compressed_len / 10, step);

    size_t decompressed_len = len;
    uint8_t *decompressed_buf = (uint8_t *)malloc_with_guard(decompressed_len);
    if (!decompressed_buf) {
        log_fuzzing_info("Failed to allocate decompressed buffer", decompressed_len, decompressed_buf, 0, step);
        free_with_guard(compressed_buf, compressed_len);
        return;
    }

    if (decompress_data(compressed_buf, compressed_len, decompressed_buf, &decompressed_len) != Z_OK) {
        log_fuzzing_info("Decompression failed", len, buf, 0, step);
        free_with_guard(decompressed_buf, decompressed_len);
        free_with_guard(compressed_buf, compressed_len);
        return;
    }

    // Process the decompressed fuzzed buffer with VideoToolbox functions and check for crashes/errors
    process_with_videotoolbox(decompressed_buf, decompressed_len);

    free_with_guard(decompressed_buf, decompressed_len);
    free_with_guard(compressed_buf, compressed_len);

    log_fuzzing_info("Completed compression fuzz", len, buf, 0, step);
}

/**
@brief Processes the buffer with VideoToolbox functions.

This function processes the buffer with VideoToolbox functions, providing detailed logging and error checks for security research and fault injection purposes. It logs the buffer address, size, and any errors encountered during processing.

@param buf The buffer to process.
@param len The length of the buffer.
*/
void process_with_videotoolbox(void *buf, size_t len) {
    // Log the initial call details
    printf("Processing with VideoToolbox: Buffer Address: %p, Size: %zu\n", buf, len);

    if (!buf || len == 0) {
        printf("Error: Invalid buffer or length\n");
        return;
    }

    // Example: Create a CVPixelBuffer from the buffer
    CVPixelBufferRef pixelBuffer = NULL;
    CFDictionaryRef empty;
    CFMutableDictionaryRef attrs;
    empty = CFDictionaryCreate(kCFAllocatorDefault, NULL, NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    attrs = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);

    CFDictionarySetValue(attrs, kCVPixelBufferIOSurfacePropertiesKey, empty);

    CVReturn status = CVPixelBufferCreateWithBytes(kCFAllocatorDefault,
                                                   640, 480, kCVPixelFormatType_32BGRA,
                                                   buf, 4 * 640,
                                                   NULL, NULL, attrs,
                                                   &pixelBuffer);

    if (status != kCVReturnSuccess) {
        printf("Error: CVPixelBufferCreateWithBytes failed with status %d\n", status);
        CFRelease(empty);
        CFRelease(attrs);
        return;
    }

    // Example: Create a VTCompressionSession for further processing
    VTCompressionSessionRef compressionSession;
    status = VTCompressionSessionCreate(kCFAllocatorDefault,
                                        640, 480, kCMVideoCodecType_H264,
                                        NULL, NULL, NULL,
                                        NULL, NULL, &compressionSession);

    if (status != noErr) {
        printf("Error: VTCompressionSessionCreate failed with status %d\n", status);
        CVPixelBufferRelease(pixelBuffer);
        CFRelease(empty);
        CFRelease(attrs);
        return;
    }

    // Log compression session creation
    printf("VTCompressionSession created successfully\n");

    // Example: Encode the pixel buffer using the compression session
    VTEncodeInfoFlags flags;
    status = VTCompressionSessionEncodeFrame(compressionSession,
                                             pixelBuffer, CMTimeMake(1, 30),
                                             kCMTimeInvalid, NULL, NULL, &flags);

    if (status != noErr) {
        printf("Error: VTCompressionSessionEncodeFrame failed with status %d\n", status);
    } else {
        printf("VTCompressionSessionEncodeFrame succeeded\n");
    }

    // Cleanup
    VTCompressionSessionInvalidate(compressionSession);
    CFRelease(compressionSession);
    CVPixelBufferRelease(pixelBuffer);
    CFRelease(empty);
    CFRelease(attrs);

    printf("Completed processing with VideoToolbox\n");
}

#pragma mark - IOConnectCallMethod Fuzzing

/**
@brief Interposed version of `IOConnectCallMethod` that performs fuzzing on the input buffers.

This function replaces the original `IOConnectCallMethod` to apply various fuzzing techniques to its input buffers. It logs detailed information before and after fuzzing, and incrementally increases the fuzzing intensity with each call.

@param connection The connection to the I/O Kit.
@param selector The selector for the method to call.
@param input The input scalar values.
@param inputCnt The number of input scalar values.
@param inputStruct The input structure.
@param inputStructCnt The size of the input structure.
@param output The output scalar values.
@param outputCnt The number of output scalar values.
@param outputStruct The output structure.
@param outputStructCntP A pointer to the size of the output structure.
@return The result of the original `IOConnectCallMethod`.
*/
kern_return_t fake_IOConnectCallMethod(mach_port_t connection,
                                       uint32_t selector, uint64_t *input,
                                       uint32_t inputCnt, void *inputStruct,
                                       size_t inputStructCnt, uint64_t *output,
                                       uint32_t *outputCnt, void *outputStruct,
                                       size_t *outputStructCntP) {
    static int flip_intensity = 1; // Start with minimal fuzzing
    static int inject_intensity = 1;
    static int overflow_intensity = 1;
    static int compression_step = 1;

    static int step = 0; // Step counter for logging

    // Log details before fuzzing
    log_fuzzing_info("Before fuzzing inputStruct", inputStructCnt, inputStruct, flip_intensity, step);
    log_fuzzing_info("Before fuzzing input", inputCnt * sizeof(uint64_t), input, inject_intensity, step);

    // Apply fuzzing techniques independently
    flip_bits(inputStruct, inputStructCnt, flip_intensity, step);
    flip_bits(input, inputCnt * sizeof(uint64_t), flip_intensity, step);

    inject_random_data(inputStruct, inputStructCnt, inject_intensity, step);
    inject_random_data(input, inputCnt * sizeof(uint64_t), inject_intensity, step);

    buffer_overflow(inputStruct, inputStructCnt, overflow_intensity, step);
    buffer_overflow(input, inputCnt * sizeof(uint64_t), overflow_intensity, step);

    compression_fuzz(inputStruct, inputStructCnt, compression_step);
    compression_fuzz(input, inputCnt * sizeof(uint64_t), compression_step);

    // Log details after fuzzing
    log_fuzzing_info("After fuzzing inputStruct", inputStructCnt, inputStruct, flip_intensity, step);
    log_fuzzing_info("After fuzzing input", inputCnt * sizeof(uint64_t), input, inject_intensity, step);

    // Increment fuzzing intensities separately
    flip_intensity++;
    inject_intensity++;
    overflow_intensity++;
    compression_step++;
    step++;

    return IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct,
                               inputStructCnt, output, outputCnt, outputStruct,
                               outputStructCntP);
}

#pragma mark - Method Structure

/**
@brief Defines the interposer structure for method replacement.
This structure specifies the replacement and original methods for interposing `IOConnectCallMethod`. It is placed in the `__interpose` section to enable method replacement.
*/
typedef struct interposer {
    void *replacement;
    void *original;
} interpose_t;

#pragma mark - Method Replacement

/**
@brief Specifies the interposers for method replacement.
This array defines the interposers for replacing `IOConnectCallMethod` with `fake_IOConnectCallMethod`. It is placed in the `__interpose` section to enable method replacement.
*/
__attribute__((used)) static const interpose_t interposers[]
    __attribute__((section("__DATA, __interpose"))) =
    {
        {
            .replacement = (void *)fake_IOConnectCallMethod,
            .original = (void *)IOConnectCallMethod
        }
    };

