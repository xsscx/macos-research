#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include <pthread.h>

#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>

typedef void (*t_VTApplyRestrictions)(int arg);
t_VTApplyRestrictions VTApplyRestrictions;

// Define a struct for thread data
typedef struct {
    const char *filename;
} ThreadData;

#if defined(WIN32) || defined(_WIN32) || defined(__WIN32)
#define FUZZ_TARGET_MODIFIERS __declspec(dllexport)
#else
#define FUZZ_TARGET_MODIFIERS __attribute__ ((noinline))
#endif

void *fuzz(void *threadarg) {
    ThreadData *my_data;
    my_data = (ThreadData *) threadarg;
    const char *filename = my_data->filename;

    @autoreleasepool {
        NSError *error = nil;
        NSURL *fileURL = [NSURL fileURLWithPath:[NSString stringWithCString:filename encoding:NSASCIIStringEncoding]];
        AVAsset *asset = [AVAsset assetWithURL:fileURL];
        if (asset == nil) return NULL;
        
        AVAssetReader *reader = [[AVAssetReader alloc] initWithAsset:asset error:&error];
        if (reader == nil) return NULL;
        
        NSArray *tracks = [asset tracksWithMediaType:AVMediaTypeVideo];
        if (tracks == nil || ([tracks count] == 0)) return NULL;
        
        for (AVAssetTrack *track in tracks) {
            NSDictionary *outputSettings = @{(id)kCVPixelBufferPixelFormatTypeKey: @(kCMPixelFormat_32BGRA)};
            AVAssetReaderTrackOutput *output = [AVAssetReaderTrackOutput assetReaderTrackOutputWithTrack:track outputSettings:outputSettings];
            
            [reader addOutput:output];
            [reader startReading];
            
            while ([reader status] == AVAssetReaderStatusReading) {
                @autoreleasepool {
                    CMSampleBufferRef sampleBuffer = [output copyNextSampleBuffer];
                    if (sampleBuffer == nil) break;
                    
                    CMSampleBufferInvalidate(sampleBuffer);
                    CFRelease(sampleBuffer);
                }
            }
        }
    }
    return NULL;
}

int main(int argc, const char * argv[]) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 0;
    }
    
    void *toolbox = dlopen("/System/Library/Frameworks/VideoToolbox.framework/Versions/A/VideoToolbox", RTLD_NOW);
    if (!toolbox) {
        printf("Error loading VideoToolbox library\n");
        return 0;
    }
    VTApplyRestrictions = (t_VTApplyRestrictions)dlsym(toolbox, "VTApplyRestrictions");
    if (!VTApplyRestrictions) {
        printf("Error finding VTApplyRestrictions symbol\n");
        return 0;
    }
    VTApplyRestrictions(1);

    pthread_t threads[argc-1];
    ThreadData thread_data[argc-1];

    for (long i = 1; i < argc; i++) {
        thread_data[i-1].filename = argv[i];
        int rc = pthread_create(&threads[i-1], NULL, fuzz, (void *)&thread_data[i-1]);
        if (rc) {
            printf("Error:unable to create thread, %d\n", rc);
            exit(-1);
        }
    }

    for (int i = 0; i < argc-1; i++) {
        pthread_join(threads[i], NULL);
    }

    return 0;
}

