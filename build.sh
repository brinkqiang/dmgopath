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
	exit
fi

rm -rf $GOPATH/src/golang.org/x

mkdir -p $GOPATH/src/golang.org/x/

pushd $GOPATH/src/golang.org/x/
git clone https://github.com/golang/tools.git
cd tools
git submodule update --init --recursive
popd

pushd $GOPATH/src/golang.org/x/
git clone https://github.com/golang/lint.git
cd lint
git submodule update --init --recursive
popd

# popd

# echo continue && read -n 1
