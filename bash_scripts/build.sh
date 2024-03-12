#!/bin/bash
# Exit on any error
set -e

# Create build directory if it doesn't exist
mkdir -p build
# Enter the build directory
cd build

# Configure the project with CMake
cmake ..

# Build the project
cmake --build .

# Going back to the root of the project
cd ..
