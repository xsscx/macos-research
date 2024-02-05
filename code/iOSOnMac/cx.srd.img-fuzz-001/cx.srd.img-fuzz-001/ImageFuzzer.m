#import "ImageFuzzer.h"
#import <CoreGraphics/CoreGraphics.h>

#define ALL -1
#define MAX_PERMUTATION 12

@implementation ImageFuzzer

- (NSArray<NSString *> *)fetchImagePathsFromDirectory:(NSString *)directoryName {
    NSMutableArray *imagePaths = [NSMutableArray array];
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[bundle bundlePath] error:nil];

    for (NSString *file in contents) {
        if ([file hasPrefix:directoryName]) {
            NSString *fullPath = [[bundle bundlePath] stringByAppendingPathComponent:file];
            [imagePaths addObject:fullPath];
        }
    }

    return [imagePaths copy];
}


- (NSString *)createUniqueDirectoryForSavingImages {
    // Same implementation as provided
    // ...
}

- (BOOL)isValidImagePath:(NSString *)path {
    // Same implementation as provided
    // ...
}

- (UIImage *)loadImageFromFile:(NSString *)imageName {
    NSLog(@"Loading file: %@", imageName);
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    if (!imagePath) {
        NSLog(@"Failed to find path for image: %@", imageName);
        return nil;
    }
    NSLog(@"Image path: %@", imagePath);

    NSData *content = [NSData dataWithContentsOfFile:imagePath];
    if (!content) {
        NSLog(@"Failed to load data from file: %@", imagePath);
        return nil;
    }

    UIImage *image = [UIImage imageWithData:content];
    if (!image) {
        NSLog(@"Failed to create UIImage from data.");
        return nil;
    }

    CGSize imageSize = image.size;
    NSLog(@"UIImage created: %@, Size: {width: %.2f, height: %.2f}, Scale: %f, Orientation: %ld",
          image, imageSize.width, imageSize.height, image.scale, (long)image.imageOrientation);

    return image;
}


- (void)processImage:(UIImage *)image permutation:(int)permutation sessionDirectory:(NSString *)sessionDirectory {
    // Convert the processImage function implementation
    // ...
}

// Other functions (e.g., applyFuzzingToBitmapContext) will also go here,
// adapted to fit the object-oriented structure

// ... Other methods ...

- (void)processImage:(UIImage *)image sessionDirectory:(NSString *)sessionDirectory {
    CGImageRef cgImg = [image CGImage];
    if (!cgImg) {
        NSLog(@"Failed to get CGImage from UIImage.");
        return;
    }
    NSLog(@"CGImage created from UIImage. Dimensions: %zu x %zu", CGImageGetWidth(cgImg), CGImageGetHeight(cgImg));
    
    for (int permutation = 1; permutation <= MAX_PERMUTATION; permutation++) {
        NSLog(@"Processing permutation %d", permutation);
        // Call the appropriate bitmap context creation method based on permutation
        // Implement each of these methods as needed
        // ...
    }

    NSLog(@"Completed image processing for all permutations");
}

// Implementation of bitmap context creation methods

@end

