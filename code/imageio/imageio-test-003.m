/*
Copyright 2020 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

/**
 * @file       imageio.m
 * @brief      Proof of concept Jackalope Image Fuzzer
 * @author     @h02332 | David Hoyt
 * @date       Modified 08 DEC 2023 | 1720 EST
 *
 *
 * @section    CHANGES
 * [Date] [Author] - [Description of Changes]
 * - [15/11/2023] [h02332] - Initial commit
 * - [28/11/2023] [h02332] - Refactor Code & fuzzing
 * - [08/12/2023] [h02332] - Refactor Code in attempt to reduce libc++abi: terminating due to uncaught exception of type int
 *
 * @section    TODOn
 * - [ ] ICC Color Profiles
 * - [ ] Continue Refactor Example Fuzzer in attempt to reduce libc++abi: terminating due to uncaught exception of type int
 * - [ ] Add Logging Toggle as global variable  - testing in createBitmapContextStandardRGB function
 *
 */

#include <Foundation/Foundation.h>
#include <Foundation/NSURL.h>
#include <dlfcn.h>
#include <stdint.h>
#include <sys/shm.h>
#include <dirent.h>
#include <sys/resource.h>
#include <limits.h>
#include <stdlib.h>
#include <string.h>

#import <ImageIO/ImageIO.h>
#import <AppKit/AppKit.h>
#import <CoreGraphics/CoreGraphics.h>

#define MAX_SAMPLE_SIZE 1000000
#define SHM_SIZE (4 + MAX_SAMPLE_SIZE)
unsigned char *shm_data;

extern void ImageIOSetLoggingProc(void*);
extern void fuzz(char *name);
extern bool has_supported_extension(const char* filename);

CGColorSpaceRef colorspace;
CGContextRef ctx;
bool use_shared_memory;

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

void customLogProc(const char* message) {
    NSLog(@"[Fuzzer Log] %s", message);
}

extern void ImageIOSetLoggingProc(void*);

CGContextRef createBitmapContext8BitInvertedColors(size_t width, size_t height) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t bytesPerRow = 4 * width;
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Big | kCGImageAlphaNoneSkipLast;

    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);

    if (context) {
        unsigned char *data = CGBitmapContextGetData(context);
        if (data) {
            size_t bufferLength = width * height * 4;
            for (size_t i = 0; i < bufferLength; i += 4) {
                data[i] = 255 - data[i];
                data[i + 1] = 255 - data[i + 1];
                data[i + 2] = 255 - data[i + 2];
            }
        }
    }
    return context;
}

CGContextRef ctx;

#define FUZZ_TARGET_MODIFIERS __attribute__ ((noinline))

void FUZZ_TARGET_MODIFIERS fuzz(char *name) {
    @autoreleasepool {
        NSImage* img = NULL;
        char *sample_bytes = NULL;
        uint32_t sample_size = 0;

        if (use_shared_memory) {
            sample_size = *(uint32_t *)(shm_data);
            if (sample_size > MAX_SAMPLE_SIZE) sample_size = MAX_SAMPLE_SIZE;
            sample_bytes = (char *)malloc(sample_size);
            if (!sample_bytes) {
                NSLog(@"Failed to allocate memory for sample_bytes");
                return;
            }
            memcpy(sample_bytes, shm_data + sizeof(uint32_t), sample_size);

            if (rand() % 10 == 0) {
                int error_pos = rand() % sample_size;
                sample_bytes[error_pos] = rand() % 256;
            }

            img = [[NSImage alloc] initWithData:[NSData dataWithBytes:sample_bytes length:sample_size]];
            free(sample_bytes);
        } else {
            img = [[NSImage alloc] initWithContentsOfFile:[NSString stringWithUTF8String:name]];
        }

        if (!img) {
            NSLog(@"Failed to load image from %s", name);
            return;
        }

        CGImageRef cgImg = [img CGImageForProposedRect:nil context:nil hints:nil];
        if (cgImg) {
            size_t width = CGImageGetWidth(cgImg);
            size_t height = CGImageGetHeight(cgImg);
            NSLog(@"Processing image: %s, Width: %lu, Height: %lu", name, width, height);

            CGContextRef invertedCtx = createBitmapContext8BitInvertedColors(width, height);
            if (invertedCtx) {
                CGRect rect = CGRectMake(0, 0, width, height);
                CGContextDrawImage(invertedCtx, rect, cgImg);

                CGContextRelease(invertedCtx);
            } else {
                NSLog(@"Failed to create inverted colors context for image: %s", name);
            }
            CGImageRelease(cgImg);
        }
    }
}

const char* supported_extensions[] = {
    ".jpg", ".jpeg", ".png", ".gif", ".bmp", ".heic", ".tiff", ".svg",
    ".webp", ".icns", ".pict", ".sgi", ".tga", ".exr", ".hdr", ".pdf", ".raw", ".pvr", NULL
};

bool has_supported_extension(const char* filename) {
    const char* ext = strrchr(filename, '.');
    if (!ext) {
        return false;
    }

    for (int i = 0; supported_extensions[i] != NULL; i++) {
        if (strcasecmp(ext, supported_extensions[i]) == 0) {
            return true;
        }
    }

    return false;
}

int main(int argc, char **argv) {
    if (argc != 3) {
        printf("Usage: %s <-f|-m> <file or shared memory name>\n", argv[0]);
        return 0;
    }

    use_shared_memory = !strcmp(argv[1], "-m");

    if (use_shared_memory) {
        if (!setup_shmem(argv[2])) {
            printf("Error mapping shared memory\n");
            return 1;
        }
    }

    ImageIOSetLoggingProc(&customLogProc);

    colorspace = CGColorSpaceCreateDeviceRGB();
    ctx = CGBitmapContextCreate(0, 32, 32, 8, 0, colorspace, kCGBitmapByteOrderDefault);

    if (ctx == NULL) {
        printf("Error creating bitmap context\n");
        CGColorSpaceRelease(colorspace);
        return 1;
    }

    if (!use_shared_memory) {
        DIR *dir = opendir(argv[2]);
        if (!dir) {
            printf("Error opening directory: %s\n", argv[2]);
            CGContextRelease(ctx);
            CGColorSpaceRelease(colorspace);
            return 1;
        }

        struct dirent *entry;
        while ((entry = readdir(dir)) != NULL) {
            if (entry->d_type == DT_REG) {
                if (has_supported_extension(entry->d_name)) {
                    char full_path[PATH_MAX];
                    snprintf(full_path, sizeof(full_path), "%s/%s", argv[2], entry->d_name);
                    fuzz(full_path);
                }
            }
        }
        closedir(dir);
    } else {
        fuzz(argv[2]);
    }

    CGContextRelease(ctx);
    CGColorSpaceRelease(colorspace);

    return 0;
}
