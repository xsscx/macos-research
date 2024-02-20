//
//  ImageFuzzer.h
//  cx.srd.img-fuzz-001
//
//  Created by D Hoyt on 11/28/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageFuzzer : NSObject

- (NSString *)createUniqueDirectoryForSavingImages;
- (BOOL)isValidImagePath:(NSString *)path;
- (UIImage *)loadImageFromFile:(NSString *)path;
- (void)processImage:(UIImage *)image permutation:(int)permutation sessionDirectory:(NSString *)sessionDirectory;

@end
