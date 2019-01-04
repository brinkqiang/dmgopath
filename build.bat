
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

git clone --recursive https://github.com/golang/tools.git 

git clone --recursive https://github.com/golang/lint.git

rem # # # # # # # # # # # # # # # # # # # # 
rem # private
rem # # # # # # # # # # # # # # # # # # # # 

rmdir /S /Q %GOPATH%\src\github.com\brinkqiang
mkdir %GOPATH%\src\github.com\brinkqiang

git clone --recursive https://github.com/brinkqiang/profile.git %GOPATH%\src\github.com\brinkqiang

:FAILED
pause