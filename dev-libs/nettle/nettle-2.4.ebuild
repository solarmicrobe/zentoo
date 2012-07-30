# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils autotools

DESCRIPTION="Low-level cryptographic library"
HOMEPAGE="http://www.lysator.liu.se/~nisse/nettle/"
SRC_URI="http://www.lysator.liu.se/~nisse/archive/${P}.tar.gz"

LICENSE="|| ( LGPL-3 LGPL-2.1 )"
SLOT="0"
KEYWORDS="amd64"
IUSE="+gmp"

DEPEND="gmp? ( dev-libs/gmp )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e "/CFLAGS=/s: -ggdb3::" -i configure.ac || die "sed failed"
	epatch "${FILESDIR}"/${P}-darwin-shlink.patch
	epatch "${FILESDIR}"/${P}-missing-libm-link.patch
	sed -i -e 's/solaris\*)/sunldsolaris*)/' configure.ac || die
	eautoreconf
}

src_configure() {
	# --disable-openssl bug #427526
	econf \
		--enable-shared \
		$(use_enable gmp public-key) \
		--disable-openssl
}
