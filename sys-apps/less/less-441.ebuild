# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Excellent text file viewer"
HOMEPAGE="http://www.greenwoodsoftware.com/less/"
SRC_URI="http://www.greenwoodsoftware.com/less/${P}.tar.gz
	http://www-zeuthen.desy.de/~friebel/unix/less/code2color"

LICENSE="|| ( GPL-3 BSD-2 )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="unicode"

DEPEND=">=sys-libs/ncurses-5.2"
RDEPEND="${RDEPEND}"

src_unpack() {
	unpack ${P}.tar.gz
	cd "${S}"
	cp "${DISTDIR}"/code2color "${S}"/
	epatch "${FILESDIR}"/code2color.patch
}

yesno() { use $1 && echo yes || echo no ; }
src_compile() {
	export ac_cv_lib_ncursesw_initscr=$(yesno unicode)
	export ac_cv_lib_ncurses_initscr=$(yesno !unicode)
	econf || die
	emake || die
}

src_install() {
	emake install DESTDIR="${D}" || die

	dobin code2color || die "dobin"
	newbin "${FILESDIR}"/lesspipe.sh lesspipe || die "newbin"
	dosym lesspipe /usr/bin/lesspipe.sh
	newenvd "${FILESDIR}"/less.envd 70less

	dodoc NEWS README* "${FILESDIR}"/README.Gentoo
}

pkg_postinst() {
	einfo "lesspipe offers colorization options.  Run 'lesspipe -h' for info."
}
