# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit libtool

MY_P="${P}-stable"

DESCRIPTION="A library to execute a function when a specific event occurs on a file descriptor"
HOMEPAGE="http://monkey.org/~provos/libevent/"
SRC_URI="mirror://sourceforge/levent/files/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="static-libs test"

RDEPEND="!<=dev-libs/9libs-1.0"

S=${WORKDIR}/${MY_P}

src_prepare() {
	# don't waste time building tests/samples
	sed -i \
		-e 's|^\(SUBDIRS =.*\)sample test\(.*\)$|\1\2|' \
		Makefile.in || die "sed Makefile.in failed"

	elibtoolize
}

src_configure() {
	econf $(use_enable static-libs static) || die "econf"
}

src_test() {
	emake -C test check | tee "${T}"/tests
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc README ChangeLog
	if ! use static-libs; then
		rm -f "${D}"/usr/lib*/libevent*.la
	fi
}
