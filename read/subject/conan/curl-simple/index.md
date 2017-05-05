---
layout: page
title: Conan Quick Start / curl simple demo
description: >
  Conan Quick Start / curl simple demo
date: 2017-05-05 18:44:57 +0800
source_url: '/read/subject/conan/curl-simple/index.md'
parent:
  title: Conan C/C++ Package Manager
  url: '/read/subject/conan/'
---

## 承續

承續之前「[這篇](../start/)」

## 範例

* [curl-simple](https://github.com/foreachsam/book-build-system/blob/gh-pages/example/subject/conan/start/curl-simple/create.sh)


## 說明


### 產生專案資料夾

執行下面指令，產生專案資料夾。

``` sh
$ mkdir -p demo-curl
```

切換到專案資料夾

``` sh
$ cd demo-curl
```


### 查詢

然後到「[https://conan.io/search](https://conan.io/search)」這個頁面，

``` sh
$ firefox https://conan.io/search
```

查詢「[curl](https://conan.io/search?q=curl)」，可以查到一個列表，

``` sh
$ firefox https://conan.io/search?q=curl
```

選擇「[libcurl/7.47.1@lasote/stable](https://conan.io/source/libcurl/7.47.1/lasote/stable)」這個項目

``` sh
$ firefox https://conan.io/source/libcurl/7.47.1/lasote/stable
```

然後可以連結到「GitHub」上的「[專案](http://github.com/lasote/conan-libcurl)」。

可以找到「conanfile.txt」的範例內容，修改成如下

```
[requires]
libcurl/7.47.1@lasote/stable

[options]
libcurl:shared=True

[generators]
cmake
```


### 產生「conanfile.txt」

執行下面指令，產生「conanfile.txt」

``` sh
cat > conanfile.txt << EOF
[requires]
libcurl/7.47.1@lasote/stable

[options]
libcurl:shared=True

[generators]
cmake

EOF
```

參考「[這一頁](http://docs.conan.io/en/latest/getting_started.html#a-timer-using-poco-libraries)」，提到的「[範例](https://github.com/memsharded/example-poco-timer/blob/master/CMakeLists.txt)」來修改，

執行下面指令，產生「CMakeLists.txt」。

``` sh
cat > CMakeLists.txt << EOF
project(SimpleCurl)
cmake_minimum_required(VERSION 2.8.12)

include(\${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(app main.c)
target_link_libraries(app \${CONAN_LIBS})

EOF
```

* [CMake 入門](https://zh.wikibooks.org/zh-tw/CMake_%E5%85%A5%E9%96%80)
* CMake 入門 / [簡單的範例](https://zh.wikibooks.org/zh-tw/CMake_%E5%85%A5%E9%96%80/%E7%B0%A1%E5%96%AE%E7%9A%84%E7%AF%84%E4%BE%8B)
* CMake 入門 / [基本語法](https://zh.wikibooks.org/zh-tw/CMake_%E5%85%A5%E9%96%80/%E5%9F%BA%E6%9C%AC%E8%AA%9E%E6%B3%95)
* CMake 入門 / [Out-of-source Build](https://zh.wikibooks.org/zh-tw/CMake_%E5%85%A5%E9%96%80/Out-of-source_Build)

### 下載範例程式碼

先到「[libcurl - small example snippets](https://curl.haxx.se/libcurl/c/example.html)」

找到「[simple](https://curl.haxx.se/libcurl/c/simple.html)」這個範例，

可以找到下載的「[連結](https://raw.githubusercontent.com/curl/curl/master/docs/examples/simple.c)」，

執行下面指令下載，並且更名為「main.c」。

``` sh
$ wget -c https://raw.githubusercontent.com/curl/curl/master/docs/examples/simple.c -O main.c
```


### 建立「build」資料夾

執行下面指令，建立「build」資料夾

``` sh
$ mkdir -p build
```

切換到「build」資料夾

``` sh
$ cd build
```


### 執行「conan install」

執行下面指令

``` sh
$ conan install ..
```

理論上要執行上面的指令，來做「conan install」這個動作。

不過會發生錯誤，可以參考提示訊息，或是參考「[這一頁](http://docs.conan.io/en/latest/getting_started.html#installing-dependencies)」的說明，

所以可以改執行下面的指令，

``` sh
$ conan install .. --build missing
```

執行成功後會產生「conanbuildinfo.cmake」和「onaninfo.txt」這兩個檔案


### 執行「cmake」

執行

``` sh
$ cmake ..
```


### 執行「make」

執行

``` sh
$ make
```


### 執行「bin/app」

執行編譯成功後的執行檔。

``` sh
$ ./bin/app
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
