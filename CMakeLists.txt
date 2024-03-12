cmake_minimum_required(VERSION 3.24)
project(hello_window)

# Dependencies
include(FetchContent)

# Using the pattern of https://github.com/{username}/{repository}/archive/refs/tags/{tag_name}.tar.gz
set(RAYLIB_VERSION 4.5.0)
FetchContent_Declare(
  raylib
  URL https://github.com/raysan5/raylib/archive/refs/tags/${RAYLIB_VERSION}.tar.gz
)
FetchContent_GetProperties(raylib)
if(NOT raylib_POPULATED)
  FetchContent_Populate(raylib)
  set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE) # Do not build the supplied examples
  # Add this to prevent building raylib's own project tests
  set(BUILD_TESTING OFF CACHE BOOL "" FORCE)
  # Specify where the raylib build is
  add_subdirectory(${raylib_SOURCE_DIR} ${raylib_BINARY_DIR})
endif()

# Our Project
set(SOURCE_FILES src/Main.cpp)
add_executable(${PROJECT_NAME} ${SOURCE_FILES})
target_include_directories(${PROJECT_NAME} PRIVATE ${raylib_SOURCE_DIR}/src)
target_link_libraries(${PROJECT_NAME} raylib)

# Checks if OSX and links appropriate frameworks (Only required on MacOS)
if(APPLE)
  target_link_libraries(${PROJECT_NAME} "-framework IOKit")
  target_link_libraries(${PROJECT_NAME} "-framework Cocoa")
  target_link_libraries(${PROJECT_NAME} "-framework OpenGL")
endif()
