echo ============== Building V8 ===============
cd v8
mkdir out.gn
mkdir out.gn\x64.release
copy /Y ..\args.gn out.gn\x64.release
gn gen out.gn/x64.release