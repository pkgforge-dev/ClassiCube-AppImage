#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    libdecor   \
    openal     \
    sdl3       \
    ttf-dejavu

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package

# If the application needs to be manually built that has to be done down here
echo "Making nightly build of ClassiCube..."
echo "---------------------------------------------------------------"
REPO="https://github.com/UnknownShadow200/ClassiCube"
VERSION="$(git ls-remote "$REPO" HEAD | cut -c 1-9 | head -1)"
git clone "$REPO" ./ClassiCube
echo "$VERSION" > ~/version

mkdir -p ./AppDir/bin
cd ./ClassiCube
make -j$(nproc) RELEASE=1 BUILD_SDL3=1
mv -v "ClassiCube" ../AppDir/bin
cp -r misc/CCicon.png ../AppDir
