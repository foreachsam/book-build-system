#!/usr/bin/env bash


## doc
# https://foreachsam.github.io/book-build-system/read/subject/deb/curl-simple/


## libcurl4-openssl-dev
# $ apt-cache search curl
# $ apt-cache show curl
# $ apt-cache showsrc curl
# $ apt-cache showsrc curl | grep '^Binary:'
# Binary: curl, libcurl3, libcurl3-gnutls, libcurl3-nss, libcurl4-openssl-dev, libcurl4-gnutls-dev, libcurl4-nss-dev, libcurl3-dbg, libcurl4-doc
# $ apt-cache show libcurl4-openssl-dev
sudo apt-get install libcurl4-openssl-dev
# $ dpkg -L libcurl4-openssl-dev
# $ dpkg -L libcurl4-openssl-dev | sort
# $ dpkg -L libcurl4-openssl-dev | grep pc
# /usr/lib/x86_64-linux-gnu/pkgconfig/libcurl.pc
# $ pkg-config --list-all | grep curl
# libcurl                             libcurl - Library to transfer files with ftp, http, etc.


## demo-curl
mkdir -p demo-curl
cd demo-curl


## main.c
# https://curl.haxx.se/libcurl/c/example.html
# https://curl.haxx.se/libcurl/c/simple.html
# https://raw.githubusercontent.com/curl/curl/master/docs/examples/simple.c
wget -c https://raw.githubusercontent.com/curl/curl/master/docs/examples/simple.c -O main.c


## build.sh
# https://developer.gnome.org/references
# https://developer.gnome.org/glib/stable/
# https://developer.gnome.org/glib/stable/glib-compiling.html
# https://www.freedesktop.org/wiki/Software/pkg-config/
# https://en.wikipedia.org/wiki/Pkg-config
# https://zh.wikipedia.org/zh-tw/Pkg-config
cat > build.sh << EOF
gcc -o app main.c \$(pkg-config --cflags --libs libcurl)

EOF

chmod u+x build.sh

./build.sh


## app
./app
