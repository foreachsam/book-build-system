#!/usr/bin/env bash


## doc
## https://foreachsam.github.io/book-build-system/read/subject/conan/start/


## demo-curl
mkdir -p demo-curl

cd demo-curl


## conanfile.txt
# https://conan.io/search?q=curl
# https://conan.io/source/libcurl/7.47.1/lasote/stable
cat > conanfile.txt << EOF
[requires]
libcurl/7.47.1@lasote/stable

[generators]
cmake
EOF


## build
mkdir -p build

cd build


## conan install
# conan install ..
conan install .. --build missing


## tree
#ls ~/.conan/data/

cd ..

tree .
