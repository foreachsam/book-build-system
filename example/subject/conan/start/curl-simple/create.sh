#!/usr/bin/env bash

mkdir -p demo-curl

cd demo-curl


# https://conan.io/search?q=curl
# https://conan.io/source/libcurl/7.47.1/lasote/stable
# https://github.com/lasote/conan-libcurl

cat > conanfile.txt << EOF
[requires]
libcurl/7.47.1@lasote/stable

[options]
libcurl:shared=True

[generators]
cmake

EOF

cat > CMakeLists.txt << EOF
project(SimpleCurl)
cmake_minimum_required(VERSION 2.8.12)

include(\${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(app main.c)
target_link_libraries(app \${CONAN_LIBS})

EOF


# https://curl.haxx.se/libcurl/c/example.html
# https://curl.haxx.se/libcurl/c/simple.html
# https://raw.githubusercontent.com/curl/curl/master/docs/examples/simple.c
wget -c https://raw.githubusercontent.com/curl/curl/master/docs/examples/simple.c -O main.c


mkdir -p build

cd build

# conan install ..
conan install .. --build missing

cmake ..

make

./bin/app

#ls ~/.conan/data/
#cd ..
#tree .
