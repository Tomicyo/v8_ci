mkdir output
mkdir output\include
xcopy /S /Y v8\include output\include
echo "=========== Include Copy Finished =============="
mkdir output\bin
mkdir output\bin\win64_vc150r
xcopy /S /Y v8\out.gn\x64.release\*.dat output\bin\win64_vc150r
xcopy /S /Y v8\out.gn\x64.release\*.bin output\bin\win64_vc150r
xcopy /S /Y v8\out.gn\x64.release\v8*.dll output\bin\win64_vc150r
xcopy /S /Y v8\out.gn\x64.release\v8*.pdb output\bin\win64_vc150r
xcopy /S /Y v8\out.gn\x64.release\icu*.dll output\bin\win64_vc150r
xcopy /S /Y v8\out.gn\x64.release\icu*.pdb output\bin\win64_vc150r
echo "=========== Bin Copy Finished =============="
mkdir output\lib\
mkdir output\lib\win64_vc150r
xcopy /S /Y v8\out.gn\x64.release\*.lib output\lib\win64_vc150r
echo "=========== Lib Copy Finished =============="