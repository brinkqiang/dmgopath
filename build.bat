
rem - clone code
rem git clone https://github.com/brinkqiang/dmgopath.git
rem pushd dmgopath
rem git submodule update --init --recursive

if not defined GOPATH (
    echo GOPATH NOT EXIST
    goto FAILED
)

rem # # # # # # # # # # # # # # # # # # # # 
rem # public
rem # # # # # # # # # # # # # # # # # # # # 

rmdir /S /Q %GOPATH%\src\golang.org\x

mkdir %GOPATH%\src\golang.org\x

git clone --recursive https://github.com/golang/tools.git %GOPATH%\src\golang.org\x\tools
go install %GOPATH%\src\golang.org\x\tools

git clone --recursive https://github.com/golang/lint.git %GOPATH%\src\golang.org\x\lint
go install %GOPATH%\src\golang.org\x\lint

rem # # # # # # # # # # # # # # # # # # # # 
rem # private
rem # # # # # # # # # # # # # # # # # # # # 

rmdir /S /Q %GOPATH%\src\github.com\brinkqiang
mkdir %GOPATH%\src\github.com\brinkqiang

git clone --recursive https://github.com/brinkqiang/goc.git %GOPATH%\src\github.com\brinkqiang\goc

:FAILED
pause