#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export DEPLOY_OPENGL=1

# Deploy dependencies
quick-sharun ./AppDir/bin/ClassiCube /usr/lib/libcrypto.so* /usr/lib/libopenal.so*

# Additional changes can be done in between here
mkdir -p ./AppDir/share/fonts/TTF
cp -v /usr/share/fonts/TTF/DejaVuSans.ttf ./AppDir/share/fonts/TTF

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the app for 12 seconds, if the app normally quits before that time
# then skip this or check if some flag can be passed that makes it stay open
quick-sharun --simple-test ./dist/*.AppImage
