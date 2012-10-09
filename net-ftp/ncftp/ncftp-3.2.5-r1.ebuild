# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils toolchain-funcs

#IPV6_P="ncftp-323-v6-20091109"
DESCRIPTION="An extremely configurable ftp client"
HOMEPAGE="http://www.ncftp.com/"
SRC_URI="ftp://ftp.${PN}.com/${PN}/${P}-src.tar.bz2 -> ${P}.474.tar.bz2"
#	ipv6? ( ftp://ftp.kame.net/pub/kame/misc/${IPV6_P}.diff.gz )"

LICENSE="Clarified-Artistic"
SLOT="0"
KEYWORDS="amd64"
IUSE="pch"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P/.474}

src_prepare() {
	#use ipv6 && epatch "${DISTDIR}"/${IPV6_P}.diff.gz
	tc-export CC
	sed \
		-e "s:CC=gcc:CC ?= ${CC}:" \
		-e 's:@SFLAG@::' \
		-e 's:@STRIP@:true:' \
		-i Makefile.in */Makefile.in || die
}
src_configure() {
	LC_ALL="C" econf --disable-universal $(use_enable pch precomp )
}

src_install() {
	default
	dodoc README.txt doc/*.txt
	dohtml doc/html/*.html
}
