# How To: cmake -G "Xcode" to make an Xcode Project
# Specify the minimum required version of CMake
cmake_minimum_required(VERSION 3.10)

# Set the project name and version
project(baseline-ballistic-fuzzing-sample-001 VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Find the required package
find_package(ImageMagick COMPONENTS Magick++ REQUIRED)

# Add executable and link libraries
add_executable(baseline-ballistic-fuzzing-sample-001 baseline-ballistic-fuzzing-sample-001.cpp)
target_include_directories(baseline-ballistic-fuzzing-sample-001 PRIVATE ${ImageMagick_INCLUDE_DIRS})
target_link_libraries(baseline-ballistic-fuzzing-sample-001 ${ImageMagick_LIBRARIES})

# Link necessary compiler flags
execute_process(COMMAND Magick++-config --cppflags OUTPUT_VARIABLE MAGICK_CPPFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
set_target_properties(baseline-ballistic-fuzzing-sample-001 PROPERTIES COMPILE_FLAGS ${MAGICK_CPPFLAGS})

execute_process(COMMAND Magick++-config --cxxflags OUTPUT_VARIABLE MAGICK_CXXFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
set_target_properties(baseline-ballistic-fuzzing-sample-001 PROPERTIES COMPILE_FLAGS ${MAGICK_CXXFLAGS})

execute_process(COMMAND Magick++-config --ldflags OUTPUT_VARIABLE MAGICK_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
set_target_properties(baseline-ballistic-fuzzing-sample-001 PROPERTIES LINK_FLAGS ${MAGICK_LDFLAGS})

execute_process(COMMAND Magick++-config --libs OUTPUT_VARIABLE MAGICK_LIBS OUTPUT_STRIP_TRAILING_WHITESPACE)
set_target_properties(baseline-ballistic-fuzzing-sample-001 PROPERTIES LINK_FLAGS ${MAGICK_LIBS})

