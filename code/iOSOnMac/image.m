// Modified by @h02332 DHoyt to run on iOS
// xcrun -sdk iphoneos clang -arch arm64 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.0.sdk -framework UIKit -framework Foundation -framework CoreGraphics -miphoneos-version-min=12.0 -o image image.m interpose.dylib
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@end

@implementation AppDelegate
@end

void loadImage() {
    NSString* appFolderPath = [[NSBundle mainBundle] resourcePath];
    NSString* path = [appFolderPath stringByAppendingPathComponent:@"demo.png"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    if (!data) {
        NSLog(@"Failed to read image data from %@", path);
        return;
    }

    UIImage* img = [UIImage imageWithData:data];
    if (!img) {
        NSLog(@"Failed to create UIImage");
        return;
    }

    CGImageRef cgImg = [img CGImage];
    if (!cgImg) {
        NSLog(@"Failed to create CGImage");
        return;
    }

    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    NSLog(@"Image details - Width: %lu, Height: %lu", width, height);

    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    if (!colorspace) {
        NSLog(@"Failed to create RGB color space");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, 4 * width, colorspace, kCGImageAlphaPremultipliedLast);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context");
        CGColorSpaceRelease(colorspace);
        return;
    }

    CGRect rect = CGRectMake(0, 0, width, height);
    CGContextDrawImage(ctx, rect, cgImg);

    CGColorSpaceRelease(colorspace);
    CGContextRelease(ctx);
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        loadImage();  // Call loadImage here for demonstration
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

