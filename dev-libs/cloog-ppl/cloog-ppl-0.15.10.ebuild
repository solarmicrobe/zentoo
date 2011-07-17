# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit autotools-utils

DESCRIPTION="Port of CLooG (Chunky LOOp Generator) to PPL (Parma Polyhedra Library)"
HOMEPAGE="http://repo.or.cz/w/cloog-ppl.git"
SRC_URI="ftp://gcc.gnu.org/pub/gcc/infrastructure/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="static-libs"

RDEPEND="dev-libs/ppl
		dev-libs/gmp"
DEPEND="${RDEPEND}"

src_prepare() {
	mkdir m4
	eautoreconf
}

src_configure() {
	# set includedir to avoid conflicts w/ dev-libs/cloog
	myeconfargs=(
		--with-ppl
		--includedir="${EPREFIX}"/usr/include/cloog-ppl
	)
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install
	mv "${ED}"usr/bin/cloog "${ED}"usr/bin/cloog-ppl || die
	mv "${ED}"usr/share/info/cloog.info "${ED}"usr/share/info/cloog-ppl.info || die
}
