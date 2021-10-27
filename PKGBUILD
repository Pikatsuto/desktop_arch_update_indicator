# Maintainer: Pikatsuto <pikatsuto@gmail.com>
pkgname=desktop_arch_update_indicator
pkgver=0.0.2
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
source=(https://github.com/Pikatsuto/desktop_arch_update_indicator/releases/download/0.0.2/desktop_arch_update_indicator-0.0.2.tar.gz)
md5sums=("1c711e1db3198aa8b6685dd39cffa178")
 
build() {
    cd $srcdir/.desktop-arch-update-indicator

    mkdir -p $pkgdir/usr/bin/ 
    mkdir -p $pkgdir/usr/share/desktop-arch-update-indicator/
    mkdir -p $pkgdir/usr/man/man6/
    mkdir -p $pkgdir/etc/desktop-arch-update-indicator/
    mkdir -p $pkgdir/usr/share/licenses/desktop-arch-update-indicator/
    mkdir -p $pkgdir/usr/lib/systemd/user/
    mkdir -p $pkgdir/usr/share/applications/

    cp bin/desktop-arch-update-indicator $pkgdir/usr/bin/
    chmod +x $pkgdir/usr/bin
    cp -r data/images/ $pkgdir/usr/share/desktop-arch-update-indicator/images/
    cp data/images/update_img.png $pkgdir/usr/share/desktop-arch-update-indicator/images/
    cp data/man/desktop-arch-update-indicator.6 $pkgdir/usr/man/man6/
    touch $pkgdir/etc/desktop-arch-update-indicator/no_config
    cp ../LICENSE $pkgdir/usr/share/licenses/desktop-arch-update-indicator/
    cp data/service/desktop_arch_update_indicator.service $pkgdir/usr/lib/systemd/user/
    cp data/desktop/desktop_arch_update_indicator.desktop $pkgdir/usr/share/applications/
}

package() {
    echo ""
}