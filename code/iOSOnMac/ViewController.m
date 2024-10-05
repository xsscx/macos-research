/*!
 *  @file ViewController.m
 *  @brief XNU Image Fuzzer
 *  @author David Hoyt
 *  @date 01 JUN 2024
 *  @version 1.8.2
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
 *
 */

#pragma mark - Headers

/*!
* @brief Core and external libraries necessary for the fuzzer functionality.
*
* @details This section includes the necessary headers for the Foundation framework, UIKit, Core Graphics,
* standard input/output, standard library, memory management, mathematical functions,
* Boolean type, floating-point limits, and string functions. These libraries support
* image processing, UI interaction, and basic C operations essential for the application.
*/
#import "ViewController.h"
#import <UIKit/UIKit.h>

/**
 *  ViewController
 *
 *  A UIViewController subclass that demonstrates basic fuzzing techniques on image data to uncover potential vulnerabilities in image processing routines. It manages a collection of fuzzed images displayed in a UICollectionView.
 */
@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray<UIImage *> *fuzzedImages;
@property (strong, nonatomic) NSMutableArray<NSString *> *imagePaths;

@end

@implementation ViewController

/**
 * Called after the controller's view is loaded into memory. Initializes the view controller's properties, collection view, and loads fuzzed images.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize arrays
    self.fuzzedImages = [NSMutableArray new];
    self.imagePaths = [NSMutableArray new];
    
    // Setup the collectionView layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    
    // Initialize the collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    // Register UICollectionViewCell class
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ImageCell"];
    
    // Add collectionView to the view hierarchy
    [self.view addSubview:self.collectionView];
    
    // Load fuzzed images
    [self loadFuzzedImagesFromDocumentsDirectory];
}

/**
 * Loads fuzzed images from the documents directory into the collection view.
 */
- (void)loadFuzzedImagesFromDocumentsDirectory {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSError *error = nil;
    NSArray *directoryContents = [fileManager contentsOfDirectoryAtPath:documentsDirectoryPath error:&error];
    
    if (!error) {
        NSLog(@"Found %lu items in the documents directory.", (unsigned long)directoryContents.count);
        for (NSString *fileName in directoryContents) {
            if ([fileName.pathExtension isEqualToString:@"png"] || [fileName.pathExtension isEqualToString:@"jpg"] || [fileName.pathExtension isEqualToString:@"jpeg"]) {
                NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:fileName];
                UIImage *image = [UIImage imageWithContentsOfFile:filePath];
                if (image) {
                    [self.fuzzedImages addObject:image];
                    [self.imagePaths addObject:fileName];
                    NSLog(@"Successfully loaded image: %@", fileName);
                } else {
                    NSLog(@"Failed to load image: %@", fileName);
                }
            }
        }
    } else {
        NSLog(@"Error reading the documents directory: %@", error.localizedDescription);
    }
    
    NSLog(@"Total loaded fuzzed images: %lu", (unsigned long)self.fuzzedImages.count);
    
    // Reload the collection view on the main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

#pragma mark - UICollectionViewDataSource

/**
 * Asks the data source for the number of items in the specified section. Returns the number of fuzzed images.
 * @param collectionView The collection view requesting this information.
 * @param section The index number of the section.
 * @return The number of rows in section.
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.fuzzedImages.count;
}

/**
 * Asks the data source for the cell that corresponds to the specified item in the collection view.
 * @param collectionView The collection view requesting this cell.
 * @param indexPath The index path that specifies the location of the item.
 * @return A configured cell object.
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    // Configure cell
    cell.backgroundColor = [UIColor lightGrayColor]; // For visibility
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.contentView.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = self.fuzzedImages[indexPath.row];
    [cell.contentView addSubview:imageView]; // Add imageView to cell's contentView
    
    NSLog(@"Configuring cell for item at %@ with image name: %@", indexPath, self.imagePaths[indexPath.row]);
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

/**
 * Asks the delegate for the size of the specified item’s cell.
 * @param collectionView The collection view object displaying the flow layout.
 * @param collectionViewLayout The layout object requesting the information.
 * @param indexPath The index path of the item.
 * @return The width and height of the specified item. Adjust as needed.
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100); // Adjust size as needed
}

@end


