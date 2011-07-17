# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools

DESCRIPTION="Implementation for atomic memory update operations"
HOMEPAGE="http://www.hpl.hp.com/research/linux/atomic_ops/"
SRC_URI="http://www.hpl.hp.com/research/linux/atomic_ops/download/${P}.tar.gz"

LICENSE="GPL-2 MIT as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack(){
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-ppc64-load_acquire.patch
	epatch "${FILESDIR}"/${P}-ppc-asm.patch
	epatch "${FILESDIR}"/${P}-sh4.patch
	epatch "${FILESDIR}"/${P}-fix-makefile-am-generic.patch
	eautoreconf
}

src_install() {
	emake pkgdatadir="${EPREFIX}/usr/share/doc/${PF}" DESTDIR="${D}" install || die
}
