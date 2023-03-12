#!/bin/bash
cd FIPP
if ! [-d "build"]; then
    mkdir build
fi
cd build
conan profile new default --detect --force
conan profile update settings.compiler.libcxx=libstdc++11 default
conan install ..
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_VERBOSE_MAKEFILE=ON ..
make install
ldconfig