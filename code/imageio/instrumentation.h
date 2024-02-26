// Modified by @h02332 David Hoyt to aid in Debugging in Jackalope
// Modified instrumentation.h for Live Debugging Mode Implementation
// Should be used with your Stub Programs in CMakeLists.txt until Stable
// Ninja Mode with bleeded edge code

#pragma once

#include <inttypes.h>
#include <string>
#include <iostream>
#include <sstream>
#include <signal.h>
#include <fstream>  // For std::ofstream
#include "coverage.h"
#include "runresult.h"

class Instrumentation {
public:
    virtual ~Instrumentation() {}

    virtual void Init(int argc, char **argv) = 0;
    virtual RunResult Run(int argc, char **argv, uint32_t init_timeout, uint32_t timeout) = 0;
    virtual RunResult RunWithCrashAnalysis(int argc, char** argv, uint32_t init_timeout, uint32_t timeout) {
        return Run(argc, argv, init_timeout, timeout);
    }
    virtual void CleanTarget() = 0;
    virtual bool HasNewCoverage() = 0;
    virtual void GetCoverage(Coverage &coverage, bool clear_coverage) = 0;
    virtual void ClearCoverage() = 0;
    virtual void IgnoreCoverage(Coverage &coverage) = 0;
    virtual std::string GetCrashName() { return "crash"; }
    virtual uint64_t GetReturnValue() { return 0; }
    std::string AnonymizeAddress(void* addr);

    // Debugging aids
    static void DebugBreakpoint(const std::string& message);
    static void SignalHandler(int signal);
    static void SetupDebugMode();
    static void LogDebug(const std::string& message, int level = 1);
    static int verbosityLevel; // Controls the verbosity of the debug output

private:
    // Flag to control debug mode
    static bool debugMode;
    static std::ofstream debugLogFile; // Log file for debug output
};
