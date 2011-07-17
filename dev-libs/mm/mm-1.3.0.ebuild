# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit libtool

DESCRIPTION="Shared Memory Abstraction Library"
HOMEPAGE="http://www.ossp.org/pkg/lib/mm/"
SRC_URI="ftp://ftp.ossp.org/pkg/lib/mm/${P}.tar.gz"

LICENSE="as-is"
SLOT="1.2"
KEYWORDS="amd64 x86"
IUSE=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	elibtoolize
}

src_test() {
	make test || die "testing problem"
}

src_install() {
	make install DESTDIR="${D}" || die
	dodoc README ChangeLog INSTALL PORTING THANKS
	dosym libmm.so /usr/lib/libmm.so.1
}
