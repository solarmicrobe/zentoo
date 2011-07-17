# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils

DESCRIPTION="Portable and efficient API to determine the call-chain of a program"
HOMEPAGE="http://savannah.nongnu.org/projects/libunwind"
SRC_URI="http://download.savannah.nongnu.org/releases/libunwind/${P}.tar.gz"

LICENSE="MIT"
SLOT="7"
KEYWORDS="amd64 x86"
IUSE=""

RESTRICT="test"		 # https://savannah.nongnu.org/bugs/?22368
					 # https://bugs.gentoo.org/273372

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-disable-setjmp.patch \
		"${FILESDIR}"/${P}-implicit-declaration.patch
	eautoreconf
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc AUTHORS ChangeLog NEWS README TODO
}
