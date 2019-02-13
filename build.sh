#!/bin/bash

# - install depends tools
# yum -y install git
# yum -y install gcc gcc-c++ autoconf libtool automake make
#

# - clone code
# git clone https://github.com/brinkqiang/dmgopath.git
# pushd dmgopath
# git submodule update --init --recursive
#

# pushd thirdparty/depends_path
# libtoolize && aclocal && autoheader && autoconf && automake --add-missing
# sh configure
# popd

if [ $GOPATH ];then
	echo "GOPATH = $GOPATH"
else
    echo GOPATH NOT EXIST
	exit 1
fi

# # # # # # # # # # # # # # # # # # # # 
# public
# # # # # # # # # # # # # # # # # # # # 
rm -rf $GOPATH/src/golang.org/x
mkdir -p $GOPATH/src/golang.org/x/

git clone --recursive https://github.com/golang/tools.git $GOPATH/src/golang.org/x/tools

git clone --recursive https://github.com/golang/lint.git $GOPATH/src/golang.org/x/lint

# # # # # # # # # # # # # # # # # # # # 
# private
# # # # # # # # # # # # # # # # # # # # 

rm -rf $GOPATH/src/github.com/brinkqiang
mkdir -p $GOPATH/src/github.com/brinkqiang

git clone --recursive https://github.com/brinkqiang/goc.git $GOPATH/src/github.com/brinkqiang/profile

# echo continue && read -n 1
