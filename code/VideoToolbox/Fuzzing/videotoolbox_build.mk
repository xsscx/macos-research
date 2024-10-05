# 100b.mk for iOS/macOS Application Development

# Project Path Configuration
export PROJECT_PATH ?= $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
export BUILD_DIR ?= build
export IOS_APP_BUNDLE ?= $(BUILD_DIR)/videotoolbox-runner.app

# Toolchain and SDK Settings
export TOOLCHAIN ?= iOS17.0
export MACOS_TOOLCHAIN ?= macosx
export MACOS_SDK ?= MacOSX14.0.sdk

# Architecture and SDK Configuration
export ARCH ?= arm64e  # Adjust this to your target architecture
export SDK ?= iphoneos

# Define tools and flags
CC = clang
XCRUN = xcrun
CODESIGN = codesign
DEVELOPER_ID = "79744B7FFC78720777469A82065993CA962BC8E8"
ENTITLEMENTS = entitlements.xml
MFLAGS = -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/$(MACOS_SDK)

# Define variables
APP_NAME = videotoolbox-runner.app
RUNNER = videotoolbox-runner
RUNNER_IOS = videotoolbox-runner
DYLIB = videotoolbox-interposer.dylib
DYLIB_ARM64E = videotoolbox-interposer-arm64e.dylib
SRC = videotoolbox-runner.m
INTERPOSER_SRC = videotoolbox-interposer.c
PLIST = Info.plist
MOVIE = big.mov


