# Makefile for iOS/macOS Application Development

# Set VERBOSE=1 on the command line for more verbosity
export VERBOSE ?= 1

# Include additional Makefiles
include logging.mk
include build.mk

# Default target
all: $(RUNNER_TARGET) $(RUNNER_DIST_TARGET) $(MAIN_TARGET) $(INTERPOSE_TARGET) $(INTERPOSE_DIST_TARGET) test

# Build runner
$(RUNNER_TARGET): $(RUNNER_SRC)
	$(call log_build, "Starting build for runner")
	$(CC) $(MFLAGS) -o $(RUNNER_TARGET) $(RUNNER_SRC)
	$(CODESIGN) -s $(DEVELOPER_ID) --entitlements $(ENTITLEMENTS) --force $(RUNNER_TARGET)
	$(call log_info, "Runner build completed")

# Build runner_dist
$(RUNNER_DIST_TARGET): $(RUNNER_DIST_SRC)
	$(call log_build, "Starting build for runner_dist")
	$(CC) $(MFLAGS) -o $(RUNNER_DIST_TARGET) $(RUNNER_DIST_SRC)
	$(CODESIGN) -s $(DEVELOPER_ID) --entitlements $(ENTITLEMENTS) --force $(RUNNER_DIST_TARGET)
	$(call log_info, "Runner_dist build completed")

# Build main and create app bundle
$(MAIN_TARGET): $(MAIN_SRC) $(INTERPOSE_TARGET)
	$(call log_build, "Starting build for main.app")
	$(XCRUN) $(CC) $(CFLAGS) -o main $(MAIN_SRC) $(INTERPOSE_TARGET)
	$(call log, "Creating main.app...")
	mkdir -p $(APP_DIR)
	cp Info.plist $(APP_DIR)/
	mv main $(APP_DIR)/
	$(call log, "Created main.app... Codesigning....")
	$(CODESIGN) -s $(DEVELOPER_ID) --entitlements $(ENTITLEMENTS) --force $(APP_DIR)
	$(call log_info, "Main.app build and packaging completed")

# Build interpose.dylib
$(INTERPOSE_TARGET): $(INTERPOSE_SRC)
	$(call log_build, "Starting build for interpose.dylib")
	$(XCRUN) $(CC) $(CFLAGS) -shared -o $(INTERPOSE_TARGET) $(INTERPOSE_SRC)
	$(call log_info, "Interpose.dylib build completed")

# Build interpose_dist.dylib
$(INTERPOSE_DIST_TARGET): $(INTERPOSE_DIST_SRC)
	$(call log_build, "Starting build for interpose_dist.dylib")
	$(XCRUN) $(CC) $(CFLAGS) -shared -o $(INTERPOSE_DIST_TARGET) $(INTERPOSE_DIST_SRC)
	$(call log_info, "Interpose_dist.dylib build completed")

# Testing targets
test: test_runner test_runner_dist

test_runner: $(RUNNER_TARGET) $(MAIN_TARGET)
	$(call log_info, "Testing runner...")
	./$(RUNNER_TARGET) $(APP_DIR)/main
	$(call log_info, "Runner test completed")

test_runner_dist: $(RUNNER_DIST_TARGET) $(MAIN_TARGET)
	$(call log_info, "Testing runner_dist...")
	./$(RUNNER_DIST_TARGET) $(APP_DIR)/main
	$(call log_info, "Runner_dist test completed")

# Clean up build artifacts
clean:
	$(call log_clean, "Starting clean up")
	rm -rf $(RUNNER_TARGET) $(RUNNER_DIST_TARGET) $(INTERPOSE_TARGET) $(INTERPOSE_DIST_TARGET) $(APP_DIR)
	$(call log_info, "Clean up completed")

.PHONY: all clean test test_runner test_runner_dist
