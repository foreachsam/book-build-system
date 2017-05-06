---
layout: page
title: build curl simple demo
description: >
  build curl simple demo
date: 2017-05-06 12:43:58 +0800
source_url: '/read/subject/deb/curl-simple/index.md'
parent:
  title: Debian Package Manager
  url: '/read/subject/deb/'
---


## 範例

* [curl-simple](https://github.com/foreachsam/book-build-system/blob/gh-pages/example/subject/deb/start/curl-simple/create.sh)


## 說明


### Debian Package

執行

``` sh
$ apt-cache search curl
```

顯示

```
curl - command line tool for transferring data with URL syntax
...略...
```

執行

``` sh
$ apt-cache show curl
```

執行

``` sh
$ apt-cache showsrc curl | grep '^Binary:'
```

顯示

```
Binary: curl, libcurl3, libcurl3-gnutls, libcurl3-nss, libcurl4-openssl-dev, libcurl4-gnutls-dev, libcurl4-nss-dev, libcurl3-dbg, libcurl4-doc
```

執行

``` sh
$ apt-cache show libcurl4-openssl-dev
```

執行下面指令，安裝「[libcurl4-openssl-dev](http://packages.ubuntu.com/xenial/libcurl4-openssl-dev)」

``` sh
$ sudo apt-get install libcurl4-openssl-dev
```

執行

``` sh
$ dpkg -L libcurl4-openssl-dev | grep pc
```

顯示

```
/usr/lib/x86_64-linux-gnu/pkgconfig/libcurl.pc
```

執行

``` sh
$ cat /usr/lib/x86_64-linux-gnu/pkgconfig/libcurl.pc
```

執行

``` sh
$ pkg-config --cflags --libs libcurl
```

顯示

```
-lcurl
```

### 產生專案資料夾

執行下面指令，產生專案資料夾。

``` sh
$ mkdir -p demo-curl
```

切換到專案資料夾

``` sh
$ cd demo-curl
```

### 下載範例程式碼

先到「[libcurl - small example snippets](https://curl.haxx.se/libcurl/c/example.html)」

找到「[simple](https://curl.haxx.se/libcurl/c/simple.html)」這個範例，

可以找到下載的「[連結](https://raw.githubusercontent.com/curl/curl/master/docs/examples/simple.c)」，

執行下面指令下載，並且更名為「main.c」。

``` sh
$ wget -c https://raw.githubusercontent.com/curl/curl/master/docs/examples/simple.c -O main.c
```

### build.sh

* [https://developer.gnome.org/references](https://developer.gnome.org/references)
* [https://developer.gnome.org/glib/stable/](https://developer.gnome.org/glib/stable/)
* [https://developer.gnome.org/glib/stable/glib-compiling.html](https://developer.gnome.org/glib/stable/glib-compiling.html)
* [https://www.freedesktop.org/wiki/Software/pkg-config/](https://www.freedesktop.org/wiki/Software/pkg-config/)
* [https://en.wikipedia.org/wiki/Pkg-config](https://en.wikipedia.org/wiki/Pkg-config)
* [https://zh.wikipedia.org/zh-tw/Pkg-config](https://zh.wikipedia.org/zh-tw/Pkg-config)


執行下面指令，產生「build.sh」

``` sh
cat > build.sh << EOF
gcc -o app main.c \$(pkg-config --cflags --libs libcurl)

EOF
```

執行

``` sh
$ cat build.sh
```

顯示

```
gcc -o app main.c $(pkg-config --cflags --libs libcurl)
```

執行

``` sh
$ chmod u+x build.sh
```

執行

``` sh
$ ./build.sh
```

### 執行「app」

執行編譯成功後的執行檔。

``` sh
$ ./app
```

就會顯示「[http://example.com](http://example.com)」的網頁原始碼。

如同執行

``` sh
$ curl http://example.com/
```

也可以執行下面指令，從「Firefox」看到「[http://example.com](http://example.com)」的網頁原始碼。

``` sh
$ firefox view-source:http://example.com/
```
