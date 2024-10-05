/**
 *  @file runner.c
 *  @brief Interposing Code for iOS on Mac
 *  @author @h02332 | David Hoyt
 *  @date 01 MAR 2024
 *  @version 1.0.3
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
 *  - 01/03/2023, h02332: Update Logging and Quick Help, setup libgmalloc
 *
 *  @section TODO
 *  - Logging
 */

#pragma mark - Headers

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <dlfcn.h>
#include <signal.h>
#include <unistd.h>
#include <spawn.h>
#include <sys/wait.h>
#include <mach/mach.h>
#include <mach/vm_map.h>
#include <mach/vm_page_size.h>

#define page_align(addr) (vm_address_t)((uintptr_t)(addr) & (~(vm_page_size - 1)))
#define PLATFORM_IOS 2

extern char **environ;

#pragma mark - External Declarations

extern int posix_spawnattr_set_platform_np(posix_spawnattr_t*, int, int);

#pragma mark - Instrumentation Function

/*!
 * @brief Instruments the specified process for patching.
 * @discussion This function attaches to a given process ID and performs a series of memory manipulations
 * to patch specific points in the target's memory. It's primarily used for bypassing certain security checks.
 * @param pid The process ID of the target application.
 */
void instrument(pid_t pid) {
    kern_return_t kr;
    task_t task;

    printf("[*] Instrumenting process with PID %d...\n", pid);

    // Attach to the task
    printf("[*] Attempting to attach to task with PID %d...\n", pid);
    kr = task_for_pid(mach_task_self(), pid, &task);
    if (kr != KERN_SUCCESS) {
        fprintf(stderr, "[-] task_for_pid failed with error code: %d\n", kr);
        fprintf(stderr, "[-] Error description: %s\n", mach_error_string(kr));
        return;
    }
    printf("[+] Successfully attached to task with PID %d\n", pid);

    // Find patch point
    printf("[*] Finding patch point...\n");
    FILE* output = popen("nm -arch arm64e /usr/lib/dyld  | grep _amfi_check_dyld_policy_self", "r");
    unsigned int patch_offset;
    int r = fscanf(output, "%x t _amfi_check_dyld_policy_self", &patch_offset);
    pclose(output); // Close the pipe after reading
    if (r != 1) {
        fprintf(stderr, "[-] Failed to find offset of _amfi_check_dyld_policy_self in /usr/lib/dyld\n");
        return;
    }
    printf("[*] _amfi_check_dyld_policy_self at offset 0x%x in /usr/lib/dyld\n", patch_offset);

    // Re-attach to the target process
    printf("[*] Attaching to target process...\n");
    kr = task_for_pid(mach_task_self(), pid, &task);
    if (kr != KERN_SUCCESS) {
        fprintf(stderr, "[-] task_for_pid failed: %s\n", mach_error_string(kr));
        return;
    }

    // Scan for /usr/lib/dyld in target's memory
    printf("[*] Scanning for /usr/lib/dyld in target's memory...\n");
    vm_address_t dyld_addr = 0;
    int headers_found = 0;

    vm_address_t addr = 0;
    vm_size_t size;
    vm_region_submap_info_data_64_t info;
    mach_msg_type_number_t info_count = VM_REGION_SUBMAP_INFO_COUNT_64;
    unsigned int depth = 0;

    while (1) {
        kr = vm_region_recurse_64(task, &addr, &size, &depth, (vm_region_info_t)&info, &info_count);
        if (kr != KERN_SUCCESS) break;

        unsigned int header;
        vm_size_t bytes_read;
        kr = vm_read_overwrite(task, addr, 4, (vm_address_t)&header, &bytes_read);
        if (kr != KERN_SUCCESS || bytes_read != 4) {
            printf("[-] vm_read_overwrite failed\n");
            return;
        }

        if (header == 0xfeedfacf) headers_found++;
        if (headers_found == 2) {
            dyld_addr = addr;
            break;
        }

        addr += size;
    }

    if (dyld_addr == 0) {
        printf("[-] Failed to find /usr/lib/dyld\n");
        return;
    }

    printf("[*] /usr/lib/dyld mapped at 0x%lx\n", dyld_addr);

    vm_address_t patch_addr = dyld_addr + patch_offset;

    printf("[*] Patching _amfi_check_dyld_policy_self...\n");
    kr = vm_protect(task, page_align(patch_addr), vm_page_size, false, VM_PROT_READ | VM_PROT_WRITE | VM_PROT_COPY);
    if (kr != KERN_SUCCESS) {
        printf("[-] vm_protect failed\n");
        return;
    }

    const char* code = "\xe8\x0b\x80\xd2\x28\x00\x00\xf9\xc0\x03\x5f\xd6";
    kr = vm_write(task, patch_addr, (vm_offset_t)code, 12);
    if (kr != KERN_SUCCESS) {
        printf("[-] vm_write failed\n");
        return;
    }

    kr = vm_protect(task, page_align(patch_addr), vm_page_size, false, VM_PROT_READ | VM_PROT_EXECUTE);
    if (kr != KERN_SUCCESS) {
        printf("[-] vm_protect failed\n");
        return;
    }

    puts("[+] Successfully patched _amfi_check_dyld_policy_self");
}

#pragma mark - Run Function

/*!
 * @brief Runs the target application with the given arguments.
 * @discussion This function initializes the spawn attributes, sets the target platform, and spawns the target
 * application process. It then instruments the process for patching.
 * @param argc The argument count.
 * @param argv The argument vector.
 * @return Returns 0 on success, -1 on failure.
 */
int run(int argc, char* argv[]) {
    pid_t pid;
    int rv;

    posix_spawnattr_t attr;
    rv = posix_spawnattr_init(&attr);
    if (rv != 0) {
        perror("posix_spawnattr_init");
        return -1;
    }

    rv = posix_spawnattr_setflags(&attr, POSIX_SPAWN_START_SUSPENDED);
    if (rv != 0) {
        perror("posix_spawnattr_setflags");
        posix_spawnattr_destroy(&attr);
        return -1;
    }

    rv = posix_spawnattr_set_platform_np(&attr, PLATFORM_IOS, 0);
    if (rv != 0) {
        perror("posix_spawnattr_set_platform_np");
        posix_spawnattr_destroy(&attr);
        return -1;
    }

    printf("[*] Preparing to set DYLD_INSERT_LIBRARIES for fuzzing...\n");
    // Uncomment the following line to activate the specified environment variable for fuzzing purposes.
    // Note: Ensure that using libgmalloc.dylib is appropriate for your fuzzing context.
    setenv("DYLD_INSERT_LIBRARIES", "/usr/lib/libgmalloc.dylib", 1);
    printf("[+] DYLD_INSERT_LIBRARIES set to /usr/lib/libgmalloc.dylib for fuzzing.\n");

    
    rv = posix_spawn(&pid, argv[1], NULL, &attr, &argv[1], environ);
    if (rv != 0) {
        perror("posix_spawn");
        posix_spawnattr_destroy(&attr);
        return -1;
    }

    printf("[+] Child process created with PID: %i\n", pid);

    instrument(pid);

    printf("[*] Sending SIGCONT to continue child\n");
    kill(pid, SIGCONT);

    int status;
    rv = waitpid(pid, &status, 0);
    if (rv == -1) {
        perror("waitpid");
        posix_spawnattr_destroy(&attr);
        return -1;
    }

    printf("[*] Child exited with status %i\n", status);

    posix_spawnattr_destroy(&attr);
    return 0;
}

#pragma mark - Main Function

/*!
 * @brief Main entry point of the runner application.
 * @param argc The argument count.
 * @param argv The argument vector.
 * @return Returns 0 on success, 1 on incorrect usage.
 */
int main(int argc, char* argv[]) {
    if (argc <= 1) {
        fprintf(stderr, "Usage: %s path/to/ios_binary [args...]\n", argv[0]);
        return 1;
    }

    return run(argc, argv);
}
