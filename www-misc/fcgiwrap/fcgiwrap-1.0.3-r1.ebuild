# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit autotools

DESCRIPTION="Simple FastCGI wrapper for CGI scripts (CGI support for nginx)"
HOMEPAGE="http://nginx.localdomain.pl/wiki/FcgiWrap"
SRC_URI="https://github.com/gnosek/fcgiwrap/tarball/${PV} -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
IUSE=""
KEYWORDS="amd64"

S="${WORKDIR}/gnosek-${PN}-58ec209"

DEPEND="dev-libs/fcgi"
RDEPEND="${DEPEND}"

DOCS=( README.rst )

src_prepare() {
	sed -e '/man8dir = $(DESTDIR)/s/@prefix@//' \
		-i Makefile.in || die "sed failed"

	eautoreconf
}

pkg_postinst() {
	einfo 'You may want to install www-servers/spawn-fcgi to use with fcgiwrap.'
}
