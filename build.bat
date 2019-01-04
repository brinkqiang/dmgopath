
rem - clone code
rem git clone https://github.com/brinkqiang/dmgopath.git
rem pushd dmgopath
rem git submodule update --init --recursive

if not defined GOPATH (
    echo GOPATH NOT EXIST
    goto FAILED
)

rmdir /S /Q %GOPATH%\src\golang.org\x
mkdir %GOPATH%\src\golang.org\x

pushd %GOPATH%\src\golang.org\x
git clone https://github.com/golang/tools.git
cd /d tools
git submodule update --init --recursive
popd

pushd %GOPATH%\src\golang.org\x
git clone https://github.com/golang/lint.git
cd /d lint
git submodule update --init --recursive
popd

:FAILED
pause