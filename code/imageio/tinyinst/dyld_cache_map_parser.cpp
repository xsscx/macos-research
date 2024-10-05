/**
 *  @file dyld_cache_map_parser.cpp
 *  @brief tinyinst - arm64 Program Modifications
 *  @author @h02332 | David Hoyt
 *  @date 04 MAR 2024
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
 *  - 03/03/2024, h02332: Initial commit.
 *
 *  @section TODO
 *  - Continue Fixing regex handling
 *  - Narrow Down Crashers in Regex and Crypto
 *  - Refactor more arm64 code into smaller chunks
 */

#pragma mark - Headers

/**
 *  @brief Core and external libraries necessary for the fuzzer functionality.
 *  @discussion This section includes the necessary headers for the Foundation framework, UIKit, Core Graphics,
 *  standard input/output, standard library, memory management, mathematical functions,
 *  Boolean type, floating-point limits, and string functions. These libraries support
 *  image processing, UI interaction, and basic C operations essential for the application.
 */

#include "macOS/dyld_cache_map_parser.h"
#include <iostream>
#include <fstream>
#include <regex>
#include <map>
#include <vector>
#include <stdexcept>
#include <utility>
#include <chrono>
#include <sstream> // For std::ostringstream
#include <iomanip>
#include "common.h"

struct Module {
    std::string name;
    uint64_t start, end;
    Module(std::string n, uint64_t s, uint64_t e) : name(std::move(n)), start(s), end(e) {}
};

static bool is_page_aligned(uint64_t addr, uint64_t page_size = 0x4000) {
    return !(addr & (page_size - 1));
}

std::string find_dyld_map() {
    std::cout << "Entering find_dyld_map" << std::endl;

    std::string name = "/System/Library/dyld/dyld_shared_cache_arm64e.map";
    std::string cryptexPrefixes[] = {
        "/System/Volumes/Preboot/Cryptexes/OS",
        "/private/preboot/Cryptexes/OS",
        "/System/Cryptexes/OS"
    };

    for (const auto& prefix : cryptexPrefixes) {
        std::string fullPath = prefix + name;
        std::ifstream stream(fullPath);
        if (stream) {
            std::cout << "Found dyld_shared_cache at: " << fullPath << std::endl;
            stream.close(); // Ensure the stream is closed after checking
            return fullPath;
        }
    }

    std::cerr << "Unable to locate dyld_shared_cache\n";
    throw std::runtime_error("Failed to locate dyld_shared_cache");
}

std::map<std::string, std::vector<std::string>> parse_dyld_map_file(const std::string &path) {
    auto start_time = std::chrono::high_resolution_clock::now();
    std::cout << "Starting parsing of dyld map file: " << path << std::endl;
    
    std::ifstream cache_map(path);
    if (!cache_map.is_open()) {
        std::cerr << "Unable to open file: " << path << std::endl;
        throw std::runtime_error("Failed to open file: " + path);
    }
    
    const std::regex pattern(
        // Match __TEXT segments with hexadecimal addresses
        "__TEXT 0x([A-F0-9]+) -> 0x([A-F0-9]+)"
        // Match various segment types with addresses
        "|(__SHARED_CACHE|__FONT_DATA|__CTF|__GLSLBUILTINS|__INFO_FILTER)\\s+0x[A-Fa-f0-9]+\\s+->\\s+0x[A-Fa-f0-9]+"
        // Match mapping lines with memory type, size, and addresses
        "|(mapping\\s+(EX|RW|RO)\\s+\\d+MB\\s+0x[A-Fa-f0-9]+\\s+->\\s+0x[A-Fa-f0-9]+)",
        std::regex_constants::ECMAScript | std::regex_constants::optimize
    );
    
//    const std::regex pattern(
//                                "(^/System/Library/(Frameworks|PrivateFrameworks)/([^/]+/)*[^/]+\\.framework"
//                                "(/Versions/[^/]+(/([^/]+/)*[^/]+)?)?$)"
//                                "|(^/usr/lib/(swift/)?[^/]+\\.dylib$)"
//                                "|(^/usr/lib/dyld$)"
//                                "|(^/usr/lib/system/[^/]+\\.dylib$)"
//                                "|(^\\s*(__TEXT|__DATA_CONST|__AUTH_CONST|__DATA|__LINKEDIT|__AUTH|__DATA_DIRTY"
//                                "|__SHARED_CACHE|__FONT_DATA|__CTF|__GLSLBUILTINS|__INFO_FILTER)\\s+0x[A-Fa-f0-9]+\\s+->\\s+0x[A-Fa-f0-9]+\\s*$)"
//                                "|(^mapping\\s+(EX|RW|RO)\\s+\\d+MB\\s+0x[A-Fa-f0-9]+\\s+->\\s+0x[A-Fa-f0-9]+$)",
//                                std::regex_constants::ECMAScript | std::regex_constants::optimize
//                                );

    
    std::cout << "Using precompiled regex pattern for parsing." << std::endl;
    
    std::string line;
    std::map<std::string, std::vector<std::string>> result;
    std::map<uint64_t, Module> tmp_result;
    std::smatch m;
    
    bool lib = false;
    std::string lib_name;
    while (std::getline(cache_map, line)) {
        //        std::cout << "Reading line: " << line << std::endl; // Log every line being read for clarity
        
        // Skip empty lines and print a message for them
        if (line.empty()) {
            //            std::cout << "Skipped empty line" << std::endl;
            continue;
        }
        
        if (line[0] == '/') { // Check if line starts with '/', indicating a library/framework
            lib = true;
            lib_name = line.substr(line.find_last_of('/') + 1);
            //            std::cout << "Processing library/framework: " << lib_name << std::endl;
            continue; // Move to the next line after setting the library name
        } else if (lib && std::regex_search(line, m, pattern)) { // Match segment and address lines within a library context
            //            std::cout << "Matched line: " << line << std::endl;
            try {
                uint64_t start = std::stoull(m.str(1), nullptr, 16); // Assuming the start address is captured
                uint64_t end = std::stoull(m.str(2), nullptr, 16); // Assuming the end address is captured
                if (start < end) {
                    // Inserting the parsed module into the temporary result map
                    tmp_result.insert({start, Module(lib_name, start, end)});
                    //                    std::cout << "Added module: " << lib_name << " [" << std::hex << start << ", " << end << "]" << std::endl;
                } else {
                    std::cout << "Unmatched line: " << line << std::endl;
                    std::cerr << "Invalid address range: " << line << std::endl;
                }
            } catch (const std::exception& e) {
                std::cerr << "Error processing line: " << line << " | Exception: " << e.what() << std::endl;
            }
        } else {
            //            std::cerr << "Unprocessed line: " << line << std::endl; // Log lines that do not match the pattern or are outside a library context
        }
    }
    
    if (tmp_result.empty()) {
        std::cerr << "ERROR: No modules were parsed from the file, resulting in an empty module group." << std::endl;
    } else {
        std::cout << "Organizing and populating result map." << std::endl;
        
        // Iterate over the temporary results to populate the final result map
        for (const auto& entry : tmp_result) {
            const auto& moduleName = entry.second.name;
            std::vector<std::string> associatedModules;
            
            // Example logic: Add itself and check for additional associations
            associatedModules.push_back(moduleName);
            
            // For simplicity, this example just adds the module to its own association list.
            // Here, you can implement logic to find and add other associated modules based on your criteria.
            
            result[moduleName] = associatedModules;
        }
        
        // Optional: Print the result for debugging
        //        for (const auto& entry : result) {
        //            std::cout << "Module: " << entry.first << " is associated with [ ";
        //            for (const auto& name : entry.second) {
        //                std::cout << name << " ";
        //            }
        //            std::cout << "]" << std::endl;
        //        }
        //    }
        
        auto end_time = std::chrono::high_resolution_clock::now();
        std::chrono::duration<double, std::milli> elapsed = end_time - start_time;
        std::cout << "Completed parsing in " << elapsed.count() << " ms." << std::endl;
        
        return result;
    }
}
