/**
 *  @file commpage_reader.c
 *  @brief Proof of concept commpage_reader.
 *  @author @h02332 | David Hoyt
 *  @date 28 FEB 2024
 *  @version 1.1.1
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
 *  - 02/28/2024, h02332: Initial commit.
 *
 *  @section TODO
 *  - Add Logging Toggle as global variable
 */

#pragma mark - Headers

/**
@brief Includes core and external libraries necessary for the fuzzer functionality.

@details Necessary headers for Foundation framework, UI Kit, Core Graphics,
standard input/output, standard library, memory management, mathematical functions,
Boolean type, floating-point limits, and string functions are included to support
image processing, UI interaction, and basic C operations.
*/
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#pragma mark - Constants

/**
@brief Defines constants for general application configuration.

@details This section includes constants such as ALL, which is used to indicate
an operation applies to all items or states, and MAX_PERMUTATION, defining the maximum
number of permutations in image processing.
*/
#define COMM_PAGE64_BASE_ADDRESS        (0x0000000FFFFFC000ULL)
#define COMM_PAGE_CPU_CAPABILITIES64    (COMM_PAGE64_BASE_ADDRESS + 0x010)

#pragma mark - CPU_CAP

const char *cpu_cap_strings[] = {
    "MMX", "SSE", "SSE2", "SSE3", "Cache32", "Cache64", "Cache128",
    "FastThreadLocalStorage", "SupplementalSSE3", "64Bit", "SSE4_1", "SSE4_2",
    "AES", "InOrderPipeline", "Slow", "UP", "NumCPUs", "AVX1_0", "RDRAND",
    "F16C", "ENFSTRG", "FMA", "AVX2_0", "BMI1", "BMI2", "RTM", "HLE", "ADX",
    "RDSEED", "MPX", "SGX"
};

#pragma mark - Signature
/**
 Reads the system's "commpage" to get the signature.

 This function allocates memory for the signature and copies the signature
 from the COMM_PAGE64_BASE_ADDRESS. The caller is responsible for freeing
 the allocated memory.

 - Returns: A pointer to a null-terminated string containing the commpage signature.
            The caller must free this memory using `free`.
 */
// Improved signature function with error handling
char *signature() {
    char *signature = malloc(0x10 + 1); // +1 for null terminator
    if (!signature) {
        fprintf(stderr, "Error: Failed to allocate memory for signature.\n");
        return NULL;
    }
    memcpy(signature, (const char *)COMM_PAGE64_BASE_ADDRESS, 0x10);
    signature[0x10] = '\0'; // Ensure null termination
    return signature;
}

#pragma mark - Dump
/**
 Dumps various pieces of information from the system's commpage.

 This function reads and prints information such as the commpage signature,
 CPU capabilities, and other system-related information directly from the
 commpage memory area.

 The output is printed to the standard output.
 */
// Simplified reading functions
#define READ_COMM_PAGE_VALUE(type, address) (*((type *)(address)))

void dump_comm_page() {
    char *sig = signature();
    if (sig) {
        printf("[*] COMM_PAGE_SIGNATURE: %s\n", sig);
        free(sig);
    } else {
        printf("[*] COMM_PAGE_SIGNATURE: Error reading signature.\n");
    }

    // Utilizing macro for simplified reading
    printf("[*] COMM_PAGE_VERSION: %d\n", READ_COMM_PAGE_VALUE(uint16_t, COMM_PAGE64_BASE_ADDRESS + 0x01E));
    printf("[*] COMM_PAGE_NCPUS: %d\n", READ_COMM_PAGE_VALUE(uint8_t, COMM_PAGE64_BASE_ADDRESS + 0x022));
    // Other comm page details omitted for brevity

    printf("[*] COMM_PAGE_CPU_CAPABILITIES64:\n");
    uint64_t cpu_caps = READ_COMM_PAGE_VALUE(uint64_t, COMM_PAGE_CPU_CAPABILITIES64);
    for (int i = 0, shift = 0; i < (int)(sizeof(cpu_cap_strings) / sizeof(char *)); i++) {
        if (i == 16) { // Special handling for NumCPUs
            printf("\t%s: %d\n", cpu_cap_strings[i], (int)(cpu_caps >> 16) & 0xFF);
            shift = 24; // Skip to the next relevant bit
            continue;
        }
        printf("\t%s: %s\n", cpu_cap_strings[i], (cpu_caps & (1ULL << shift)) ? "true" : "false");
        shift++;
    }
    printf("[*] Done dumping comm page.\n");
}

#pragma mark - Program Entry Point

/**
 The main entry point of the program.

 This function calls `dump_comm_page` to print information from the system's commpage.

 - Parameter argc: The count of command-line arguments.
 - Parameter argv: An array of command-line arguments.

 - Returns: An integer representing the exit code of the program. `0` indicates success.
 */
int main() {
    dump_comm_page();
    return 0;
}
