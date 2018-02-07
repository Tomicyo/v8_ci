@echo off
set DEPOT_DIR=%~dp0\..\depot_tools
set PATH=%DEPOT_DIR%;%PATH%
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

cd v8
ninja -C out.gn/x64.release v8
@rem BuildConsole.exe /command="ninja.exe -C out.gn/x64.release v8" /profile="E:\bin\Xoreax\IncrediBuild\Profiles\chromium.ib_profile.xml"

:Install
mkdir output
mkdir output\include
xcopy /S /Y include output\include
echo "=========== Include Copy Finished =============="
mkdir output\bin
mkdir output\bin\win64_vc150r
xcopy /S /Y out.gn\x64.release\*.dat output\bin\win64_vc150r
xcopy /S /Y out.gn\x64.release\*.bin output\bin\win64_vc150r
xcopy /S /Y out.gn\x64.release\v8*.dll output\bin\win64_vc150r
xcopy /S /Y out.gn\x64.release\v8*.pdb output\bin\win64_vc150r
xcopy /S /Y out.gn\x64.release\icu*.dll output\bin\win64_vc150r
xcopy /S /Y out.gn\x64.release\icu*.pdb output\bin\win64_vc150r
echo "=========== Bin Copy Finished =============="
mkdir output\lib\
mkdir output\lib\win64_vc150r
xcopy /S /Y out.gn\x64.release\*.lib output\lib\win64_vc150r
echo "=========== Lib Copy Finished =============="
:End
echo Ending