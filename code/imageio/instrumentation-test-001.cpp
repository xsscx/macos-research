/**
 *  @file instrumentation.cpp
 *  @brief Changes for debugmode() to instrumentation.h
 *  @author @h02332 | David Hoyt
 *  @date 03 MAR 2024
 *  @version 1.0.4
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
 *  - 05/MAR/2024, h02332: Initial commit.
 *
 *  @section TODO
 *  - Add more logging and context
 */
#include <csignal>
#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <fstream>
#include <sstream>
#include <chrono>
#include <cassert>
#include <cstring> // For strcmp and strlen
#include <execinfo.h> // For backtrace functionality on Unix-like systems

#include "instrumentation.h"
#include "common.h"

// Definitions (Consider the necessity and placement of this definition, especially if compiling on non-Windows platforms)
#define _CRT_SECURE_NO_WARNINGS

bool Instrumentation::debugMode = false;
int Instrumentation::verbosityLevel = 1;
std::ofstream Instrumentation::debugLogFile("fuzzer_debug_log.txt", std::ios::app);

std::string Instrumentation::AnonymizeAddress(void* addr) {
    char buf[20];
    snprintf(buf, sizeof(buf), "%p", addr);

    // Simplified check for nullptr or entirely zeros
    std::string addrStr(buf);
    if (addrStr == "(nil)" || addrStr.find_first_not_of("0x0") == std::string::npos) {
        LogDebug("AnonymizeAddress: Address is nil or zero", 1);
        return "0";
    }

    // Find first non-zero character after "0x" if present
    size_t addr_start = addrStr.find_first_not_of('0', addrStr.find("0x") != std::string::npos ? 2 : 0);
    if (addr_start == std::string::npos) {
        LogDebug("AnonymizeAddress: No non-zero character found in address. Address: " + addrStr, 1);
        return addrStr;
    }

    // Proceed with anonymization for the rest of the address
    std::fill(addrStr.begin() + addr_start, addrStr.end() - 3, 'x');
    LogDebug("AnonymizeAddress: Original: " + std::string(buf) + ", Anonymized: " + addrStr, 1);

    return addrStr;
}

void Instrumentation::DebugBreakpoint(const std::string& message) {
    if (debugMode) {
        std::cerr << "[DEBUG BREAK] " << message << "\n";
        std::cerr << "Press enter to continue...\n";
        std::cin.get();
    }
}

void Instrumentation::SignalHandler(int signal) {
    LogDebug("Caught signal " + std::to_string(signal), 1);
    switch(signal) {
        case SIGINT:
            LogDebug("Interrupt signal (SIGINT) received. Exiting.", 1);
            exit(EXIT_FAILURE);
            break;
        case SIGSEGV:
#ifdef __GNUC__
            void* callstack[128];
            size_t frames = backtrace(callstack, 128);
            char** strs = backtrace_symbols(callstack, frames);
            LogDebug("Segmentation fault. Generating stack trace...", 1);
            for (size_t i = 0; i < frames; ++i) {
                debugLogFile << strs[i] << std::endl;
            }
            free(strs);
#else
            LogDebug("Segmentation fault. Stack trace not available.", 1);
#endif
            exit(EXIT_FAILURE);
            break;
        // Consider handling other signals as necessary
    }
    debugMode = true; // Changing global state here; be aware of potential issues
}

void Instrumentation::SetupDebugMode() {
    std::signal(SIGINT, SignalHandler);
    std::signal(SIGSEGV, SignalHandler); // Catch segmentation faults
    debugMode = true;
}

void Instrumentation::LogDebug(const std::string& message, int level) {
    if (debugMode && level <= verbosityLevel) {
        auto now = std::chrono::system_clock::now();
        auto now_time_t = std::chrono::system_clock::to_time_t(now);
        char buffer[80];
        std::strftime(buffer, sizeof(buffer), "%Y-%m-%d %H:%M:%S", std::localtime(&now_time_t));
        debugLogFile << "{ \"time\": \"" << buffer
                     << "\", \"level\": " << level
                     << ", \"message\": \"" << message << "\" }\n";
        debugLogFile.flush(); // Ensure immediate writing to the file
    }
}
