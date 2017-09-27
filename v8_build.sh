DEPOT_DIR=`pwd`/depot_tools
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git $DEPOT_DIR
export PATH=$PATH:$DEPOT_DIR:`pwd`/v8/buildtools/linux64
fetch v8
gclient sync
cd v8
mkdir -p out.gn/x64.release
cp ../args.gn out.gn/x64.release
gn gen out.gn/x64.release
ninja -C out.gn/x64.release v8
mkdir -p artifacts/lib/linux64r
mkdir -p artifacts/bin
cp out.gn/x64.release/*.so artifacts/lib/linux64r
cp out.gn/x64.release/*.bin artifacts/bin
cp out.gn/x64.release/*.dat artifacts/bin
cp -r include artifacts/
cd artifacts
zip -r v8_linux.zip .