# Hello Window Project

This project demonstrates how to use CMake's FetchContent module to manage dependencies for a C++ project. This approach allows you to easily include and build C++ libraries directly from their source on GitHub.

## Prerequisites

- C++17 compatible compiler
- CMake 3.24 or newer

## Building the Project

```bash
mkdir -p build && cd build
cmake ..
cmake --build .
```

## Using FetchContent with GitHub Repositories

FetchContent can be used to automatically download, configure, and build a project's dependencies. Here's how you can adapt the included `CMakeLists.txt` to fetch any C++ library from GitHub:

1. Locate the GitHub repository URL and release tag for the library you want to include.
2. Use `FetchContent_Declare` to specify the library's source URL.
3. Use `FetchContent_MakeAvailable` or `FetchContent_Populate` to download and prepare the library.
4. Invoke `add_subdirectory` to add the library to the build.

### Example with raylib

In the `CMakeLists.txt` file, `raylib` is included as follows:

```cmake
set(RAYLIB_VERSION 4.5.0)
FetchContent_Declare(
  raylib
  URL https://github.com/raysan5/raylib/archive/refs/tags/${RAYLIB_VERSION}.tar.gz
)
# ... rest of the FetchContent logic ...
```

Replace `raylib` and `RAYLIB_VERSION` with the desired library and version to customize for another library.

## Notes

- Use `set` to disable building of library tests or examples if not needed.
- Use `target_include_directories` and `target_link_libraries` to include and link the library to your project.

## Linking the Downloaded Library

Once the library has been fetched and configured by CMake, you'll need to ensure that it is correctly linked to your project's executable target. Here's how to link the downloaded `raylib` library to the C++ files in the `src` directory:

1. Add the source files to your project's executable in the `CMakeLists.txt`:

    ```cmake
    set(SOURCE_FILES src/Main.cpp)
    add_executable(${PROJECT_NAME} ${SOURCE_FILES})
    ```

2. Link the library to your project's executable target:

    ```cmake
    target_link_libraries(${PROJECT_NAME} raylib)
    ```

3. Include the headers from the library in your source files as needed:

    ```cpp
    #include "raylib.h"  // Example for including raylib
    ```

By following these steps, the `raylib` library will be compiled, linked, and ready to use in your project. You can now call functions from `raylib` within your `Main.cpp` or any other source files you add to the `SOURCE_FILES` list.
