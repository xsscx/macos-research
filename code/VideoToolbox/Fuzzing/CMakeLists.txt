cmake_minimum_required(VERSION 3.15)
project(videotoolbox)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_STANDARD 11)

# Set the output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/build)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/build)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/build)

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/include)

# Define the source files
set(RUNNER_SOURCES ${CMAKE_SOURCE_DIR}/runner.c)
set(RUNNER_DIST_SOURCES ${CMAKE_SOURCE_DIR}/runner_dist.c)
set(MAIN_SOURCES ${CMAKE_SOURCE_DIR}/main.c)
set(INTERPOSE_SOURCES ${CMAKE_SOURCE_DIR}/interpose.c)
set(INTERPOSE_DIST_SOURCES ${CMAKE_SOURCE_DIR}/interpose_dist.c)

# Set SDK and toolchain
set(IOS_SDK iphoneos)
set(MACOS_SDK macosx)
set(ARCH arm64)

# Define developer ID and entitlements file
set(DEVELOPER_ID "79744B7FFC78720777469A82065993CA962BC8E8")
set(ENTITLEMENTS ${CMAKE_SOURCE_DIR}/entitlements.xml)

# Helper function for signing
function(codesign_target target)
    add_custom_command(TARGET ${target}
                       POST_BUILD
                       COMMAND codesign -s ${DEVELOPER_ID} --entitlements ${ENTITLEMENTS} --force $<TARGET_FILE:${target}>
                       COMMENT "Code signing ${target}")
endfunction()

# Obtain the SDK path
execute_process(COMMAND xcrun --sdk ${MACOS_SDK} --show-sdk-path OUTPUT_VARIABLE MACOS_SDK_PATH OUTPUT_STRIP_TRAILING_WHITESPACE)

# Find necessary libraries
find_library(IOKIT_LIB IOKit REQUIRED)
find_library(COREFOUNDATION_LIB CoreFoundation REQUIRED)

# Build runner
add_executable(runner ${RUNNER_SOURCES})
target_compile_options(runner PRIVATE -isysroot ${MACOS_SDK_PATH})
codesign_target(runner)

# Build runner_dist
add_executable(runner_dist ${RUNNER_DIST_SOURCES})
target_compile_options(runner_dist PRIVATE -isysroot ${MACOS_SDK_PATH})
codesign_target(runner_dist)

# Build main app
add_executable(main ${MAIN_SOURCES} ${INTERPOSE_SOURCES})
target_compile_options(main PRIVATE -arch ${ARCH} -g)
add_custom_command(TARGET main
                   POST_BUILD
                   COMMAND mkdir -p ${CMAKE_BINARY_DIR}/build/main.app
                   COMMAND cp ${CMAKE_SOURCE_DIR}/Info.plist ${CMAKE_BINARY_DIR}/build/main.app/
                   COMMAND mv $<TARGET_FILE:main> ${CMAKE_BINARY_DIR}/build/main.app/
                   COMMAND codesign -s ${DEVELOPER_ID} --entitlements ${ENTITLEMENTS} --force ${CMAKE_BINARY_DIR}/build/main.app
                   COMMENT "Building and packaging main.app")

# Build interpose.dylib
add_library(interpose SHARED ${INTERPOSE_SOURCES})
target_compile_options(interpose PRIVATE -arch ${ARCH} -g)
target_link_libraries(interpose PRIVATE ${IOKIT_LIB} ${COREFOUNDATION_LIB})
codesign_target(interpose)

# Build interpose_dist.dylib
add_library(interpose_dist SHARED ${INTERPOSE_DIST_SOURCES})
target_compile_options(interpose_dist PRIVATE -arch ${ARCH} -g)
target_link_libraries(interpose_dist PRIVATE ${IOKIT_LIB} ${COREFOUNDATION_LIB})
codesign_target(interpose_dist)
