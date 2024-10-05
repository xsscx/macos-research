/**
 *  @file interpose.c
 *  @brief Interposing Code for iOS on Mac Security Research
 *  @author David Hoyt
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
 *  @section TODO
 *  - Implement comprehensive logging.
 *  - Extend debugging utilities.
 *  - Validate XPC object manipulation safety.
 */

#pragma mark - Headers

/**
@brief Core and external libraries necessary for the fuzzer functionality.

@details This section includes the necessary headers for the Foundation framework, UIKit, Core Graphics,
standard input/output, standard library, memory management, mathematical functions,
Boolean type, floating-point limits, and string functions. These libraries support
image processing, UI interaction, and basic C operations essential for the application.
*/
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <stdbool.h>

typedef void* xpc_object_t;

extern xpc_object_t xpc_dictionary_create(void*, void*, int);
extern void xpc_dictionary_set_value(xpc_object_t, const char*, xpc_object_t);
extern xpc_object_t xpc_bool_create(bool value);
extern xpc_object_t xpc_copy_entitlements_for_self();
extern xpc_object_t xpc_dictionary_get_value(xpc_object_t, const char*);

#pragma mark - Debugging Macros

/**
 Documentation for the Debugging Macros section

 Defines macros for logging debug messages and errors. `DEBUG_LOGGING` controls whether debug output is enabled. If set to 1, `DEBUG_PRINT` and `DEBUG_PRINT_ERRNO` output messages to standard error; otherwise, they do nothing. This allows for easy toggling of debug messages in the code.
 */
#define DEBUG_LOGGING 1

#if DEBUG_LOGGING
#define DEBUG_PRINT(...) fprintf(stderr, __VA_ARGS__)
#define DEBUG_PRINT_ERRNO(msg) fprintf(stderr, "%s: %s\n", msg, strerror(errno))
#else
#define DEBUG_PRINT(...)
#define DEBUG_PRINT_ERRNO(msg)
#endif

#define EXTENDED_DEBUGGING 1

#pragma mark - DYLD Interposing

/**
 Documentation for the DYLD Interposing section

 Utilizes the DYLD interposing mechanism to replace the `xpc_copy_entitlements_for_self` function at runtime. This is achieved through the use of a custom struct and the `__DATA,__interpose` section attribute, mapping the replacement function to the original symbol.
 */
#define DYLD_INTERPOSE(_replacement, _replacee) \
    __attribute__((used)) static struct { const void* replacement; const void* replacee; } _interpose_##_replacee \
        __attribute__ ((section ("__DATA,__interpose"))) = { (const void*)(uintptr_t)&_replacement, (const void*)(uintptr_t)&_replacee };

#pragma mark - Debugging Utilities

/**
 Documentation for the Debugging Utilities section

 Contains utility functions for debugging purposes, including `log_xpc_dictionary`, which is intended to log the contents of an XPC dictionary object. This can be useful for inspecting the changes made to entitlements or other XPC objects during runtime.
 */
void log_xpc_dictionary(xpc_object_t dict);

#pragma mark - Custom Entitlements Function

/**
 Documentation for the Custom Entitlements Function section

 Implements `my_xpc_copy_entitlements_for_self`, a custom version of `xpc_copy_entitlements_for_self`. This function creates and returns an XPC dictionary with modified entitlements for the current process, specifically disabling sandbox restrictions using the `com.apple.private.security.no-sandbox` entitlement. Extended debugging can be enabled to log the modified entitlements dictionary.
 */
xpc_object_t my_xpc_copy_entitlements_for_self() {
    DEBUG_PRINT("[*] Entering interposed xpc_copy_entitlements_for_self\n");

    xpc_object_t dict = xpc_dictionary_create(NULL, NULL, 0);
    if (!dict) {
        DEBUG_PRINT_ERRNO("[!] Error creating XPC dictionary");
        return NULL;
    }

    xpc_dictionary_set_value(dict, "com.apple.private.security.no-sandbox", xpc_bool_create(1));
    DEBUG_PRINT("[*] Modified entitlements dictionary\n");

#if EXTENDED_DEBUGGING
    log_xpc_dictionary(dict);
#endif

    return dict;
}

void log_xpc_dictionary(xpc_object_t dict) {
    DEBUG_PRINT("[*] Logging dictionary contents...\n");
}

DYLD_INTERPOSE(my_xpc_copy_entitlements_for_self, xpc_copy_entitlements_for_self);
