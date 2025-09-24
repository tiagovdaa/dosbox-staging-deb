#!/bin/bash
set -e

## This script is designed to be run inside the Docker container.
## It handles the full build and packaging process for Dosbox-Staging.
echo "Starting build process..."

## Define the build directory
BUILD_DIR="build-deb"

## Create a build directory and navigate into it
## mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

## Configure the build using CMake and Ninja
## The CMAKE_INSTALL_PREFIX is set to /usr so it installs to the standard system location
## This is important for a proper .deb package
echo "Running CMake configuration..."
cmake -DCPACK_DEBIAN_PACKAGE_CONTROL_EXTRA=./debian/control-extra -DCMAKE_INSTALL_PREFIX=/usr -G Ninja ..

## Compile the project
echo "Compiling Dosbox-Staging..."
ninja

## Create the .deb package using CPack
echo "Creating .deb package..."
cpack -G DEB

## The .deb file is now created in the build directory.
## We will copy it to a known location for the GitHub Actions workflow to find.
## The ls command is used to find the exact filename which includes version info.
## For example: dosbox-staging_0.81.1-1.deb
cp *.deb /dosbox-staging.deb

echo "Build and packaging completed successfully!"