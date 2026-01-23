# Maintainer: dakriy <aur at persignum dot com>
pkgname=classicube-git
_pkgname=ClassiCube
pkgver=1.3.7.r729.g900d76d94
pkgrel=1
epoch=0
pkgdesc="A game based on the original Minecraft Classic. (Not an official package)"
arch=('x86_64' 'aarch64')
url="https://www.classicube.net/"
license=('custom')
depends=('openal' 'mesa' 'curl')
makedepends=('git')
provides=('classicube')
conflicts=('classicube')
options=('!debug' 'strip')
source=("git+https://github.com/UnknownShadow200/ClassiCube.git" classicube.desktop)
sha256sums=('SKIP' 'f86ccd0bcba3a9aaf7e1e30c89ab316c0ba2f713715c2246ac06fe6de4feb246')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	make
}

package() {
	install -D -m755 "$srcdir/$_pkgname/ClassiCube" "$pkgdir/usr/bin/classicube"
	install -D -m644 "$srcdir/$_pkgname/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
	install -D -m644 "$srcdir/$_pkgname/misc/CCicon.png" "$pkgdir/usr/share/$pkgname/CCicon.png"
	install -D -m644 "$srcdir/classicube.desktop" "$pkgdir/usr/share/applications/classicube.desktop"
}
