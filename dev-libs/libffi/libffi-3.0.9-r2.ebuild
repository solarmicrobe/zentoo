# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils libtool

DESCRIPTION="a portable, high level programming interface to various calling conventions."
HOMEPAGE="http://sourceware.org/libffi/"
SRC_URI="ftp://sourceware.org/pub/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug static-libs test"

RDEPEND=""
DEPEND="test? ( dev-util/dejagnu )"

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-interix.patch \
		"${FILESDIR}"/${P}-powerpc64-darwin.patch \
		"${FILESDIR}"/${P}-irix.patch \
		"${FILESDIR}"/${P}-arm-oabi.patch \
		"${FILESDIR}"/${P}-define-generic-symbols-carefully.patch \
		"${FILESDIR}"/${P}-strncmp.patch

	elibtoolize
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_enable static-libs static) \
		$(use_enable debug)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc ChangeLog* README
	find "${D}" -type f -name '*.la' -exec rm -f '{}' +
}
