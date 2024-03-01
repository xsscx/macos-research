/**
 *  @file AppDelegate.m
 *  @brief Proof of concept XNU Image Fuzzer.
 *  @author @h02332 | David Hoyt
 *  @date 01 MAR 2024
 *  @version 1.0.2
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
 *  - 29/02/2024, h02332: Initial commit.
 *
 *  @section TODO
 *  - Grayscale Implementation.
 *  - ICC Color Profiles.
 *  - Refactor Example Fuzzer.
 */

#import "AppDelegate.h"
#import <os/log.h>
#import "ViewController.h" // Ensure this matches the name of your view controller class

void uncaughtExceptionHandler(NSException *exception) {
    NSLog(@"Uncaught exception: %@, %@", exception.name, exception.reason);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
    // Additional logging or handling can be added here.
}

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    // Create and configure a date formatter for the current date and time
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd 'at' HH:mm:ss";
    NSString *currentDateTime = [formatter stringFromDate:[NSDate date]];
    
    // Log the start time of the application using os_log
    os_log(OS_LOG_DEFAULT, "XNU Image Fuzzer Version 1.3.1.i Rendering at %@", currentDateTime);
  
    // Initialize the window to cover the entire screen
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Transition to the initial view controller programmatically
    [self transitionToFuzzedImagesViewController];
    
    return YES;
}

- (void)transitionToFuzzedImagesViewController {
    dispatch_async(dispatch_get_main_queue(), ^{
        // Instantiate the ViewController that will display the fuzzed images
        ViewController *viewController = [[ViewController alloc] init];
        
        // Perform any necessary setup on viewController here, if needed
        
        // Create a navigation controller with viewController as its root
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        
        // Set the navigation controller as the root view controller of the window
        self.window.rootViewController = navigationController;
        
        // Make the window visible
        [self.window makeKeyAndVisible];
    });
}

@end
