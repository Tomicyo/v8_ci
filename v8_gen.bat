echo ============== Building V8 ===============
@echo off
set DEPOT_DIR=%~dp0\..\depot_tools
set PATH=%DEPOT_DIR%;%PATH%
set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set GYP_MSVS_VERSION=2017
@echo on
pushd %~dp0
cd v8
mkdir out.gn
mkdir out.gn\x64.release
copy /Y ..\args.gn out.gn\x64.release
gn gen out.gn/x64.release
popd