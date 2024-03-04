// Modified by @h02332 David Hoyt to aid in Debugging in Jackalope
// Modified instrumentation.h for Live Debugging Mode Implementation
// Should be used with your Stub Programs in CMakeLists.txt until Stable
// Ninja Mode with bleeded edge code

#include "instrumentation.h"
#include <csignal>
#include <execinfo.h> // Include for backtrace functionality
#include <unistd.h> // for getpid()
#include <cstdlib> // for system()
#include <cstdio> // for snprintf()
#include <fstream>
#include <iostream>
#include <chrono>
#include <cassert>

bool Instrumentation::debugMode = true;
int Instrumentation::verbosityLevel = 1; // Ensure this matches the declaration in instrumentation.h
std::ofstream Instrumentation::debugLogFile("fuzzer_debug_log.txt", std::ios::app);

std::string Instrumentation::AnonymizeAddress(void* addr) {
    char buf[20];
    snprintf(buf, sizeof(buf), "%p", addr);

    // Check if address is nullptr or entirely zeros
    if (!strcmp(buf, "(nil)") || !strspn(buf, "0x0")) {
        std::cerr << "[" << __TIME__ << "] AnonymizeAddress: Address is nil or zero" << std::endl;
        return std::string("0");
    }

    int addr_start = (buf[0] == '0' && (buf[1] == 'x' || buf[1] == 'X')) ? 2 : 0;
    int len = static_cast<int>(strlen(buf));
    int firstnonzero = len;
    for (int i = addr_start; i < len; i++) {
        if (buf[i] != '0') {
            firstnonzero = i;
            break;
        }
    }

    // If no non-zero character was found, return the address as-is but log the unusual situation
    if (firstnonzero == len) {
        std::cerr << "[" << __TIME__ << "] AnonymizeAddress: No non-zero character found in address. Address: " << addr << std::endl;
        return std::string(buf); // Return the original address string
    }

    // Proceed with anonymization for the rest of the address
    for (int i = firstnonzero; i < len - 3; i++) {
        buf[i] = 'x';
    }

    std::string anonymizedAddr(buf);
    std::cerr << "[" << __TIME__ << "] AnonymizeAddress: Original: " << addr
              << ", Anonymized: " << anonymizedAddr << std::endl;
    return anonymizedAddr;
}

void Instrumentation::DebugBreakpoint(const std::string& message) {
    if (debugMode) {
        std::cout << "[DEBUG BREAK] " << message << "\n";
        std::cout << "Press enter to continue...\n";
        std::cin.get();
    }
}

#include <signal.h> // For signal constants
#include <stdlib.h> // For exit()
#include <unistd.h> // For getpid()
#include <stdio.h>  // For snprintf()
#include <iostream> // For std::cout
#include <fstream>  // For std::ofstream

// Assuming other necessary includes and namespace declarations are already in place

void Instrumentation::SignalHandler(int signal) {
    std::cout << "Caught signal " << signal << "\n";
    switch(signal) {
        case SIGINT: {
            LogDebug("Interrupt signal (SIGINT) received. Program will exit.", 1);
            // Optionally, perform any cleanup here
            
            // Exit the program or take other appropriate action
            // For immediate program termination, consider using _exit() if cleanup isn't needed
            exit(EXIT_FAILURE); // Use std::exit() for invoking global destructors, if necessary
            break;
        }
        case SIGSEGV: {
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
            // Consider whether to terminate the program or attempt recovery
            exit(EXIT_FAILURE); // or _exit(EXIT_FAILURE) for immediate termination
            break;
        }
        // Handle other signals as necessary
    }
    debugMode = true; // Consider the implications of changing global state within a signal handler
}

void Instrumentation::SetupDebugMode() {
    std::signal(SIGINT, SignalHandler);
    std::signal(SIGSEGV, SignalHandler); // Setup to catch segmentation faults
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
        debugLogFile.flush(); // Ensure the message is immediately written to the file
    }
}
