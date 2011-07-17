# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils qt4-r2 toolchain-funcs

DESCRIPTION="A better i7 (and now i3, i5) reporting tool for Linux"
HOMEPAGE="http://code.google.com/p/i7z/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"
IUSE="X"

RDEPEND="
	sys-libs/ncurses
	X? ( x11-libs/qt-gui:4 )"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch \
		"${FILESDIR}"/${PV}-gentoo.patch \
		"${FILESDIR}"/${PV}-gcc46.patch
	tc-export CC
}

src_compile() {
	emake || die
	if use X; then
		cd GUI
		eqmake4 GUI.pro
		emake || die
	fi
}

src_install() {
	emake DESTDIR="${ED}" install || die
	if use X; then
		newsbin GUI/GUI i7z_GUI || die
	fi
	dodoc put_cores_o*line.sh MAKEDEV-cpuid-msr || die
}
