# build.mk for iOS/macOS Application Development

# Project Path Configuration
export PROJECT_PATH ?= $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

# Toolchain and SDK Settings
export TOOLCHAIN ?= iOS17.0
export MACOS_TOOLCHAIN ?= MacOSX14.0

# Architecture and SDK Configuration
export ARCH ?= arm64  # Adjust this to your target architecture
export SDK ?= iphoneos

# Define tools and flags
CC = clang
XCRUN = xcrun -sdk iphoneos
CFLAGS = -arch $(ARCH) -g
CODESIGN = codesign
DEVELOPER_ID = "79744B7FFC78720777469A82065993CA962BC8E8"
ENTITLEMENTS = entitlements.xml

# Targets
RUNNER_TARGET = runner
RUNNER_SRC = runner.c
RUNNER_DIST_TARGET = runner_dist
RUNNER_DIST_SRC = runner_dist.c
INTERPOSE_TARGET = interpose.dylib
INTERPOSE_SRC = interpose.c
MAIN_TARGET = main.app/main
MAIN_SRC = main.c
APP_DIR = main.app
INTERPOSE_DIST_TARGET := interpose_dist.dylib
INTERPOSE_DIST_SRC := interpose_dist.c
