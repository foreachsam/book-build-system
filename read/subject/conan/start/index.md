---
layout: page
title: Conan Quick Start
description: >
  Conan Quick Start
date: 2017-05-05 18:44:57 +0800
source_url: '/read/subject/conan/start/index.md'
parent:
  title: Conan C/C++ Package Manager
  url: '/read/subject/conan/'
---


## 範例

* [curl-start](https://github.com/foreachsam/book-build-system/blob/gh-pages/example/subject/conan/start/curl-start/create.sh)


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

可以找到「conanfile.txt」的範例內容如下

```
[requires]
libcurl/7.47.1@lasote/stable

[generators]
cmake
```


### 產生「conanfile.txt」

執行下面指令，產生「conanfile.txt」

``` sh
cat > conanfile.txt << EOF
[requires]
libcurl/7.47.1@lasote/stable

[generators]
cmake

EOF
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


### 觀看專案資料夾結構

切換到專案資料夾

``` sh
cd ../
```

執行下面指令，觀看專案資料夾結構

``` sh
$ tree .
```

顯示

```
.
├── build
│   ├── conanbuildinfo.cmake
│   └── conaninfo.txt
└── conanfile.txt

1 directory, 3 files
```


### 觀察下載的相關檔案

執行

``` sh
$ ls ~/.conan/data/
```


## 接下來

接下來，[如何使用「libcurl」](../curl-simple/)
