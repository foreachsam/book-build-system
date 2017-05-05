#!/usr/bin/env bash

mkdir -p demo-curl

cd demo-curl


# https://conan.io/search?q=curl
# https://conan.io/source/libcurl/7.47.1/lasote/stable
cat > conanfile.txt << EOF
[requires]
libcurl/7.47.1@lasote/stable

[generators]
cmake
EOF

mkdir -p build

cd build

# conan install ..
conan install .. --build missing


#ls ~/.conan/data/

cd ..

tree .


