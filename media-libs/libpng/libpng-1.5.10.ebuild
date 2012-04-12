# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils libtool multilib

DESCRIPTION="Portable Network Graphics library"
HOMEPAGE="http://www.libpng.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.xz
	apng? ( mirror://sourceforge/${PN}-apng/${P}-apng.patch.gz )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64"
IUSE="apng neon static-libs"

RDEPEND="sys-libs/zlib"
DEPEND="${RDEPEND}
	app-arch/xz-utils"

DOCS=( ANNOUNCE CHANGES libpng-manual.txt README TODO )

src_prepare() {
	if use apng; then
		epatch "${WORKDIR}"/${P}-apng.patch
		# Don't execute symbols check with apng patch wrt #378111
		sed -i -e '/^check/s:scripts/symbols.chk::' Makefile.in || die
	fi
	elibtoolize
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		$(use_enable neon arm-neon)
}

src_install() {
	default
	find "${ED}" -name '*.la' -exec rm -f {} +
}

pkg_preinst() {
	has_version ${CATEGORY}/${PN}:1.4 && return 0
	preserve_old_lib /usr/$(get_libdir)/libpng14$(get_libname 14)
}

pkg_postinst() {
	has_version ${CATEGORY}/${PN}:1.4 && return 0
	preserve_old_lib_notify /usr/$(get_libdir)/libpng14$(get_libname 14)
}
