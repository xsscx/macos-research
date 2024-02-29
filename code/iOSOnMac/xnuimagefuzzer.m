/**
 * @file       xnuimagefuzzer.m
 * @brief      Proof of concept iOS Image Fuzzer
 * @author     @h02332 | David Hoyt
 * @date       Modified 27 FEB 2024
 * @time                 0845 EST
 *
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
 * @section    CHANGES
 * [Date] [Author] - [Description of Changes]
 * - [26/11/2023] [h02332] - Initial commit of xnuimagefuzzer.m for iOSonMac Project
 * - [27/11/2023] [h02332] - Removed Grayscale Feature pending Implementation
 * - [28/11/2023] [h02332] - Refactor Code & fuzzing
 * - [27/02/2024] [h02332] - Refactor Code & fuzzing & logging
 *
 * @section    TODO
 * - [ ] Grayscale Implementation
 * - [ ] ICC Color Profiles
 * - [ ] Refactor Example Fuzzer
 * - [ ] Add Logging Toggle as global variable  - testing in createBitmapContextStandardRGB function
 * - [ ] Modify File Name at function()
 * Compile : xcrun -sdk iphoneos clang -arch arm64 -framework UIKit -framework Foundation -framework CoreGraphics -miphoneos-version-min=12.0 -g -o imagefuzzer ios-image-fuzzer-example.m  interpose.dylib
 *
 */
#pragma mark - Heaaders

/**
@brief Core and external libraries necessary for the fuzzer functionality.

@details This section includes the necessary headers for the Foundation framework, UIKit, Core Graphics,
standard input/output, standard library, memory management, mathematical functions,
Boolean type, floating-point limits, and string functions. These libraries support
image processing, UI interaction, and basic C operations essential for the application.
*/
#include <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <os/log.h>
#import <os/signpost.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <math.h>
#include <stdbool.h>
#include <float.h>
#include <string.h>
#include <stdint.h>
#include <sys/sysctl.h>
#include <assert.h>

#pragma mark - Constants

/**
@brief Defines constants for general application configuration.

This section includes definitions for constants used throughout the application to control its behavior and configuration. These constants are pivotal for ensuring the application operates within defined parameters and accesses system resources correctly.

- `ALL`: A special flag used to indicate an operation applies to all items or states. Useful for functions that require a broad application of their logic.
- `MAX_PERMUTATION`: Defines the upper limit on the number of permutations that can be applied in image processing tasks. This constant helps in preventing excessive processing time and resource consumption.
- `COMM_PAGE64_BASE_ADDRESS`: The base memory address for the comm page, which is a reserved area of memory used by the system to store variables that are accessed frequently.
- `COMM_PAGE_CPU_CAPABILITIES64`: An offset from `COMM_PAGE64_BASE_ADDRESS` that points to the CPU capabilities. Useful for quickly determining the hardware capabilities of the system.

Example usage:
```objective-c
if (operationMode == ALL) {
    // Apply operation to all items
}

int permutations = MAX_PERMUTATION;
uint64_t commPageAddress = COMM_PAGE64_BASE_ADDRESS;
uint64_t cpuCapabilitiesAddress = COMM_PAGE_CPU_CAPABILITIES64;
Note: These constants are designed to be used across various components of the application, providing a centralized point of reference for important values and system parameters.
*/
#define ALL -1 // Special flag for operations applicable to all items or states.
#define MAX_PERMUTATION 12 // Maximum permutations in image processing.
#define COMM_PAGE64_BASE_ADDRESS (0x0000000FFFFFC000ULL)
#define COMM_PAGE_CPU_CAPABILITIES64 (COMM_PAGE64_BASE_ADDRESS + 0x010)

#pragma mark - Debugging Macros

/**
@brief Provides macros for enhanced logging and assertions during development.

This section defines two key macros designed to assist in the debugging process, ensuring that developers can log detailed information and perform assertions with customized messages. These macros are especially useful in DEBUG builds, where additional context can significantly aid in diagnosing issues.

## Features:
- `DebugLog`: This macro is used for logging detailed debug information, including the name of the current function and the line number from where it's called. It's instrumental in tracing the execution flow or pinpointing the location of specific events or states in the code.
- `AssertWithMessage`: This macro allows for the execution of assertions that, upon failure, log a custom message. It's valuable for validating assumptions within the code and providing immediate feedback if those assumptions are violated.

## Usage:

### DebugLog
Use the `DebugLog` macro to log messages with additional context, such as the function name and line number. This macro is only active in DEBUG builds, helping to avoid the potential exposure of sensitive information in release builds.
```objective-c
DebugLog(@"An informative debug message with context.");
*/
#ifdef DEBUG
#define DebugLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DebugLog(...)
#endif

#define AssertWithMessage(condition, message, ...) \
    do { \
        if (!(condition)) { \
            NSLog((@"Assertion failed: %s " message), #condition, ##__VA_ARGS__); \
            assert(condition); \
        } \
    } while(0)

#pragma mark - Global Variables

/**
@brief Controls the verbosity of logging throughout the application.

This global variable acts as a switch to toggle verbose logging on or off across the application's various components. Verbose logging is crucial for debugging, as it provides detailed insights into the application's operations, including function calls, process flows, and data management.

## Features:
- When set to `1`, verbose logging is enabled. This setting is ideal for development and debugging phases, where understanding the intricate details of application behavior is necessary.
- Setting this variable to `0` disables verbose logging, which is recommended for release builds to reduce overhead and prevent the exposure of potentially sensitive information.

## Usage:

To enable verbose logging throughout the application, ensure this variable is set to `1`. This can typically be done at the application's initialization phase or dynamically adjusted based on certain conditions or user input.

Example:
```objective-c
verboseLogging = 1; // Enable verbose logging
Conversely, to disable verbose logging, especially in preparation for a release build, set the variable to 0:

objective
Copy code
verboseLogging = 0; // Disable verbose logging
@note It's important to manage the state of this variable carefully, as excessive logging can lead to performance degradation and cluttered log outputs. Consider implementing a mechanism to adjust this setting dynamically based on the build configuration or user preferences.
*/
static int verboseLogging = 1; // 1 enables detailed logging, 0 disables it.

#pragma mark - Color Definitions

/**
@brief Provides ANSI color codes for enhancing console output readability.

@details Use these definitions to add color to console logs, improving the distinction between different types of messages. Each macro wraps a given string with the ANSI code for a specific color and automatically resets the color to default after the string. This ensures that only the intended text is colored, without affecting subsequent console output.

- `MAG(string)`: Magenta colored text.
- `BLUE(string)`: Blue colored text.
- `RED(string)`: Red colored text for errors or warnings.
- `WHT(string)`: White colored text.
- `GRN(string)`: Green colored text for success messages.
- `YEL(string)`: Yellow colored text for cautionary messages.
- `CYN(string)`: Cyan colored text for informational messages.
- `HWHT(string)`: High-intensity white colored text.
- `NORMAL_COLOR(string)`: Resets text color to default console color.
- `RESET_COLOR`: ANSI code to reset text color to default.

Example usage:
```objective-c
NSLog(@"%@", RED("Error: Invalid input"));
NSLog(@"%@", GRN("Operation completed successfully"));
Note: The effectiveness and appearance of these color codes can vary based on the terminal or console application used. Ensure your development and deployment environments support ANSI color codes.
*/
#define _XOPEN_SOURCE
#define MAG(string)  "\x1b[0;35m" string RESET_COLOR
#define BLUE(string) "\x1b[34m" string RESET_COLOR
#define RED(string)  "\x1b[31m" string RESET_COLOR
#define WHT(string)  "\x1b[0;37m" string RESET_COLOR
#define GRN(string)  "\x1b[0;32m" string RESET_COLOR
#define YEL(string)  "\x1b[0;33m" string RESET_COLOR
#define CYN(string)  "\x1b[0;36m" string RESET_COLOR
#define HWHT(string) "\x1b[0;97m" string RESET_COLOR
#define NORMAL_COLOR(string) "\x1B[0m" string RESET_COLOR
#define RESET_COLOR "\x1b[0m"

#pragma mark - Injection Strings Configuration

/**
@brief Configures strings for security testing within the application.

This configuration outlines a series of predefined strings that are used across the application to test for various security vulnerabilities, ensuring robustness and security. The strings are designed to simulate common attack vectors, including SQL injection, Cross-Site Scripting (XSS), and issues with URL handling.

- `INJECT_STRING_1`: Utilized as a tag for identifying images processed by the application. This can help in tracking how images are manipulated or stored.
- `INJECT_STRING_2`: Tests the application's handling of URLs, potentially uncovering issues with how external links are processed or validated.
- `INJECT_STRING_3`: Simulates an SQL injection attack, which can help identify vulnerabilities in database interactions where unescaped strings are used in SQL queries.
- `INJECT_STRING_4`: Aims to test for Cross-Site Scripting (XSS) vulnerabilities by injecting JavaScript code. Successful execution of this string in an unsanitized context could indicate a security flaw.

`NUMBER_OF_STRINGS`: Represents the total number of injection strings defined for use in security testing, facilitating iteration and application in various testing scenarios.

Example usage:
```objective-c
for (int i = 0; i < NUMBER_OF_STRINGS; i++) {
    NSLog(@"Testing with injection string: %s", injectStrings[i]);
    // Function call to test the application's handling of the injection string
    testApplicationWithInjectionString(injectStrings[i]);
}
Note: These strings are designed for use in a controlled testing environment. They are tools for verifying the application's security mechanisms and should be handled with care to avoid unintended consequences.
*/
#define INJECT_STRING_1 "XNU Image Fuzzer" // Tag for image identification.
#define INJECT_STRING_2 "https://xss.cx?xnuimagefuzzer" // URL handling test.
#define INJECT_STRING_3 "DROP TABLES;" // SQL injection simulation.
#define INJECT_STRING_4 "console.log('domain');" // XSS vulnerability testing.
#define NUMBER_OF_STRINGS 4 // Total injection strings count.

// Array for easy iteration and application of injection strings in tests.
char* injectStrings[NUMBER_OF_STRINGS] = {
    INJECT_STRING_1,
    INJECT_STRING_2,
    INJECT_STRING_3,
    INJECT_STRING_4
};

#pragma mark - Function Declarations

// Function declarations
BOOL isValidImagePath(NSString *path);
UIImage *loadImageFromFile(NSString *path);
void processImage(UIImage *image, int permutation, NSString *sessionDirectory);
void processPermutation(UIImage *image, int permutation, NSString *sessionDirectory);
NSString *createUniqueDirectoryForSavingImages(void);
// void logPixelData(unsigned char *rawData, size_t width, size_t height, const char *message);
void applyFuzzingToBitmapContext(unsigned char *rawData, size_t width, size_t height);

#pragma mark - Bitmap Context Creation

// Bitmap context creation functions
void createBitmapContextStandardRGB(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextPremultipliedFirstAlpha(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextNonPremultipliedAlpha(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContext16BitDepth(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextHDRFloatComponents(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextAlphaOnly(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContext1BitMonochrome(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextBigEndian(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContextLittleEndian(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContext8BitInvertedColors(CGImageRef cgImg, NSString *sessionDirectory, int permutation);
void createBitmapContext32BitFloat4Component(CGImageRef cgImg, NSString *sessionDirectory, int permutation);

// TODO: Implement Grayscale context creation
void createBitmapContextGrayscale(CGImageRef cgImg);

#pragma mark - Date and Time Utilities

/**
@brief Formats the current date and time into a standardized, human-readable string.

@return NSString representing the current date and time, formatted according to 'yyyy-MM-dd at HH:mm:ss'.

@discussion Leverages `NSDateFormatter` to generate a string from the current date (`NSDate`), using the specified format. This encapsulates the process of obtaining a formatted current date and time, abstracting the configuration of `NSDateFormatter`.
 Example usage:
 ```objective-c
 NSString *currentDateTimeString = formattedCurrentDateTime();
 NSLog(@"Current Date and Time: %@", currentDateTimeString);
*/

NSString* formattedCurrentDateTime(void) {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd 'at' HH:mm:ss"];
    return [formatter stringFromDate:[NSDate date]];
}

#pragma mark - Signature

/**
@brief Fetches the system's commpage signature.

This function is designed to read a specific segment of the system's commpage, often used to retrieve system or hardware-specific signatures. It dynamically allocates memory to store the signature, which is then copied from a predefined memory address (`COMM_PAGE64_BASE_ADDRESS`).

@return A dynamically allocated, null-terminated string containing the commpage signature. It is the caller's responsibility to free this memory using `free` to avoid memory leaks.

@discussion The function allocates an extra byte to the required signature length (`0x10`) to accommodate the null terminator, ensuring the returned string is properly formatted for use in C and Objective-C contexts. Proper error handling is implemented to return `NULL` if memory allocation fails, allowing callers to safely handle error scenarios.

Example usage:
```objective-c
char *systemSignature = signature();
if (systemSignature != NULL) {
    NSLog(@"System Signature: %s", systemSignature);
    free(systemSignature);
} else {
    NSLog(@"Failed to obtain system signature.");
}
@note Care must be taken to ensure that the memory allocated for the signature string is freed after use. Failure to do so will result in memory leaks. This function assumes that the caller is familiar with dynamic memory management in C.
*/
char *signature(void) {
    char *signature = malloc(0x10 + 1); // +1 for null terminator
    if (!signature) {
        fprintf(stderr, "Error: Failed to allocate memory for signature.\n");
        return NULL;
    }
    memcpy(signature, (const char *)COMM_PAGE64_BASE_ADDRESS, 0x10);
    signature[0x10] = '\0'; // Ensure null termination
    return signature;
}

#pragma mark - Device Information

/**
@brief Logs comprehensive information about the current device.

This utility function leverages the `UIDevice` class to access and log a wide range of information about the device on which the application is running. It covers basic device identifiers, operating system details, and battery status, providing a holistic view of the device's configuration and state.

@discussion The function temporarily enables battery monitoring to retrieve the current battery level and state, supplementing the device information with power status. This could be particularly useful for applications that need to adjust their behavior or performance based on the device's power status.

@warning Battery information is specific to iOS and iPadOS devices and might not reflect real-time changes accurately due to system optimizations and power management.

@example Usage:
```objective-c
dumpDeviceInfo();
This example demonstrates how to call dumpDeviceInfo to log device information. This can be particularly useful during development and debugging to understand the environment in which the application is operating.

@note Ensure that you check the device's capability to provide battery information and handle any potential inaccuracies in the reported levels and states. Consider the privacy implications of logging and handling the unique identifier for the vendor (identifierForVendor).

@see UIDevice for detailed documentation on accessing device properties.
*/
void dumpDeviceInfo(void) {
UIDevice *device = [UIDevice currentDevice];
NSLog(@"Device Information:");
NSLog(@"  Name: %@", device.name);
NSLog(@"  Model: %@", device.model);
NSLog(@"  System Name: %@", device.systemName);
NSLog(@"  System Version: %@", device.systemVersion);
NSLog(@"  Identifier For Vendor: %@", device.identifierForVendor.UUIDString);

device.batteryMonitoringEnabled = YES; // Enable battery monitoring
NSLog(@"  Battery Level: %f", device.batteryLevel * 100); // Convert to percentage
NSString *batteryState;
switch (device.batteryState) {
    case UIDeviceBatteryStateUnknown:
        batteryState = @"Unknown";
        break;
    case UIDeviceBatteryStateUnplugged:
        batteryState = @"Unplugged";
        break;
    case UIDeviceBatteryStateCharging:
        batteryState = @"Charging";
        break;
    case UIDeviceBatteryStateFull:
        batteryState = @"Full";
        break;
    default:
        batteryState = @"Not Available";
        break;
}
NSLog(@"  Battery State: %@", batteryState);
device.batteryMonitoringEnabled = NO; // Disable battery monitoring after fetching information
}

#pragma mark - macOS System Information

/**
@brief Logs crucial system information for macOS devices.

This function is specifically designed to fetch and log key pieces of system information for macOS devices, utilizing the `sysctl` interface. It provides insights into the kernel version, hardware model, and CPU type, among others, offering a clear snapshot of the underlying hardware and operating system specifics.

## Key Information Retrieved:
- **Kernel Version**: The version of the Darwin kernel the system is running.
- **Hardware Model**: The specific model of the macOS device, useful for identifying hardware capabilities.
- **CPU Type**: Details about the CPU, including its brand and specifications, which can inform performance expectations and compatibility.

## Usage:
This function is tailor-made for macOS environments and can be invoked directly to log the system information to the console:
```objective-c
dumpMacDeviceInfo();
Example Output:
plaintext
Copy code
System Information:
Kernel Version: Darwin 20.3.0
Hardware Model: MacBookPro15,1
CPU Type: Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
Note:
While this function is designed with macOS in mind, accessing system information via sysctl is a method that could potentially be adapted for other Unix-like systems with appropriate modifications.

@see For more in-depth details on using sysctl, refer to the man pages (man sysctl) or the official documentation for the sysctl interface.
*/
void dumpMacDeviceInfo(void) {
    char str[128];
    size_t size = sizeof(str);
    
    // Query and log the kernel version
    sysctlbyname("kern.osrelease", str, &size, NULL, 0);
    NSLog(@"Kernel Version: %s", str);
    
    // Reset size for the next sysctlbyname call
    size = sizeof(str);
    // Query and log the hardware model
    sysctlbyname("hw.model", str, &size, NULL, 0);
    NSLog(@"Hardware Model: %s", str);
    
    // Reset size for the next sysctlbyname call
    size = sizeof(str);
    // Query and log the CPU type
    sysctlbyname("machdep.cpu.brand_string", str, &size, NULL, 0);
    NSLog(@"CPU Type: %s", str);
    
}

#pragma mark - cpu_cap_strings

/**
@brief Identifies the CPU's supported capabilities.

This section enumerates various CPU capabilities and instruction sets that modern processors might support. These capabilities enhance the processor's performance and security features. Identifiers for these capabilities are used to represent specific hardware features and instruction sets, such as Multimedia Extensions, Streaming SIMD Extensions, Advanced Encryption Standard instruction sets, and others.

## Usage:
The identifiers provided are used to map the CPU capability bits to human-readable strings. This mapping aids developers and system administrators in understanding the features supported by the CPU on a given device, facilitating optimizations and security enhancements.

## Key Identifiers:
- `MMX`: Refers to Multimedia Extensions that enhance multimedia and communication tasks.
- `SSE`, `SSE2`, `SSE3`, `SSE4_1`, `SSE4_2`: Streaming SIMD Extensions and their versions, improving performance on floating point and integer operations.
- `AES`: Denotes support for the Advanced Encryption Standard instruction set, crucial for fast and secure data encryption.
- `AVX1_0`, `AVX2_0`: Advanced Vector Extensions that improve performance for applications requiring high computational throughput.
- `BMI1`, `BMI2`: Bit Manipulation Instruction Sets, enhancing the efficiency of certain data processing tasks.
- `RTM`: Restricted Transactional Memory, supporting transactional memory synchronization.
- `HLE`: Hardware Lock Elision, aimed at improving the performance of lock-based concurrent algorithms.
- `ADX`: Multi-Precision Add-Carry Instruction Extensions, useful in cryptographic algorithms.
- `RDSEED`, `MPX`, `SGX`: Various security and protection extensions, including random number generation, memory protection, and trusted execution.

## Note:
The availability and support for these capabilities are highly dependent on the CPU model and the architecture of the device's processor. Detection and utilization of these features typically require querying through system-specific interfaces or leveraging instruction sets designed for this purpose.

@see Consult the documentation for your processor or use system utilities designed to query and report CPU capabilities for detailed information on the supported features.
*/
const char *cpu_cap_strings[] = {
    "MMX", "SSE", "SSE2", "SSE3", "Cache32", "Cache64", "Cache128",
    "FastThreadLocalStorage", "SupplementalSSE3", "64Bit", "SSE4_1", "SSE4_2",
    "AES", "InOrderPipeline", "Slow", "UP", "NumCPUs", "AVX1_0", "RDRAND",
    "F16C", "ENFSTRG", "FMA", "AVX2_0", "BMI1", "BMI2", "RTM", "HLE", "ADX",
    "RDSEED", "MPX", "SGX"
};

#pragma mark - dump_comm_page

/**
@brief Dumps key communication page details for diagnostic purposes.

This function extracts and logs essential details from the system's communication page, such as the signature, version, and number of CPUs, along with CPU capabilities. It utilizes the `READ_COMM_PAGE_VALUE` macro to read values directly from specified memory addresses, facilitating a low-level inspection of system configurations and capabilities.

## Behavior:
1. Retrieves and logs the communication page signature. If the signature cannot be read, logs an error message.
2. Logs the communication page version and number of CPU cores by reading from predefined offsets within the communication page.
3. Enumerates and logs CPU capabilities based on the `COMM_PAGE_CPU_CAPABILITIES64` address. Each capability is checked and logged, indicating whether it is supported.

## Parameters:
This function does not take any parameters.

## Return:
This function does not return a value.

## Example Output:
- `[*] COMM_PAGE_SIGNATURE: <signature_value>` or `[*] COMM_PAGE_SIGNATURE: Error reading signature.`
- `[*] COMM_PAGE_VERSION: <version_number>`
- `[*] COMM_PAGE_NCPUS: <cpu_count>`
- Lists CPU capabilities as true/false based on the current system's hardware configuration.

## Note:
- The actual information logged will depend on the specific system and its configuration.
- The `READ_COMM_PAGE_VALUE` macro is crucial for the function's operation, casting the specified address to the appropriate type before dereferencing.

## See Also:
- `READ_COMM_PAGE_VALUE` macro for how memory addresses are read.
- System documentation for the communication page structure and definitions.

Usage:
Call `dump_comm_page()` to log the communication page details for the current system.
*/
#define READ_COMM_PAGE_VALUE(type, address) (*((type *)(address)))

void dump_comm_page(void) {
    char *sig = signature();
    if (sig) {
        NSLog(@"[*] COMM_PAGE_SIGNATURE: %s", sig);
        free(sig);
    } else {
        NSLog(@"[*] COMM_PAGE_SIGNATURE: Error reading signature.");
    }

    // Utilizing macro for simplified reading
    NSLog(@"[*] COMM_PAGE_VERSION: %d", READ_COMM_PAGE_VALUE(uint16_t, COMM_PAGE64_BASE_ADDRESS + 0x01E));
    NSLog(@"[*] COMM_PAGE_NCPUS: %d", READ_COMM_PAGE_VALUE(uint8_t, COMM_PAGE64_BASE_ADDRESS + 0x022));
    // Additional comm page details could be added here

    NSLog(@"[*] COMM_PAGE_CPU_CAPABILITIES64:");
    uint64_t cpu_caps = READ_COMM_PAGE_VALUE(uint64_t, COMM_PAGE_CPU_CAPABILITIES64);
    for (int i = 0, shift = 0; i < (int)(sizeof(cpu_cap_strings) / sizeof(char *)); i++) {
        if (i == 16) { // Special handling for NumCPUs
            NSLog(@"\t%s: %d", cpu_cap_strings[i], (int)(cpu_caps >> 16) & 0xFF);
            shift = 24; // Skip to the next relevant bit
            continue;
        }
        NSLog(@"\t%s: %@", cpu_cap_strings[i], (cpu_caps & (1ULL << shift)) ? @"true" : @"false");
        shift++;
    }
    NSLog(@"[*] Done dumping comm page.");
}

#pragma mark - Utility Function Prototypes

/**
@brief Prototypes for utility functions used in image processing.

@details This section declares functions essential for the image processing pipeline,
ranging from path validation to image manipulation and utility operations. These functions
facilitate tasks such as validating image paths, loading images from files, applying various
image processing permutations, and managing output directories and string hashing.

- `isValidImagePath`: Validates the specified image path.
- `loadImageFromFile`: Loads an image from the given file path.
- `processImage`: Processes the image with a specified permutation algorithm.
- Additional utilities include noise application, color inversion, value adjustments, and string hashing.

@return Various return types depending on the function's purpose.

@note Some functions, such as `processImage`, might modify the input image directly.
*/
BOOL isValidImagePath(NSString *path);
UIImage *loadImageFromFile(NSString *path);
// void processImage(UIImage *image, int permutation);
// Further prototype declarations for omitted details
NSString *createUniqueDirectoryForSavingImages(void);
void addAdditiveNoise(float *pixel);
void applyMultiplicativeNoise(float *pixel);
void invertColor(float *pixel);
void applyExtremeValues(float *pixel);
void assignSpecialFloatValues(float *pixel);
unsigned long hashString(const char* str);

#pragma mark - Print Color Function

/**
@brief Prints a message with specified ANSI color to the console.

This utility function enhances console log visibility by allowing messages to be printed in different colors. It wraps a provided message with the specified ANSI color code, ensuring the message stands out in the console output. After printing the message, it resets the console color back to its default, maintaining the terminal's readability for subsequent outputs.

## Parameters:
- `color`: The ANSI color code that dictates the color of the message. This parameter expects a string representation of ANSI color codes (e.g., "\033[31m" for red).
- `message`: The text message to be printed. This string is the content that will be displayed in the specified color in the console.

## Behavior:
- The function first applies the specified ANSI color code to the terminal output.
- It then prints the provided message using `NSLog`, ensuring the message is logged with the specified color.
- Finally, it resets the console color to the default to prevent affecting the color of subsequent console outputs.

## Note:
- This function relies on the terminal or console's support for ANSI color codes. If the terminal does not support these codes, the message will be printed without color formatting, and escape codes may be visible.

## Example Usage:
```swift
printColored("\033[31m", "Error: File not found.");
This example demonstrates how to use the printColored function to print an error message in red, making it more noticeable in the console output.

See Also:
ANSI color codes documentation for more information on how colors are represented in terminals.
*/
void printColored(const char* color, const char* message) {
    NSLog(@"%s%s%s", color, message, RESET_COLOR);
}

#pragma mark - Conversion and Saving Functions

/**
@brief Converts image data to 1-bit monochrome using a simple thresholding technique.
@details This function iterates over each pixel in the input image data, applying a fixed threshold to determine if a pixel should be black or white in the resulting monochrome image. This is a basic form of binarization, suitable for simplifying images or preparing them for certain types of processing where color is not needed.

@param rawData Pointer to the image data.
@param width The width of the image in pixels.
@param height The height of the image in pixels.
*/
extern void convertTo1BitMonochrome(unsigned char *rawData, size_t width, size_t height) {
    size_t bytesPerRow = (width + 7) / 8; // Calculate the bytes per row for 1bpp
    unsigned char threshold = 127; // Midpoint threshold for black/white conversion

    for (size_t y = 0; y < height; y++) {
        for (size_t x = 0; x < width; x++) {
            size_t byteIndex = y * bytesPerRow + x / 8;
            unsigned char pixelValue = rawData[y * width + x]; // Assuming rawData is in a format where each pixel is a byte
            unsigned char bit = (pixelValue > threshold) ? 1 : 0; // Apply threshold

            rawData[byteIndex] &= ~(1 << (7 - (x % 8))); // Clear the bit
            rawData[byteIndex] |= (bit << (7 - (x % 8))); // Set the bit based on threshold
        }
    }
}

/**
@brief Saves a monochrome UIImage with a specified identifier to the documents directory.
@details This function saves the provided UIImage object as a PNG file in the application's documents directory, using the specified identifier as part of the file name. It's useful for persisting processed images for later retrieval, sharing, or comparison.

@param image The UIImage to save.
@param identifier A unique identifier for the image file.
*/
extern void saveMonochromeImage(UIImage *image, NSString *identifier) {
    NSData *imageData = UIImagePNGRepresentation(image);
    NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", identifier]];
    
    if ([imageData writeToFile:filePath atomically:YES]) {
        NSLog(@"Saved monochrome image with identifier %@ at %@", identifier, filePath);
    } else {
        NSLog(@"Error saving monochrome image with identifier %@", identifier);
    }
}

#pragma mark - Directory Management

NSString *createUniqueDirectoryForSavingImages(void) {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd_HH-mm-ss-SSS"];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];

    // Generating a random component to append to the directory name for uniqueness
    uint32_t randomComponent = arc4random_uniform(10000);
    NSString *uniqueDirectoryName = [NSString stringWithFormat:@"%@_%u", dateString, randomComponent];

    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *uniqueDirPath = [documentsDirectory stringByAppendingPathComponent:uniqueDirectoryName];

    NSError *error;
    if (![[NSFileManager defaultManager] createDirectoryAtPath:uniqueDirPath withIntermediateDirectories:YES attributes:nil error:&error]) {
        NSLog(@"Error creating directory for saving images: %@", error.localizedDescription);
        // Consider additional error handling logic here, depending on application requirements
        return nil;
    }

    return uniqueDirPath;
}

#pragma mark - Pixel Logging Data

/**
@brief Logs information about a random set of pixels from an image's raw data.

@details Selects a random set of pixels from the provided image data and logs their RGBA components.
If verbose logging is enabled, it decodes and logs character data embedded within the pixel values,
providing insights into the image's content or image processing results. Assumes RGBA format for pixel data.

@param rawData The raw pixel data of the image.
@param width The width of the image in pixels.
@param height The height of the image in pixels.
@param message A contextual message or identifier for the log.
@param verboseLogging Enables detailed information logging, including decoded data, when set to true.

@note Ensure the provided raw data correctly corresponds to the specified width and height to avoid out-of-bounds access.
*/
void logPixelData(unsigned char *rawData, size_t width, size_t height, const char *message, bool verboseLogging) {
    if (!rawData || width == 0 || height == 0) {
        NSLog(@"%s - Invalid data or dimensions. Logging aborted.", message);
        return;
    }

    const int numberOfPixelsToLog = 5; // Number of random pixels to log

    NSLog(@"%s - %s logging %d random pixels:", message, verboseLogging ? "Verbose" : "Basic", numberOfPixelsToLog);

    for (int i = 0; i < numberOfPixelsToLog; i++) {
        unsigned int randomX = arc4random_uniform((unsigned int)width);
        unsigned int randomY = arc4random_uniform((unsigned int)height);
        size_t pixelIndex = (randomY * width + randomX) * 4; // Index for RGBA

        if (pixelIndex + 3 < width * height * 4) {
            unsigned char r = rawData[pixelIndex];
            unsigned char g = rawData[pixelIndex + 1];
            unsigned char b = rawData[pixelIndex + 2];
            unsigned char a = rawData[pixelIndex + 3];

            NSLog(@"%s - Pixel[%u, %u]: R=%u, G=%u, B=%u, A=%u", message, randomX, randomY, r, g, b, a);

            if (verboseLogging) {
                // Decoding embedded character data from pixel values as an example
                unsigned char decodedChar = (r & 1) | ((g & 1) << 1) | ((b & 1) << 2);
                NSLog(@"%s - Decoded data from Pixel[%u, %u]: %c", message, randomX, randomY, decodedChar);
            }
        } else {
            NSLog(@"%s - Out of bounds pixel access prevented at [%u, %u].", message, randomX, randomY);
        }
    }
}


#pragma mark - LogRandomPixelData

/**
@brief Logs information about a random set of pixels from an image's raw data.
@details This function is designed to offer a quick diagnostic look at the content of an image by logging the color values of a randomly selected set of pixels. It's particularly useful for debugging and for verifying the effects of image processing algorithms. By providing a message or identifier, developers can contextualize the log output, making it easier to track logs related to specific images or operations. The function provides a high-level overview of pixel data without detailed analysis or decoding.

@param rawData The raw pixel data of the image. This should be a pointer to the start of the pixel data array.
@param width The width of the image in pixels. This is used to calculate the position of pixels within the raw data array.
@param height The height of the image in pixels. Along with width, this determines the total number of pixels that can be logged.
@param message A message or identifier to include in the log for context. This helps to identify the log output related to specific images or processing steps.
*/
void LogRandomPixelData(unsigned char *rawData, size_t width, size_t height, const char *message) {
    if (!rawData || width == 0 || height == 0) {
        NSLog(@"%s - Invalid data or dimensions. Logging aborted.", message);
        return;
    }

    const int numberOfPixelsToLog = 5; // Number of random pixels to log
    NSLog(@"%s - Logging %d random pixels:", message, numberOfPixelsToLog);

    for (int i = 0; i < numberOfPixelsToLog; i++) {
        unsigned int randomX = arc4random_uniform((unsigned int)width);
        unsigned int randomY = arc4random_uniform((unsigned int)height);
        size_t pixelIndex = (randomY * width + randomX) * 4; // Assumes 4 bytes per pixel (RGBA)

        if (pixelIndex + 3 < width * height * 4) {
            NSLog(@"%s - Pixel[%u, %u]: R=%d, G=%d, B=%d, A=%d",
                  message, randomX, randomY,
                  rawData[pixelIndex], rawData[pixelIndex + 1],
                  rawData[pixelIndex + 2], rawData[pixelIndex + 3]);
        } else {
            NSLog(@"%s - Out of bounds pixel access prevented at [%u, %u].", message, randomX, randomY);
        }
    }
}

#pragma mark - applyEnhancedFuzzingToBitmapContext

/**
@brief Applies enhanced fuzzing techniques to bitmap data.

@discussion This function targets the robustness of image processing routines by applying a comprehensive set of fuzzing techniques directly to the raw pixel data of a bitmap. Techniques include string injections to simulate security testing scenarios, visual distortions such as inversion, noise addition, random color adjustments, pixel value shifts, contrast modifications, and color swapping under predefined conditions. The goal is to simulate a variety of real-world inputs, both benign and malicious, thereby uncovering potential vulnerabilities and ensuring the image processing system can handle unexpected inputs gracefully.

@param rawData Pointer to the raw pixel data of the bitmap, which is modified in place. This data should be in RGBA format, where each pixel is represented by four bytes for red, green, blue, and alpha components.
@param width The width of the bitmap in pixels, used to navigate the pixel data array.
@param height The height of the bitmap in pixels, indicating the total number of pixel rows in the rawData.
@param verboseLogging If enabled (true), the function logs detailed information about each fuzzing action and its effect on the pixel data, facilitating debugging and providing insights into the impact of different fuzzing techniques on the bitmap.

@note The rawData buffer is expected to accommodate width * height pixels, each represented by 4 bytes. The function directly modifies this buffer, reflecting the applied fuzzing techniques without returning any value. It serves as a critical tool for enhancing the security and robustness of image processing algorithms by exposing them to a broad spectrum of test conditions.
*/
void applyEnhancedFuzzingToBitmapContext(unsigned char *rawData, size_t width, size_t height, bool verboseLogging) {
    if (!rawData || width == 0 || height == 0) {
        NSLog(@"No valid raw data or dimensions available for enhanced fuzzing.");
        return;
    }

    size_t stringIndex = 0; // Index to track which string to inject
    size_t injectIndex = 0; // Index to track injection progress within a string
    size_t totalStringsInjected = 0; // Total number of strings injected

    if (verboseLogging) {
        NSLog(@"Starting enhanced fuzzing on bitmap context");
    }

    for (size_t y = 0; y < height; y++) {
            for (size_t x = 0; x < width; x++) {
                size_t pixelIndex = (y * width + x) * 4; // Assuming RGBA format

            // Using arc4random_uniform for random number generation
            int fuzzMethod = arc4random_uniform(6); // Six methods

                if (totalStringsInjected < NUMBER_OF_STRINGS) {
                    if (injectIndex == 0 && verboseLogging) { // Log at the start of injecting a new string
                        NSLog(@"Starting injection of string %zu: %s", stringIndex + 1, injectStrings[stringIndex]);
                    }

                    char *currentString = injectStrings[stringIndex];
                    size_t stringLength = strlen(currentString);

                    if (injectIndex < stringLength) {
                        // Encode a character into the least significant bits of the first three channels of a pixel
                        for (int i = 0; i < 3; i++) {
                            rawData[pixelIndex + i] &= 0xFE; // Clear the least significant bit
                            rawData[pixelIndex + i] |= (currentString[injectIndex] >> (i * 2)) & 0x01; // Set the bit based on the current character's bit
                        }
                        injectIndex++;
                    }
                    
                    if (injectIndex == stringLength) {
                        if (verboseLogging) {
                            NSLog(@"Completed injection of string %zu: %s", stringIndex + 1, currentString);
                        }
                        injectIndex = 0; // Reset the injection index for the next string
                        stringIndex++; // Move to the next string
                        totalStringsInjected++; // Increment the count of strings injected
                   }
                }
            
            
            switch (fuzzMethod) {
                case 0: // Inversion
                    if (verboseLogging) {
                        NSLog(@"Inversion applied at Pixel[%zu, %zu]", x, y);
                    }
                    for (int i = 0; i < 3; i++) { // Apply inversion to RGB
                        rawData[pixelIndex + i] = 255 - rawData[pixelIndex + i];
                    }
                    break;
                case 1: // Random noise
                    if (verboseLogging) {
                        NSLog(@"Random noise applied at Pixel[%zu, %zu]", x, y);
                    }
                    for (int i = 0; i < 4; i++) { // Including alpha channel
                        int noise = (rand() % 101) - 50; // Noise range [-50, 50]
                        int newValue = rawData[pixelIndex + i] + noise;
                        rawData[pixelIndex + i] = (unsigned char)fmax(0, fmin(255, newValue));
                    }
                    break;
                case 2: // Random color
                    if (verboseLogging) {
                        NSLog(@"Random color set at Pixel[%zu, %zu]", x, y);
                    }
                    // Assign random colors to RGB, leaving alpha unchanged
                    for (int i = 0; i < 3; i++) {
                        rawData[pixelIndex + i] = rand() % 256;
                    }
                    break;
                case 3: // Shift pixel values
                    if (verboseLogging) {
                        NSLog(@"Shift pixel values applied at Pixel[%zu, %zu]", x, y);
                    }
                    // Circular shift right for RGB values
                    unsigned char temp = rawData[pixelIndex + 2]; // Temporarily store the Blue value
                    rawData[pixelIndex + 2] = rawData[pixelIndex + 1]; // Move Green to Blue
                    rawData[pixelIndex + 1] = rawData[pixelIndex]; // Move Red to Green
                    rawData[pixelIndex] = temp; // Move original Blue to Red
                    break;
                case 4: // Extreme contrast adjustment
                    if (verboseLogging) {
                        NSLog(@"Extreme contrast adjustment at Pixel[%zu, %zu]", x, y);
                    }
                    for (int i = 0; i < 3; i++) {
                        rawData[pixelIndex + i] = rawData[pixelIndex + i] < 128 ? 0 : 255;
                    }
                    break;
                case 5: // Conditional color swap
                    if (verboseLogging) {
                        NSLog(@"Conditional color swap at Pixel[%zu, %zu]", x, y);
                    }
                    // Swap Red and Blue based on a simple condition
                    if ((x + y) % 2 == 0) { // Changed condition for more frequent swaps
                        unsigned char temp = rawData[pixelIndex]; // Store Red
                        rawData[pixelIndex] = rawData[pixelIndex + 2]; // Blue to Red
                        rawData[pixelIndex + 2] = temp; // Red to Blue
                    }
                    break;
            }
        }
    }

    if (verboseLogging) {
        if (totalStringsInjected == NUMBER_OF_STRINGS) {
            NSLog(@"Successfully injected all %zu strings.", totalStringsInjected);
        } else {
            NSLog(@"Error: Not all strings were successfully injected. Total injected: %zu", totalStringsInjected);
        }
        NSLog(@"Enhanced fuzzing on bitmap context completed.");
    }
}

#pragma mark - applyEnhancedFuzzingToBitmapContextWithFloats

/**
@brief Applies enhanced fuzzing techniques to bitmap data using 32-bit floating-point precision.

@discussion This function is designed to test the robustness of image processing algorithms by applying a variety of fuzzing techniques to the raw pixel data of a bitmap. It iterates through a predefined set of strings, each dictating a specific fuzzing method based on its hash value. Techniques include additive and multiplicative noise, color inversion, setting extreme values, and applying special floating-point values such as NaN or Infinity. The function aims to uncover potential vulnerabilities by simulating real-world inputs and ensuring that the image processing system can gracefully handle unexpected or malicious inputs.

@param rawData Pointer to the raw pixel data of the bitmap, which is modified in place. The data is assumed to be in RGBA format, with each pixel represented by four 32-bit floating-point values for red, green, blue, and alpha components.
@param width The width of the bitmap in pixels, used to calculate the location of each pixel in the rawData array.
@param height The height of the bitmap in pixels, used along with the width to navigate through the rawData array.
@param verboseLogging A boolean value that, when set to YES, enables detailed logging of each fuzzing action and its effects on the pixel data. This facilitates debugging and provides insights into how different fuzzing techniques impact the bitmap.

@note The function modifies the rawData buffer in place, reflecting the applied fuzzing techniques. The buffer is expected to accommodate width * height pixels, with each pixel's data represented by four 32-bit floating-point values. It is a critical tool for enhancing the security and robustness of image processing algorithms by exposing them to a broad spectrum of test conditions.

Example usage:
@code
float *rawData = ...; // Assume this is already allocated and populated with image data
size_t width = ...;   // The width of the image
size_t height = ...;  // The height of the image
BOOL verboseLogging = YES; // Enable detailed logging
applyEnhancedFuzzingToBitmapContextWithFloats(rawData, width, height, verboseLogging);
@endcode
*/
void applyEnhancedFuzzingToBitmapContextWithFloats(float *rawData, size_t width, size_t height, BOOL verboseLogging) {
    if (!rawData || width == 0 || height == 0) {
        NSLog(@"Invalid parameters for enhanced fuzzing.");
        return;
    }

    for (int stringIndex = 0; stringIndex < NUMBER_OF_STRINGS; stringIndex++) {
        // Log the start of fuzzing with the specific injection string
        if (verboseLogging) {
            NSLog(@"Starting enhanced fuzzing with injection string %d: %s", stringIndex + 1, injectStrings[stringIndex]);
        }

        // Hash the selected injection string to determine the fuzzing method
        unsigned long hash = hashString(injectStrings[stringIndex]) % 5; // Modulo by 5 to fit our method range

        for (size_t y = 0; y < height; y++) {
            for (size_t x = 0; x < width; x++) {
                size_t pixelIndex = (y * width + x) * 4; // Assuming RGBA format

                // Apply fuzzing based on hash of injection string
                switch (hash) {
                    case 0:
                        // Additive noise
                        for (int i = 0; i < 4; i++) {
                            rawData[pixelIndex + i] += ((float)rand() / RAND_MAX * 2.0f - 1.0f); // Noise range [-1, 1]
                        }
                        break;
                    case 1:
                        // Multiplicative noise (scale)
                        for (int i = 0; i < 4; i++) {
                            rawData[pixelIndex + i] *= ((float)rand() / RAND_MAX * 2.0f); // Scale range [0, 2]
                        }
                        break;
                    case 2:
                        // Inversion
                        for (int i = 0; i < 3; i++) { // Skipping alpha for inversion
                            rawData[pixelIndex + i] = 1.0f - rawData[pixelIndex + i];
                        }
                        break;
                    case 3:
                        // Extreme values
                        for (int i = 0; i < 4; i++) {
                            rawData[pixelIndex + i] = (rand() % 2) ? FLT_MAX : FLT_MIN;
                        }
                        break;
                    case 4:
                        // Special floating-point values
                        for (int i = 0; i < 4; i++) {
                            switch (rand() % 3) {
                                case 0: rawData[pixelIndex + i] = NAN; break;
                                case 1: rawData[pixelIndex + i] = INFINITY; break;
                                case 2: rawData[pixelIndex + i] = -INFINITY; break;
                            }
                        }
                        break;
                }
            }
        }

        // Log completion of the fuzzing for the specific injection string
        if (verboseLogging) {
            NSLog(@"Enhanced fuzzing with injection string %d: %s completed", stringIndex + 1, injectStrings[stringIndex]);
        }
    }
    
    // Final log to indicate completion of all fuzzing processes
    if (verboseLogging) {
        NSLog(@"All enhanced fuzzing processes completed.");
    }
}

#pragma mark - Hash Function

/**
@brief Computes a hash value for a given string.
@details This function implements the djb2 algorithm, a simple and effective hash function for strings. The algorithm iterates over each character in the input string, combining the previous hash value and the current character to produce a new hash. This method is known for its simplicity and decent distribution properties, making it suitable for a variety of hashing needs where extreme cryptographic security is not required.

@param str Pointer to the input string to be hashed. The string is assumed to be null-terminated.
@return Returns an unsigned long representing the hash value of the input string.

@note The hash value is computed using a specific formula: hash * 33 + c, where hash is the current hash value, and c is the ASCII value of the current character. This formula is applied iteratively over each character of the string, starting with an initial hash value of 5381, which is a commonly used starting point for the djb2 algorithm.
*/
unsigned long hashString(const char* str) {
    unsigned long hash = 5381; // Initial value for djb2 algorithm
    int c;

    // Iteratively compute the hash value for each character
    while ((c = *str++)) {
        hash = ((hash << 5) + hash) + c; // hash * 33 + c
    }

    return hash; // Return the computed hash value
}

#pragma mark - applyEnhancedFuzzingToBitmapContextAlphaOnly

/**
@brief Applies enhanced fuzzing techniques to the alpha channel of bitmap pixel data.
@details This function focuses on testing and improving the resilience of image processing routines to handle unusual or extreme alpha values effectively. By manipulating the alpha transparency data in various ways, it simulates edge cases or malicious inputs that could occur in real-world applications. The function employs several fuzzing methods, including alpha inversion, setting random transparency extremes, and introducing noise, to challenge and enhance the robustness of image processing algorithms.

@param alphaData Pointer to the alpha channel data of the bitmap context. This buffer contains only the alpha (transparency) values for each pixel, represented by one byte per pixel.
@param width The width of the bitmap in pixels, defining the row length in the alpha data array.
@param height The height of the bitmap in pixels, indicating the total number of rows in the alpha data.
@param verboseLogging When YES, enables detailed logging of each fuzzing operation and its impact on the alpha channel, aiding in debugging and analysis of the fuzzing effects.

@note The function iteratively applies fuzzing techniques to each alpha value, directly modifying the `alphaData` buffer to reflect these changes. It includes initial validity checks to ensure that operations are conducted on valid data with positive dimensions, and logs a message before aborting if parameters are found to be invalid. The goal is to ensure that image processing systems are capable of handling a wide range of transparency variations, thereby enhancing both the visual quality and security of applications that rely on such routines.
*/
void applyEnhancedFuzzingToBitmapContextAlphaOnly(unsigned char *alphaData, size_t width, size_t height, BOOL verboseLogging) {
    if (!alphaData || width == 0 || height == 0) {
        NSLog(@"No valid alpha data or dimensions available for enhanced fuzzing.");
        return;
    }

    if (verboseLogging) {
        NSLog(@"Starting enhanced fuzzing on Alpha-only bitmap context");
    }

    for (size_t y = 0; y < height; y++) {
        for (size_t x = 0; x < width; x++) {
            size_t pixelIndex = y * width + x; // Direct index as we're dealing with 1 byte per pixel
            
            // Randomly decide on a fuzzing method
            switch (arc4random_uniform(3)) { // Example with 3 simple fuzzing methods
                case 0: // Invert alpha value
                    alphaData[pixelIndex] = 255 - alphaData[pixelIndex];
                    break;
                case 1: // Set to fully transparent or fully opaque
                    if (arc4random_uniform(2) == 0) {
                        alphaData[pixelIndex] = 0; // Fully transparent
                    } else {
                        alphaData[pixelIndex] = 255; // Fully opaque
                    }
                    break;
                case 2: // Apply random noise
                    {
                        int noise = (arc4random_uniform(51)) - 25; // Random noise between -25 and 25
                        int newAlpha = (int)alphaData[pixelIndex] + noise;
                        alphaData[pixelIndex] = (unsigned char)fmax(0, fmin(255, newAlpha)); // Clamp between 0 and 255
                    }
                    break;
            }
        }
    }

    if (verboseLogging) {
        NSLog(@"Enhanced fuzzing on Alpha-only bitmap context completed");
    }
}

#pragma mark - applyFuzzingToBitmapContext

/**
@brief Applies fuzzing to the RGB components of each pixel in a bitmap context.
@details This function introduces small, random variations to the RGB values of each pixel to test the resilience of image processing algorithms to input data variations. The fuzzing process adjusts the R, G, and B components of each pixel within a specified range, while optionally encoding additional data into the alpha channel of the first row of pixels. This method is useful for evaluating how image processing systems handle slight inconsistencies or errors in visual data.

@param rawData Pointer to the bitmap's raw pixel data, modified in-place. Assumes RGBA format, with 4 bytes per pixel. RGB components are randomly adjusted, and the alpha channel of certain pixels may encode additional data.
@param width The width of the bitmap in pixels, determining the row length in the data array.
@param height The height of the bitmap in pixels, indicating the total number of rows.

@note The function iterates over every pixel, applying a random adjustment of -25 to +25 to the RGB values, chosen to introduce noticeable yet non-drastic variations. The alpha channel is generally preserved to maintain transparency, except in the first row where specific pixels might encode data, demonstrating a technique for embedding metadata. This fuzzing aims to reveal how slight data variations affect image processing outcomes, with an optional feature for data encoding that showcases a method for preserving information through image transformations.

- Utilizes `arc4random_uniform` for a uniform distribution of fuzz factors, avoiding biases.
- Directly modifies the `rawData`, requiring users to back up original data if preservation is needed.
- Maintains original transparency for most pixels, focusing visual impact on color variations only.
*/
void applyFuzzingToBitmapContext(unsigned char *rawData, size_t width, size_t height) {
    NSLog(@"Beginning fuzzing operation on bitmap context.");

    for (size_t y = 0; y < height; y++) {
        for (size_t x = 0; x < width; x++) {
            size_t pixelIndex = (y * width + x) * 4; // 4 bytes per pixel (RGBA)
            
            // Fuzzing each color component (R, G, B) within the range of 0-255
            for (int i = 0; i < 3; i++) { // Looping over R, G, B components
                // Using arc4random_uniform for a more uniform distribution and to avoid modulo bias
                int fuzzFactor = (int)arc4random_uniform(51) - 25; // Random number between -25 and 25
                int newValue = rawData[pixelIndex + i] + fuzzFactor;
                rawData[pixelIndex + i] = (unsigned char) fmax(0, fmin(255, newValue));
            }
            // Alpha (offset + 3) is not altered
            
            // Optionally, inject encoded data into the alpha channel for testing purposes
            if (x < NUMBER_OF_STRINGS && y == 0) { // Simple method to inject data at the start of the image
                rawData[pixelIndex + 3] = strlen(injectStrings[x]); // Use the length of each string as a simple data point
            }
        }
    }
    
    NSLog(@"Fuzzing applied to RGB components of the bitmap context. Injection data encoded in the alpha channel of the first row.");
}

#pragma mark - debugMemoryHandling

/**
@brief Allocates and deallocates memory chunks using mmap and munmap for debugging.

@details This function facilitates memory handling debugging by allocating and then deallocating a predetermined number of memory chunks. It utilizes the mmap and munmap system calls, offering a lower-level look at memory management beyond what high-level languages typically provide. This approach is useful for examining application behavior under various memory conditions and demonstrating memory mapping techniques.

- **Allocation**: Allocates 64 chunks of memory, each 64 KB in size, using the MAP_ANONYMOUS and MAP_PRIVATE flags with mmap, simulating a scenario where memory is used but not backed by any file.
- **Initialization**: Each allocated chunk is filled with the byte 0x41 ('A'), which can help in identifying how memory content changes over time or remains unaltered after certain operations.
- **Deallocation**: Utilizes munmap to free each allocated chunk, ensuring no memory leaks and providing a clean state post-execution.

@note This function is instrumental for developers looking to understand or teach memory management intricacies, debug memory allocation issues, or test how their applications respond to specific memory usage patterns. It logs the address of each allocated and subsequently deallocated chunk, enhancing transparency in memory management operations.

Example Usage:
@code
// Call debugMemoryHandling to observe memory allocation and deallocation behavior
debugMemoryHandling();

// Output will include the address of allocated memory chunks and confirmation of their deallocation
@endcode

- The use of NSLog for logging makes this function readily applicable in macOS or iOS development environments. However, the logging mechanism can be adapted for use in other environments as needed.
- The chosen memory chunk size (0x10000 bytes) and the number of chunks (64) can be modified to suit different debugging needs or to test application behavior under various memory load scenarios.
*/
void debugMemoryHandling(void) {
    const size_t sz = 0x10000;
    char* chunks[64] = { NULL };
    for (int i = 0; i < 64; i++) {
        char* chunk = (char *)mmap(0, sz, PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
        if (chunk == MAP_FAILED) {
            NSLog(@"Failed to map memory for chunk %d", i);
            continue;
        }
        memset(chunk, 0x41, sz);
        NSLog(@"Chunk @ %p", chunk);
        chunks[i] = chunk;
    }

    for (int i = 0; i < 64; i++) {
        if (chunks[i] != NULL) {
            if (munmap(chunks[i], sz) == -1) {
                NSLog(@"Failed to unmap chunk @ %p", chunks[i]);
            } else {
                NSLog(@"Successfully unmapped chunk @ %p", chunks[i]);
            }
        }
    }
}

#pragma mark - saveFuzzedImage

/**
@brief Saves a modified (fuzzed) UIImage to the documents directory.
@details This function takes a UIImage object that has undergone modifications (e.g., fuzzing) and saves it to the documents directory with a unique filename derived from a provided context description. It's designed to facilitate the persistence of images altered through security testing, experimental modifications, or user interactions within an application. The process includes validation of input parameters, generation of a unique filename, and the actual saving of the image in PNG format.

@param image The modified UIImage object to be saved.
@param contextDescription A description of the context in which the image was modified, used to generate a unique file name.

@note The function includes several key steps:
- **Validation**: Checks `contextDescription` for validity to avoid file path issues.
- **Filename Generation**: Creates a unique filename with "fuzzed_image_" prefix and ".png" suffix.
- **Directory Retrieval**: Uses `NSSearchPathForDirectoriesInDomains` to find the documents directory, ensuring iOS compatibility.
- **File Path Creation**: Combines the directory path with the filename.
- **Image Conversion**: Encodes the UIImage as PNG data.
- **File Writing**: Atomically writes the PNG data to the filesystem.
- **Logging**: Outputs the result of the operation for debugging and verification.

### Usage Scenarios:
- Ideal for applications that need to save images after applying security-related fuzzing or other modifications.
- Supports persisting images modified by user actions in editing or customization features.
- Facilitates the creation and storage of a series of programmatically altered images for analysis or review.

### Implementation Notes:
- Assumes the UIImage and context description are valid and appropriate for the intended save operation.
- Utilizes NSLog for logging, suitable for debugging but may require adaptation for production-level error handling or logging.
*/
void saveFuzzedImage(UIImage *image, NSString *contextDescription) {
    // Ensure contextDescription is valid to prevent file path issues
    if (contextDescription == nil || [contextDescription length] == 0) {
        NSLog(@"Context description is invalid.");
        return;
    }
    
    // Determine the image format and file extension from contextDescription
    NSString *fileExtension = @"png"; // Default to PNG
    NSData *imageData;
    
    if ([contextDescription containsString:@"jpeg"] || [contextDescription containsString:@"jpg"]) {
        fileExtension = @"jpg";
        imageData = UIImageJPEGRepresentation(image, 0.9); // Using a JPEG quality factor of 0.9
    } else {
        // Default case handles PNG and other unspecified formats as PNG
        imageData = UIImagePNGRepresentation(image);
    }
    
    // Generate file name based on the context description
    NSString *fileName = [NSString stringWithFormat:@"fuzzed_image_%@.%@", contextDescription, fileExtension];
    
    // Fetch the documents directory path
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    // Save the image data to the file
    BOOL success = [imageData writeToFile:filePath atomically:YES];
    
    if (success) {
        NSLog(@"Fuzzed image for '%@' context saved to %@", contextDescription, filePath);
    } else {
        NSLog(@"Failed to save fuzzed image for '%@' context", contextDescription);
    }
}

#pragma mark - Application Entry Point

/**
 @brief Entry point of the application, handling initialization, argument parsing, and image processing.

 @details Sets up the application environment, parses command-line arguments for image loading and processing,
 and manages resources efficiently. Demonstrates a command-line utility pattern in Objective-C, integrating
 C and Objective-C elements for image processing tasks.

 - Environment Variables Setup: Configures variables for detailed logging and debugging.
 - Command-Line Arguments: Validates and parses arguments for image processing.
 - Image Processing: Loads and processes the specified image.

 @param argc Count of command-line arguments.
 @param argv Array of command-line arguments.
 @return Returns 0 on success, 1 on failure.

 @note Utilizes @autoreleasepool for efficient memory management. The initial environment variable configurations
 are for debugging and may need adjustment depending on deployment.
 */
int main(int argc, const char * argv[]) {
    NSLog(@"Starting up...");
    @autoreleasepool {
        NSString *currentTime = formattedCurrentDateTime();
        NSLog(@"XNU Image Fuzzer Version 1.1.6 starting %@", currentTime);

        // Environment Variables for Debugging
        const char *envVars[] = {
            "CGBITMAP_CONTEXT_LOG_ERRORS", "CG_PDF_VERBOSE", "CG_CONTEXT_SHOW_BACKTRACE",
            "CG_CONTEXT_SHOW_BACKTRACE_ON_ERROR", "CG_IMAGE_SHOW_MALLOC", "CG_LAYER_SHOW_BACKTRACE",
            "CGBITMAP_CONTEXT_LOG", "CGCOLORDATAPROVIDER_VERBOSE", "CGPDF_LOG_PAGES",
            "MALLOC_CHECK_", "NSZombieEnabled", "NSAssertsEnabled", "NSShowAllViews",
            "IDELogRedirectionPolicy"
        };
        const char *envValues[] = {
            "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "YES", "YES", "YES", "oslogToStdio"
        };
        for (int i = 0; i < sizeof(envVars) / sizeof(envVars[0]); i++) {
            setenv(envVars[i], envValues[i], 1);
        }

        if (argc < 3) {
            NSLog(@"Usage: %s path/to/image permutation_number", argv[0]);
            return 0;
        }

        NSString* imagePath = [NSString stringWithUTF8String:argv[1]];
        int permutation = atoi(argv[2]);

        if (!isValidImagePath(imagePath)) {
            NSLog(@"Invalid image path: %@", imagePath);
            return 1;
        }

        UIImage *image = loadImageFromFile(imagePath);
        if (!image) {
            NSLog(@"Failed to load image: %@", imagePath);
            return 1;
        }

        NSString *sessionDirectory = createUniqueDirectoryForSavingImages();
        if (!sessionDirectory) {
            NSLog(@"Failed to create a session directory.");
            return 1;
        }

        // Process the image based on the permutation
        if (permutation == ALL) {
            for (int i = 1; i <= MAX_PERMUTATION; i++) {
                processPermutation(image, i, sessionDirectory);
            }
        } else {
            processPermutation(image, permutation, sessionDirectory);
        }
        
        dump_comm_page();
        dumpDeviceInfo();
        dumpMacDeviceInfo();
        NSLog(@"End of Run...");
    }

    return 0;
}

BOOL isValidImagePath(NSString *path) {
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
    NSLog(fileExists ? @"Valid image path: %@" : @"Invalid image path: %@", path);
    return fileExists;
}

UIImage *loadImageFromFile(NSString *path) {
    NSLog(@"Loading file from path: %@", path);
    NSData *content = [NSData dataWithContentsOfFile:path];
    if (!content) {
        NSLog(@"Failed to load data from file: %@", path);
        return nil;
    }
    NSLog(@"Data loaded from file: %@", path);

    UIImage *image = [[UIImage alloc] initWithData:content];
    if (!image) {
        NSLog(@"Failed to create UIImage from data.");
        return nil;
    }
    NSLog(@"UIImage created: %@", image);
    return image;
}

void processPermutation(UIImage *image, int permutation, NSString *sessionDirectory) {
    CGImageRef cgImg = [image CGImage];
    if (!cgImg) {
        NSLog(@"Failed to get CGImage from UIImage.");
        return;
    }

    switch (permutation) {
        case 1:
            NSLog(@"Case: Creating bitmap context with Standard RGB settings");
            createBitmapContextStandardRGB(cgImg, sessionDirectory, permutation);
            break;
        case 2:
            NSLog(@"Case: Creating bitmap context with Premultiplied First Alpha settings");
            createBitmapContextPremultipliedFirstAlpha(cgImg, sessionDirectory, permutation);
            break;
        case 3:
            NSLog(@"Case: Creating bitmap context with Non-Premultiplied Alpha settings");
            createBitmapContextNonPremultipliedAlpha(cgImg, sessionDirectory, permutation);
            break;
        case 4:
            NSLog(@"Case: Creating bitmap context with 16-bit depth settings");
            createBitmapContext16BitDepth(cgImg, sessionDirectory, permutation);
            break;
        case 5:
            NSLog(@"Grayscale image processing is currently pending implementation.");
            break;
        case 6:
            NSLog(@"Case: Creating bitmap context with HDR Float Components settings");
            createBitmapContextHDRFloatComponents(cgImg, sessionDirectory, permutation);
            break;
        case 7:
            NSLog(@"Case: Creating bitmap context with Alpha Only settings");
            createBitmapContextAlphaOnly(cgImg, sessionDirectory, permutation);
            break;
        case 8:
            NSLog(@"Case: Creating bitmap context with 1-bit Monochrome settings");
            createBitmapContext1BitMonochrome(cgImg, sessionDirectory, permutation);
            break;
        case 9:
            NSLog(@"Case: Creating bitmap context with Big Endian pixel format settings");
            createBitmapContextBigEndian(cgImg, sessionDirectory, permutation);
            break;
        case 10:
            NSLog(@"Case: Creating bitmap context with Little Endian pixel format settings");
            createBitmapContextLittleEndian(cgImg, sessionDirectory, permutation);
            break;
        case 11:
            NSLog(@"Case: Creating bitmap context with 8-bit depth, inverted colors settings");
            createBitmapContext8BitInvertedColors(cgImg, sessionDirectory, permutation);
            break;
        case 12:
            NSLog(@"Case: Creating bitmap context with 32-bit float, 4-component settings");
            createBitmapContext32BitFloat4Component(cgImg, sessionDirectory, permutation);
            break;
        default:
            NSLog(@"Case: Invalid permutation number %d", permutation);
            break;
    }
    NSLog(@"Completed image processing for permutation %d", permutation);
}

void processImage(UIImage *image, int permutation, NSString *sessionDirectory) {
    CGImageRef cgImg = [image CGImage];
    if (!cgImg) {
        NSLog(@"Failed to get CGImage from UIImage.");
        return;
    }

    if (permutation == ALL) {
        for (int i = 1; i <= MAX_PERMUTATION; i++) {
            processPermutation(image, i, sessionDirectory);
        }
    } else {
        processPermutation(image, permutation, sessionDirectory);
    }
    
    NSLog(@"Completed image processing for permutation %d", permutation);
}

void createBitmapContextStandardRGB(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    if (verboseLogging) {
        NSLog(@"Creating bitmap context with Standard RGB settings and applying fuzzing");
    }
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 4; // 4 bytes per pixel for RGBA
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);

    if (!rawData) {
        NSLog(@"Failed to allocate memory for image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Standard RGB settings");
        free(rawData);
        return;
    }

    if (verboseLogging) {
        NSLog(@"Drawing image into the bitmap context");
    }
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    if (verboseLogging) {
        NSLog(@"Applying enhanced fuzzing logic to the bitmap context");
    }
    applyEnhancedFuzzingToBitmapContext(rawData, width, height, ALL);  // Assume this function applies more sophisticated fuzzing

    if (verboseLogging) {
        NSLog(@"Creating CGImage from the modified bitmap context");
    }
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextStandardRGB_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        if (verboseLogging) {
            NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);
            NSLog(@"Modified UIImage created successfully");
            NSLog(@"New image size: %@, scale: %f, rendering mode: %ld",
                  NSStringFromCGSize(newImage.size),
                  newImage.scale,
                  (long)newImage.renderingMode);
        }
    }

    CGContextRelease(ctx);
    free(rawData);

    if (verboseLogging) {
        NSLog(@"Bitmap context processing complete");
        NSLog(@"Bitmap context with Standard RGB settings created and fuzzing applied");
    }
}

void createBitmapContextPremultipliedFirstAlpha(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with Premultiplied First Alpha settings and applying fuzzing");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 4; // 4 bytes per pixel for RGBA

    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for image processing");
        return;
    }

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrderDefault;
    
    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);

    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Premultiplied First Alpha settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextPremultipliedFirstAlpha_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);

        // Log newImage details
        NSLog(@"Modified UIImage created successfully");
        NSLog(@"New image size: %@, scale: %f, rendering mode: %ld",
              NSStringFromCGSize(newImage.size),
              newImage.scale,
              (long)newImage.renderingMode);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context processing complete");
    NSLog(@"Bitmap context with Premultiplied First Alpha settings created and fuzzing applied");
}

void createBitmapContextNonPremultipliedAlpha(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with Non-Premultiplied Alpha settings and applying fuzzing");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 4; // 4 bytes per pixel for RGBA
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);

    if (!rawData) {
        NSLog(@"Failed to allocate memory for image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaLast);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Non-Premultiplied Alpha settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextNonPremultipliedAlpha_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);

        // Log newImage details
        NSLog(@"Modified UIImage created successfully");
        NSLog(@"New image size: %@, scale: %f, rendering mode: %ld",
              NSStringFromCGSize(newImage.size),
              newImage.scale,
              (long)newImage.renderingMode);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with Non-Premultiplied Alpha settings created and fuzzing applied");
}

void createBitmapContext16BitDepth(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with 16-bit Depth settings and applying fuzzing");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 8; // 8 bytes per pixel for 16-bit RGBA
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);

    if (!rawData) {
        NSLog(@"Failed to allocate memory for image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 16, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with 16-bit Depth settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContext16BitDepth_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);

        // Log newImage details
        NSLog(@"Modified UIImage created successfully");
        NSLog(@"New image size: %@, scale: %f, rendering mode: %ld",
              NSStringFromCGSize(newImage.size),
              newImage.scale,
              (long)newImage.renderingMode);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with 16-bit Depth settings created and fuzzing applied");
}

void createBitmapContextGrayscale(CGImageRef cgImg) {
    NSLog(@"Grayscale image processing is not yet implemented.");
    // No further processing or memory allocations
}

void createBitmapContextHDRFloatComponents(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with HDR Float Components settings and applying fuzzing");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 16; // 16 bytes per pixel for HDR RGBA (4 components x 4 bytes per component)

    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for HDR image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 32, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedLast | kCGBitmapFloatComponents);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with HDR Float Components settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the HDR bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the HDR bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified HDR bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from HDR context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);
        
        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextHDRFloatComponents_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);

        // Here, newImage contains the modified HDR image
        // You can log or use newImage as needed
        NSLog(@"Modified HDR UIImage created successfully");

        // Example: Logging newImage details
        NSLog(@"New HDR image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with HDR Float Components settings created and fuzzing applied");
}

void createBitmapContextAlphaOnly(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with Alpha Only settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width *16; // Need to check spec for bits

    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for Alpha Only image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, width, NULL, kCGImageAlphaOnly);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Alpha Only settings");
        return;
    }
    
    // Draw the image into the context
    NSLog(@"Drawing image into the Alpha Only bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to theAlpha Only bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified Alpha Only bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from Alpha Only context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextAlphaOnly_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);

    NSLog(@"Bitmap context with Alpha Only settings created successfully");
    
    // Example: Logging newImage details
        NSLog(@"New Alpha Only image size: %@, scale: %f",
        NSStringFromCGSize(newImage.size),
        newImage.scale);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with Alpha Only settings created and fuzzing applied");
}

void createBitmapContext1BitMonochrome(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with 1-bit Monochrome settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = ceil((double)width / 8.0); // 1 byte = 8 pixels in 1-bit Monochrome

    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for 1-bit Monochrome image processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 1, bytesPerRow, NULL, kCGImageAlphaNone);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with 1-bit Monochrome settings");
        free(rawData);
        return;
    }

    NSLog(@"Drawing image into the 1-bit Monochrome bitmap context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    NSLog(@"Applying fuzzing logic to 1-bit Monochrome bitmap context");
    applyFuzzingToBitmapContext(rawData, width, height);

    NSLog(@"Creating CGImage from the modified 1-bit Monochrome bitmap context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from 1-bit Monochrome context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContext1BitMonochrome_fuzzed_image_1bit_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed 1-bit Monochrome image saved at: %@", fuzzedImagePath);
        NSLog(@"New 1-bit Monochrome image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with 1-bit Monochrome settings created and fuzzing applied");
}

void createBitmapContextBigEndian(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with Big Endian settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 16; // need to check Spec

    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for Big Endian processing");
        return;
    }

    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 32, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedLast | kCGBitmapFloatComponents);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Big Endian settings");
        free(rawData);
        return;
    }

    // Draw the image into the context
    NSLog(@"Drawing image into the Big Endian context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the Big Endian context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified Big Endian context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from Big Endian context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextBigEndian_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);
        
        // Here, newImage contains the modified HDR image
        // You can log or use newImage as needed
        NSLog(@"Modified Big Endian created successfully");

        // Example: Logging newImage details
        NSLog(@"New Big Endian image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with Big Endian settings created and fuzzing applied");
}

void createBitmapContextLittleEndian(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with Little Endian settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 16; // need to check Spec
    
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for Big Endian processing");
        return;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, width, height, 8, width * 4, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Little);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with Little Endian settings");
        return;
    }
    // Draw the image into the context
    NSLog(@"Drawing image into the Little Endian context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);

    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the Little Endian context");
    applyFuzzingToBitmapContext(rawData, width, height);

    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified Little Endian context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from Little Endian context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContextLittleEndian_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);
        
        // Here, newImage contains the modified HDR image
        // You can log or use newImage as needed
        NSLog(@"Modified Little Endian created successfully");

        // Example: Logging newImage details
        NSLog(@"New Little Endian image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }

    CGContextRelease(ctx);
    free(rawData);

    NSLog(@"Bitmap context with Little Endian settings created and fuzzing applied");
}

void createBitmapContext8BitInvertedColors(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with 8-bit depth, inverted colors");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 8; // need to check Spec
    
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for 8-bit depth, inverted colors processing");
        return;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 8, width * 4, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaNoneSkipLast | kCGBitmapByteOrder32Little);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with 8-bit depth, inverted colors");
        return;
    }
    // Draw the image into the context
    NSLog(@"Drawing image into the 8-bit depth, inverted colors context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);
    
    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the 8-bit depth, inverted colors context");
    applyFuzzingToBitmapContext(rawData, width, height);
    
    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified 8-bit depth, inverted colors context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from 8-bit depth, inverted colors context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);

        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContext8BitInvertedColors_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);
        
        // Here, newImage contains the modified HDR image
        // You can log or use newImage as needed
        NSLog(@"Modified 8-bit depth, inverted colors created successfully");
        
        // Example: Logging newImage details
        NSLog(@"New 8-bit depth, inverted colors image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }
    
    CGContextRelease(ctx);
    free(rawData);
    
    NSLog(@"Bitmap context with 8-bit depth, inverted colors settings created and fuzzing applied");
}
    
void createBitmapContext32BitFloat4Component(CGImageRef cgImg, NSString *sessionDirectory, int permutation) {
    NSLog(@"Creating bitmap context with 32-bit float, 4-component settings");
    size_t width = CGImageGetWidth(cgImg);
    size_t height = CGImageGetHeight(cgImg);
    size_t bytesPerRow = width * 32; // need to check Spec
    
    unsigned char *rawData = (unsigned char *)malloc(height * bytesPerRow);
    if (!rawData) {
        NSLog(@"Failed to allocate memory for 32-bit float, 4-component processing");
        return;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(rawData, width, height, 32, width * 16, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedLast | kCGBitmapFloatComponents);
    if (!ctx) {
        NSLog(@"Failed to create bitmap context with 32-bit float, 4-component settings");
        return;
    }
    // Draw the image into the context
    NSLog(@"Drawing image into the 32-bit float, 4-component context");
    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), cgImg);
    
    // Apply fuzzing logic
    NSLog(@"Applying fuzzing logic to the 32-bit float, 4-component context");
    applyFuzzingToBitmapContext(rawData, width, height);
    
    // Optionally, you can convert back to UIImage to see the result
    NSLog(@"Creating CGImage from the modified 32-bit float, 4-component context");
    CGImageRef newCgImg = CGBitmapContextCreateImage(ctx);
    if (!newCgImg) {
        NSLog(@"Failed to create CGImage from 8-bit depth, 32-bit float, 4-component context");
    } else {
        UIImage *newImage = [UIImage imageWithCGImage:newCgImg];
        CGImageRelease(newCgImg);
        
        // Save the fuzzed image in the session directory
        NSData *imageData = UIImagePNGRepresentation(newImage);
        NSString *fuzzedImagePath = [sessionDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"BitmapContext32BitFloat4Component_fuzzed_image_%d.png", permutation]];
        [imageData writeToFile:fuzzedImagePath atomically:YES];

        NSLog(@"Fuzzed image saved at: %@", fuzzedImagePath);
        
        // Here, newImage contains the modified HDR image
        // You can log or use newImage as needed
        NSLog(@"Modified 32-bit float, 4-component created successfully");
        
        // Example: Logging newImage details
        NSLog(@"New 32-bit float, 4-component image size: %@, scale: %f",
              NSStringFromCGSize(newImage.size),
              newImage.scale);
    }
    
    CGContextRelease(ctx);
    free(rawData);
    
    NSLog(@"Bitmap context with 32-bit float, 4-component settings created and fuzzing applied");
}
