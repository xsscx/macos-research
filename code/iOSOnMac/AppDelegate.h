/*!
 *  @file AppDelegate.h
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
@brief Core and external libraries necessary for the fuzzer functionality.

@details This section includes the necessary headers for the Foundation framework, UIKit, Core Graphics,
standard input/output, standard library, memory management, mathematical functions,
Boolean type, floating-point limits, and string functions. These libraries support
image processing, UI interaction, and basic C operations essential for the application.
*/
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

- (void)transitionToFuzzedImagesViewController;

@end

