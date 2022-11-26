# FIPP-DevEnvironment
This repository contains a whole development environment for the fast image processing pipeline library. 

It combines several repositories:

- FIPP (core library)
- FIPP-Plugins
- FIPP-ImageProcessing

Additionally a docker file for nvidia-docker is included. All Repositories are going to get cloned inside this container.
The main purpose of this repository is to provide a development environment for developing plugins while improving the core libraries. If you are only interested in developing a FIPP-Plugin, please use the Dockerfiles provided inside FIPP-Plugins.

## Setup
Clone this repository and open it as an docker container via vscode. First run:
`git submodule update --init --recursive` to get all submodules cloned inside in their actual state.

Edit conan config for c++11 and Debug config as mentioned in FIPP repository:
```bash
[settings]
os=Linux
os_build=Linux
arch=x86_64
arch_build=x86_64
compiler=gcc
compiler.version=11
compiler.libcxx=libstdc++11
build_type=Debug```

Then install FIPP
```bash
cd FIPP
mkdir build
cd build
conan install ..
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_VERBOSE_MAKEFILE=ON ..
cmake --build ..
make 
make install
```
Then FIPP will be installed inside /usr/local/lib/FIPP.
This is necessary for developing plugins.
