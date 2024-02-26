// Modified by @h02332 David Hoyt to aid in Debugging in Jackalope
// Modified instrumentation.cpp for Live Debugging Mode Implementation
// Should be used with your Stub Programs in CMakeLists.txt until Stable
// Ninja Mode with bleeded edge code

#include "instrumentation.h"
#include <csignal>
#include <execinfo.h> // Include for backtrace functionality
#include <cstdlib> // For free()
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

    if (!strcmp(buf, "(nil)")) {
        std::cerr << "[" << __TIME__ << "] AnonymizeAddress: Address is nil" << std::endl;
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

    assert(firstnonzero < len); // Sanity check

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

void Instrumentation::SignalHandler(int signal) {
    std::cout << "Caught signal " << signal << "\n";
    switch(signal) {
        case SIGINT:
            LogDebug("Interrupt signal received.", 1);
            break;
        case SIGSEGV:
#ifdef __GNUC__
            void* callstack[128];
            size_t frames = backtrace(callstack, 128);
            char** strs = backtrace_symbols(callstack, static_cast<int>(frames));
            LogDebug("Segmentation fault. Generating stack trace...", 1);
            for (size_t i = 0; i < frames; ++i) {
                debugLogFile << strs[i] << std::endl;
            }
            free(strs);
#else
            LogDebug("Segmentation fault. Stack trace not available.", 1);
#endif
            break;
        // Additional cases as necessary
    }
    debugMode = true;
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

