# Makefile for iOS/macOS Application Development

# Set VERBOSE=1 on the command line for more verbosity
export VERBOSE ?= 1

# Include additional Makefiles
include videotoolbox_logging.mk
include videotoolbox_build.mk

# Default target
all: runner runner_dist main.app interpose.dylib interpose_dist.dylib videotoolbox_runner test

# Ensure build directory exists
ensure_build_dir:
	@$(call log_build, "Ensuring build directory exists")
	mkdir -p build

# Build runner
runner: runner.c ensure_build_dir
	@$(call log_build, "Starting build for runner")
	clang -isysroot $(shell xcrun --sdk macosx --show-sdk-path) -o runner runner.c
	codesign -s $(DEVELOPER_ID) --entitlements $(ENTITLEMENTS) --force runner
	@$(call log_info, "Runner build completed")

# Build runner_dist
runner_dist: runner_dist.c ensure_build_dir
	@$(call log_build, "Starting build for runner_dist")
	clang -isysroot $(shell xcrun --sdk macosx --show-sdk-path) -o runner_dist runner_dist.c
	codesign -s $(DEVELOPER_ID) --entitlements $(ENTITLEMENTS) --force runner_dist
	@$(call log_info, "Runner_dist build completed")

# Build main and create app bundle
main.app: main.c interpose.dylib
	@$(call log_build, "Starting build for main.app")
	xcrun -sdk iphoneos clang -arch arm64 -g -o main main.c interpose.dylib
	@$(call log, "Creating main.app...")
	mkdir -p main.app
	cp Info.plist main.app/
	mv main main.app/
	@$(call log, "Created main.app... Codesigning....")
	codesign -s $(DEVELOPER_ID) --entitlements $(ENTITLEMENTS) --force main.app
	@$(call log_info, "Main.app build and packaging completed")

# Build interpose.dylib
interpose.dylib: interpose.c
	@$(call log_build, "Starting build for interpose.dylib")
	xcrun -sdk iphoneos clang -arch arm64 -g -shared -o interpose.dylib interpose.c
	@$(call log_info, "Interpose.dylib build completed")

# Build interpose_dist.dylib
interpose_dist.dylib: interpose_dist.c
	@$(call log_build, "Starting build for interpose_dist.dylib")
	xcrun -sdk iphoneos clang -arch arm64 -g -shared -o interpose_dist.dylib interpose_dist.c
	@$(call log_info, "Interpose_dist.dylib build completed")

# Build and package videotoolbox-runner
videotoolbox_runner: clean_videotoolbox_runner
	@$(call log_build, "Starting build for videotoolbox-interposer.dylib macOS")
	xcrun -sdk macosx clang -arch arm64 -g videotoolbox-interposer.c -o videotoolbox-interposer.dylib -dynamiclib -framework IOKit -framework CoreFoundation -framework CoreMedia -framework CoreVideo -framework VideoToolbox -lz
	@$(call log_info, "videotoolbox-interposer.dylib macOS build completed")

	@$(call log_build, "Starting build for videotoolbox-runner macOS")
	xcrun -sdk macosx clang -arch arm64 -g -o videotoolbox-runner videotoolbox-runner.m videotoolbox-interposer.dylib -framework VideoToolbox -framework Foundation -framework AVFoundation -framework VideoToolbox -framework CoreFoundation -framework CoreMedia -framework CoreVideo -lz
	@$(call log_info, "videotoolbox-runner macOS build completed")

	@$(call log_build, "Starting build for videotoolbox-interposer-arm64e.dylib iOS")
	xcrun -sdk iphoneos clang -arch arm64e -g videotoolbox-interposer.c -o videotoolbox-interposer-arm64e.dylib -dynamiclib -framework IOKit -framework CoreFoundation -framework CoreMedia -framework CoreVideo -framework VideoToolbox -lz
	@$(call log_info, "videotoolbox-interposer-arm64e.dylib iOS build completed")

	@$(call log_build, "Starting build for videotoolbox-runner.app iOS")
	mkdir -p videotoolbox-runner.app
	xcrun -sdk iphoneos clang -arch arm64e -g -o videotoolbox-runner.app/videotoolbox-runner videotoolbox-runner.m videotoolbox-interposer-arm64e.dylib -framework Foundation -framework AVFoundation -framework VideoToolbox -framework CoreFoundation -framework CoreMedia -framework CoreVideo -lz
	@$(call log_info, "videotoolbox-runner iOS build completed")

	@$(call log, "Packaging videotoolbox-runner.app")
	cp Info.plist big.mov videotoolbox-runner.app
	codesign -s "$(DEVELOPER_ID)" --entitlements $(ENTITLEMENTS) --force videotoolbox-runner.app
	@$(call log_info, "videotoolbox-runner.app packaged and signed")

	@$(call log_info, "Run the Fuzzer Manually... ./runner ./videotoolbox-runner.app/videotoolbox-runner videotoolbox-runner.app/big.mov")
#	./runner ./videotoolbox-runner.app/videotoolbox-runner videotoolbox-runner.app/big.mov

# Additional targets for debug builds
runner_debug: runner.c
	@$(call log_build, "Starting debug build for runner")
	clang -isysroot $(shell xcrun --sdk macosx --show-sdk-path) -g -o runner_debug runner.c
	codesign -s $(DEVELOPER_ID) --entitlements $(ENTITLEMENTS) --force runner_debug
	@$(call log_info, "Runner debug build completed")

runner_dist_debug: runner_dist.c
	@$(call log_build, "Starting debug build for runner_dist")
	clang -isysroot $(shell xcrun --sdk macosx --show-sdk-path) -g -o runner_dist_debug runner_dist.c
	codesign -s $(DEVELOPER_ID) --entitlements $(ENTITLEMENTS) --force runner_dist_debug
	@$(call log_info, "Runner_dist debug build completed")

# Testing targets
test: test_runner test_runner_dist test_main_app

test_runner: runner
	@$(call log_info, "Testing runner...")
	./runner main.app/main

test_runner_dist: runner_dist
	@$(call log_info, "Testing runner_dist...")
	./runner_dist main.app/main

test_main_app: main.app
	@$(call log_info, "All Done.. Run Fuzzer... ./runner ./videotoolbox-runner.app/videotoolbox-runner videotoolbox-runner.app/big.mov and DYLD_INSERT_LIBRARIES=./videotoolbox-interposer.dylib ./videotoolbox-runner big.mov .. try A/B Testing with lldb .. watch the GPU logging...  ")
#	./main.app/main

# Clean targets
clean: clean_runner clean_runner_dist clean_main_app clean_interpose clean_interpose_dist clean_videotoolbox_runner

clean_runner:
	@$(call log_clean, "Cleaning runner")
	rm -rf runner
	@$(call log_info, "Runner cleaned")

clean_runner_dist:
	@$(call log_clean, "Cleaning runner_dist")
	rm -rf runner_dist
	@$(call log_info, "Runner_dist cleaned")

clean_main_app:
	@$(call log_clean, "Cleaning main.app")
	rm -rf main.app
	@$(call log_info, "Main.app cleaned")

clean_interpose:
	@$(call log_clean, "Cleaning interpose.dylib")
	rm -rf interpose.dylib
	@$(call log_info, "Interpose.dylib cleaned")

clean_interpose_dist:
	@$(call log_clean, "Cleaning interpose_dist.dylib")
	rm -rf interpose_dist.dylib
	@$(call log_info, "Interpose_dist.dylib cleaned")

clean_videotoolbox_runner:
	@$(call log_clean, "Cleaning videotoolbox-runner")
	rm -rf videotoolbox-runner.app videotoolbox-runner.dSYM videotoolbox-runner
	@$(call log_info, "videotoolbox-runner cleaned")
