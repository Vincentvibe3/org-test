# Repo Management

Scripts and automation for running CI and other automation to manager this repository.

## ProjectDiscovery.py

A simple script to discover STM32CubeMX projects using CMake for builds.
It outputs each of the folders on a separate line to `stdout`.

## build.sh

The script that configures and builds a CMake project for use as the entrypoint to a container

## Containerfile

Containerfile/Dockerfile designed to support a consistent build environment so we can verify if our firmware compiles. The container this builds is intended to run in a CI environment.

The project to compile should be mounted to `/home/ci-runner/project` in the container.

### Packages

Here is a brief description of the packages installed in the container.

`python3` : To enable more powerful scripting in CMake configuration if necessary.

`cmake` : Libraries and projects depending on them use CMake for builds.

`gcc-arm-none-eabi` : Cross compiling toolchain used for our embedded builds.

`git` : To pull submodules and other git operation that might be done in the 
cmake configuration stage.

`ninja-build` : Build system CMake will use to setup builds.

`wget` : Used to download dependencies.

`curl` : Alternative to download depencies

`make` : Available as an alternative to Ninja if needed.

`bash` : To run the `build.sh` script.

`libnewlib-dev` : Our embedded firmware for STM32 relies on newlib.
