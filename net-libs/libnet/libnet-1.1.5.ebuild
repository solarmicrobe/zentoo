# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="library to provide an API for commonly used low-level network functions (mainly packet injection)"
HOMEPAGE="http://libnet-dev.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/${PN}-dev/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="1.1"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="sys-devel/autoconf"
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/${P}-darwin.patch
}

src_install() {
	emake DESTDIR="${D}" install || die "Failed to install"

	dodoc README \
		doc/{BUGS,CHANGELOG,CONTRIB,DESIGN_NOTES,MIGRATION} \
		doc/{PACKET_BUILDING,PORTED,RAWSOCKET_NON_SEQUITUR,TODO}
	if use doc ; then
		dohtml -r doc/html/*
		docinto sample
		dodoc sample/*.[ch]
	fi
}
