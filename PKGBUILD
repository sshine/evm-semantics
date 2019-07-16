# Maintainer: Everett Hildenbrandt <everett.hildenbrandt@runtimeverification.com>
pkgname=kevm-git
pkgver=r1833.39ebefe
pkgrel=1
epoch=
pkgdesc="K implementation of the Ethereum Virtual Machine (EVM)"
arch=('x86_64')
url="https://github.com/kframework/evm-semantics"
license=('custom')
groups=()
depends=('kframework-git' 'libsecp256k1' 'crypto++' 'protobuf')
makedepends=('pandoc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=kevm-git.install
changelog=
source=('git+https://github.com/kframework/evm-semantics#commit=39ebefe')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "$srcdir/evm-semantics"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/evm-semantics"
    make K_RELEASE="/usr/lib/kframework" LIBFF_CC=clang LIBFF_CXX=clang++ build-node
}

package() {
    cd "$srcdir/evm-semantics"
    make K_RELEASE="/usr/lib/kframework" INSTALL_DIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}