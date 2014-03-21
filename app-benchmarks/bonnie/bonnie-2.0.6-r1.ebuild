# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-benchmarks/bonnie/bonnie-2.0.6-r1.ebuild,v 1.1 2010/10/12 18:22:07 jer Exp $

EAPI="2"

inherit eutils toolchain-funcs

DESCRIPTION="Performance Test of Filesystem I/O using standard C library calls."
HOMEPAGE="http://www.textuality.com/bonnie/"
SRC_URI="http://www.textuality.com/bonnie/bonnie.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}

src_prepare() {
	epatch \
		"${FILESDIR}"/bonnie_man.patch \
		"${FILESDIR}"/Makefile.patch \
		"${FILESDIR}"/${P}-includes.patch
}

src_compile() {
	emake CC=$(tc-getCC) SYSFLAGS="${CFLAGS}" || die
}

src_install() {
	newbin Bonnie bonnie
	doman bonnie.1
	dodoc Instructions
}
