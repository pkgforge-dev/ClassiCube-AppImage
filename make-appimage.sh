#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/pixmaps/CCicon.png
export DEPLOY_OPENGL=1

# Deploy dependencies
quick-sharun /usr/bin/classicube

# Additional changes can be done in between here
mkdir -p ./AppDir/share/fonts/TTF
cp -v /usr/share/fonts/TTF/DejaVuSans.ttf ./AppDir/share/fonts/TTF

# Turn AppDir into AppImage
quick-sharun --make-appimage
