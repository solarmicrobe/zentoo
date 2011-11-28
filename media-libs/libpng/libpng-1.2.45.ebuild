# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# this ebuild is only for the libpng12.so.0 SONAME for ABI compat

EAPI=4

inherit autotools eutils multilib libtool

DESCRIPTION="Portable Network Graphics library"
HOMEPAGE="http://www.libpng.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.xz"

LICENSE="as-is"
SLOT="1.2"
KEYWORDS="amd64"
IUSE=""

RDEPEND="sys-libs/zlib
	!=media-libs/libpng-1.2*:0"
DEPEND="${RDEPEND}
	app-arch/xz-utils"

pkg_setup() {
	if [[ -e ${EROOT}/usr/$(get_libdir)/libpng12.so.0 ]] ; then
		rm -f "${EROOT}"/usr/$(get_libdir)/libpng12.so.0
	fi
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-build.patch
	eautoreconf
	elibtoolize
}

src_configure() {
	econf --disable-static
}

src_compile() {
	emake libpng12.la
}

src_install() {
	newlib.so .libs/libpng12.so.0.* libpng12.so.0
}
