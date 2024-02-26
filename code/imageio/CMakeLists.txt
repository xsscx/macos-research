cmake_minimum_required(VERSION "3.1")
set (CMAKE_CXX_STANDARD 17)

if (APPLE)

  add_executable(test_imageio
    imageio.m
  )

  target_link_libraries(test_imageio
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )
  
  add_executable(imageio-test-002_imageio
    imageio-test-002.m
  )

  target_link_libraries(imageio-test-002_imageio
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )

  add_executable(imageio-test-003_imageio
    imageio-test-003.m
  )

  target_link_libraries(imageio-test-003_imageio
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )

  add_executable(imageio-test-004_imageio
    imageio-test-004.m
  )

  target_link_libraries(imageio-test-004_imageio
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )

  add_executable(imageio-test-005_imageio
    imageio-test-005.m
  )

  target_link_libraries(imageio-test-005_imageio
    "-framework ImageIO"
    "-framework AppKit"
    "-framework CoreGraphics"
  )

endif()
