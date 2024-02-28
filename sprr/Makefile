# Makefile for compiling sprr.c with debugging aids, including a test run target.

# Include the logging and build configurations
include logging.mk
include build.mk

# Compiler configuration
CC = clang
CFLAGS = -fprofile-instr-generate -fcoverage-mapping -mllvm -runtime-counter-relocation -g -fsanitize=undefined -O0

# Target binary name
TARGET = sprr

# Source file
SRC = sprr.c

# Default target
all: build

# Compile the program with specified CFLAGS
build: check_tools
    $(call log_build, "Compiling $(TARGET)...")
    $(CC) $(CFLAGS) -o $(TARGET) $(SRC)
    $(call log_info, "Build complete.")

# Run the compiled program
test: build
    $(call log_info, "Running $(TARGET)...")
    ./$(TARGET)
    $(call log_info, "Test run complete.")

# Check for required tools
check_tools:
    $(call check_path, clang)
    $(call check_path, xcrun)

# Clean the build
clean:
    $(call log_clean, "Cleaning up...")
    rm -f $(TARGET)
    $(call log_info, "Clean complete.")

# Logging.mk content integration
# (Integrate logging.mk content here, as shown in the provided logging.mk snippet)

# Build.mk content integration
# (Since build.mk primarily defines variables and project path configuration,
# ensure to adjust paths and toolchain settings according to your environment)

.PHONY: all build test check_tools clean

