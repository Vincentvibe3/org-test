#!/bin/bash

# This script sets up a cli build with CMake for use with the Containerfile
cd $1

# Delete cache if exists
if [[ -d "./build/Debug" ]]; then
	echo "Deleting Old Cache"
	rm -f "./build/Debug/CmakeCache.txt"
	rm -r -f "./build/Debug/CmakeFiles"
fi

# Configure build
echo "Configuring"
cmake -DCMAKE_BUILD_TYPE=Debug \
	-DCMAKE_TOOLCHAIN_FILE="./cmake/gcc-arm-none-eabi.cmake" \
	-DCMAKE_COMMAND=cmake \
	-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
	-S "." -B "./build/Debug" -G Ninja

# Actually build
echo "Starting Build"
cmake --build "./build/Debug"