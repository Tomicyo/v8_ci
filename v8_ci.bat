@echo off
set DEPOT_DIR=%~dp0\..\depot_tools
set PATH=%DEPOT_DIR%;%PATH%
set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set GYP_MSVS_VERSION=2017
if not exist %DEPOT_DIR% goto GetDepot
goto GetV8
:GetDepot
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git %DEPOT_DIR%

:GetV8
if exist v8 goto FixVSTC
call v8_fetch
if "%ERRORLEVEL%"=="0" (goto FixVSTC) else echo Warning: Error Occured
goto FixVSTC

:FixVSTC
copy /Y v8\build\vs_toolchain.py v8\gypfiles\vs_toolchain.py

:SyncV8
call v8_sync
goto BuildV8

:BuildV8
call v8_gen;
pushd %~dp0
cd v8
ninja -C out.gn/x64.release v8
popd
@rem BuildConsole.exe /command="ninja.exe -C out.gn/x64.release v8" /profile="E:\bin\Xoreax\IncrediBuild\Profiles\chromium.ib_profile.xml"

:Install
call v8_install
:End
echo Ending