# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit multilib eutils

DESCRIPTION="Parallel bzip2 (de)compressor using libbz2"
HOMEPAGE="http://compression.ca/pbzip2/"
SRC_URI="http://compression.ca/${PN}/${P}.tar.gz"

LICENSE="PBZIP2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="static symlink"

DEPEND="app-arch/bzip2"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.1.0-makefile.patch
	tc-export CXX
}

src_compile() {
	if use static ; then
		cp -f /usr/$(get_libdir)/libbz2.a "${S}"
		emake pbzip2-static || die "Failed to build"
	else
		emake pbzip2 || die "Failed to build"
	fi
}

src_install() {
	dobin pbzip2 || die "Failed to install"
	dodoc AUTHORS ChangeLog README || die
	doman pbzip2.1 || die "Failed to install man page"
	dosym /usr/bin/pbzip2 /usr/bin/pbunzip2

	if use symlink; then
		dosym /usr/bin/pbzip2 /usr/bin/bzip2
		dosym /usr/bin/pbzip2 /usr/bin/bunzip2
		dosym /usr/bin/pbzip2 /usr/bin/bzcat
	fi
}
