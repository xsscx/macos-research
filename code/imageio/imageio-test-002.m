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

bool use_shared_memory = false;

// Shared memory setup function
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

// Function modifiers for the fuzz target
#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)
#define FUZZ_TARGET_MODIFIERS __declspec(dllexport)
#else
#define FUZZ_TARGET_MODIFIERS __attribute__ ((noinline))
#endif

// External function declarations
extern bool CGRenderingStateGetAllowsAcceleration(void*);
extern bool CGRenderingStateSetAllowsAcceleration(void*, bool);
extern void* CGContextGetRenderingState(CGContextRef);
extern void ImageIOSetLoggingProc(void*);

// Dummy logging procedure for ImageIO
void dummyLogProc() {}

// Context reference global variable
CGContextRef ctx;

// Function to create a bitmap context with HDR and floating-point components
CGContextRef createBitmapContextHDRFloatComponents(size_t width, size_t height) {
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
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGBitmapInfo bitmapInfo = kCGImageAlphaOnly;
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = width;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    return context;
}

// Fuzz target function
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
    img = [[NSImage alloc] initWithData:[NSData dataWithBytesNoCopy:sample_bytes length:sample_size freeWhenDone:YES]];
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

// Main function
int main(int argc, char **argv) {
  if(argc != 3) {
    printf("Usage: %s <-f|-m> <file or shared memory name>\n", argv[0]);
    return 0;
  }

  use_shared_memory = !strcmp(argv[1], "-m");

  if(use_shared_memory && !setup_shmem(argv[2])) {
    printf("Error mapping shared memory\n");
    return 0;
  }

  ImageIOSetLoggingProc(&dummyLogProc);
  CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
  ctx = CGBitmapContextCreate(NULL, 32, 32, 8, 0, colorspace, kCGImageAlphaNoneSkipFirst);
  CGColorSpaceRelease(colorspace);
  void* renderingState = CGContextGetRenderingState(ctx);
  CGRenderingStateSetAllowsAcceleration(renderingState, false);

  fuzz(argv[2]);

  CGContextRelease(ctx);

  return 0;
}
