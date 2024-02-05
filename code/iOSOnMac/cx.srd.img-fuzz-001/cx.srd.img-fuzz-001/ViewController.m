#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get the path for the Documents directory
    NSString *documentsDirectory = [self documentsDirectory];

    // Path for the original image bundled with the app
    NSString *originalImagePath = [[NSBundle mainBundle] pathForResource:@"original_image" ofType:@"png"];

    // Path for the fuzzed image saved in the Documents directory
    NSString *fuzzedImagePath = [documentsDirectory stringByAppendingPathComponent:@"fuzzed_image.png"];

    // Load images from the file paths
    UIImage *originalImage = [UIImage imageWithContentsOfFile:originalImagePath];
    UIImage *fuzzedImage = [UIImage imageWithContentsOfFile:fuzzedImagePath];

    // Assign the images to the UIImageView properties
    self.originalImageView.image = originalImage;
    self.fuzzedImageView.image = fuzzedImage;
}

// Helper method to get the Documents directory path
- (NSString *)documentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

@end

