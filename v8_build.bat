echo ============== Building V8 (Ninja) ===============
@echo off
set DEPOT_DIR=%~dp0\..\depot_tools
set PATH=%DEPOT_DIR%;%PATH%
set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set GYP_MSVS_VERSION=2017
@echo on
cd v8
ninja -C out.gn/x64.release