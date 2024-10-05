/**
 *  @file interpose.c
 *  @brief Interposing Code for iOS on Mac
 *  @author @h02332 | David Hoyt
 *  @date 01 MAR 2024
 *  @version 1.0.1
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
 *  - 01/03/2024, h02332: Update commit.
 *
 *  @section TODO
 *  - Logging
 */

#pragma mark - Headers

#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

typedef void* xpc_object_t;

extern xpc_object_t xpc_dictionary_create(void*, void*, int);
extern void xpc_dictionary_set_value(xpc_object_t, const char*, xpc_object_t);
extern xpc_object_t xpc_bool_create(int);
extern xpc_object_t xpc_copy_entitlements_for_self();
extern xpc_object_t xpc_dictionary_get_value(xpc_object_t, const char*);

#pragma mark - Debugging Macros

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

#define DYLD_INTERPOSE(_replacement, _replacee) \
    __attribute__((used)) static struct { const void* replacement; const void* replacee; } _interpose_##_replacee \
        __attribute__ ((section ("__DATA,__interpose"))) = { (const void*)(unsigned long)&_replacement, (const void*)(unsigned long)&_replacee };

#pragma mark - Debugging Utilities

void log_xpc_dictionary(xpc_object_t dict);

#pragma mark - Custom Entitlements Function

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
