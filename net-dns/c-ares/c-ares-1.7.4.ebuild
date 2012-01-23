# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="C library that resolves names asynchronously"
HOMEPAGE="http://c-ares.haxx.se/"
SRC_URI="http://${PN}.haxx.se/download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_configure() {
	econf --enable-shared --enable-nonblocking  --enable-symbol-hiding \
		--enable-warnings
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc RELEASE-NOTES CHANGES NEWS README*
}
