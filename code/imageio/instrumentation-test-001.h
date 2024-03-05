/**
 *  @file instrumentation.h
 *  @brief Changes for debugmode() to instrumentation.h
 *  @author @h02332 | David Hoyt
 *  @date 03 MAR 2024
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
 *  @section CHANGES
 *  - 05/MAR/2024, h02332: Initial commit.
 *
 *  @section TODO
 *  - Add more logging and context
 */

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
