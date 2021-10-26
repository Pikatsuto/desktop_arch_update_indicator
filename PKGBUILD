# Maintainer: Pikatsuto <pikatsuto@gmail.com>
pkgname=desktop_arch_update_indicator
pkgver=0.0.1
pkgrel=1
pkgdesc="indicateur de mise a jours sous forme de .desktop"
arch=(any)
url="https://github.com/Pikatsuto/desktop_arch_update_indicator"
license=('MIT')
groups=()
provides=()
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(https://github.com/Pikatsuto/desktop_arch_update_indicator/archive/refs/tags/0.0.1.tar.gz)
md5sums=("dfb49e122d57ae40e28954a303b1b372")
 
build() {
    cd $srcdir/$pkgname-$pkgver

    mkdir -p $pkgdir/usr/bin/ 
    mkdir -p $pkgdir/usr/share/desktop-arch-update-indicator/
    mkdir -p $pkgdir/usr/man/man6/
    mkdir -p $pkgdir/etc/desktop-arch-update-indicator/
    mkdir -p $pkgdir/usr/share/licenses/desktop-arch-update-indicator/
    mkdir -p $pkgdir/usr/lib/systemd/user/

    cp $srcdir/$pkgname-$pkgver/.desktop-arch-update-indicator/bin/desktop-arch-update-indicator $pkgdir/usr/bin/
    chmod +x $pkgdir/usr/bin
    cp -r $srcdir/$pkgname-$pkgver/.desktop-arch-update-indicator/data/images/ $pkgdir/usr/share/desktop-arch-update-indicator/images/
    cp $srcdir/$pkgname-$pkgver/.desktop-arch-update-indicator/data/man/desktop-arch-update-indicator.6 $pkgdir/usr/man/man6/
    touch $pkgdir/etc/desktop-arch-update-indicator/no_config
    cp $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/desktop-arch-update-indicator/
    cp $srcdir/$pkgname-$pkgver/.desktop-arch-update-indicatordata/service/desktop_arch_update_indicator.service $pkgdir/usr/lib/systemd/user/
}

package() {
    echo ""
}