# Example Makefile structure

include logging.mk
include build.mk

CC := clang
CFLAGS := -fprofile-instr-generate -fcoverage-mapping -mllvm -runtime-counter-relocation -g -fsanitize=undefined -O0
TARGET := sprr
SRC := sprr.c

all: build

build: check_tools
        @echo "Compiling $(TARGET)..."
        $(CC) $(CFLAGS) -o $(TARGET) $(SRC)
        @echo "Build complete."

test: build
        @echo "Running $(TARGET)..."
        ./$(TARGET)
        @echo "Test run complete."

check_tools:
        @which clang > /dev/null || { echo "clang not found"; exit 1; }
        @which xcrun > /dev/null || { echo "xcrun not found"; exit 1; }

clean:
        @echo "Cleaning up..."
        rm -f $(TARGET)
        @echo "Clean complete."

.PHONY: all build test check_tools clean
