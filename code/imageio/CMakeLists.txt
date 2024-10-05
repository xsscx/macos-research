cmake_minimum_required(VERSION "3.1")
set(CMAKE_CXX_STANDARD 17)

if(APPLE)
  # Include directories for libpng installed via Homebrew
  include_directories(/opt/homebrew/include)
  
  # Find the libpng library
  find_library(PNG_LIBRARY NAMES png PATHS /opt/homebrew/lib NO_DEFAULT_PATH)

  # Define your executables and link them against required frameworks and libpng

  add_executable(test_imageio imageio.m)
  target_link_libraries(test_imageio
#    "${PNG_LIBRARY}"
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )

  add_executable(imageio-test-002_imageio imageio-test-002.m)
  target_link_libraries(imageio-test-002_imageio
#    "${PNG_LIBRARY}"
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )

  add_executable(imageio-test-003_imageio imageio-test-003.m)
  target_link_libraries(imageio-test-003_imageio
#    "${PNG_LIBRARY}"
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )

  add_executable(imageio-test-004_imageio imageio-test-004.m)
  target_link_libraries(imageio-test-004_imageio
    "${PNG_LIBRARY}"
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )

  add_executable(imageio-test-005_imageio imageio-test-005.m)
  target_link_libraries(imageio-test-005_imageio
#    "${PNG_LIBRARY}"
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )

  add_executable(imageio-test-006_imageio imageio-test-006.m)
  target_link_libraries(imageio-test-006_imageio
#    "${PNG_LIBRARY}"
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )

endif()
