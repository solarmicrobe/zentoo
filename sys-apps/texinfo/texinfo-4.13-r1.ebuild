# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit flag-o-matic

DESCRIPTION="The GNU info program and utilities"
HOMEPAGE="http://www.gnu.org/software/texinfo/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.lzma"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls static"

RDEPEND="!=app-text/tetex-2*
	>=sys-libs/ncurses-5.2-r2
	nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	app-arch/xz-utils
	nls? ( sys-devel/gettext )"

src_prepare() {
	epatch "${FILESDIR}"/${P}-xz.patch #269742
	touch doc/install-info.1 #354589
	epatch "${FILESDIR}"/${P}-texi2dvi-regexp-range.patch #311885
	touch doc/{texi2dvi,texi2pdf,pdftexi2dvi}.1 #354589
	epatch "${FILESDIR}"/${P}-accentenc-test.patch
}

src_configure() {
	use static && append-ldflags -static
	econf $(use_enable nls)
}

src_compile() {
	# Make cross-compiler safe (#196041)
	if tc-is-cross-compiler ; then
		emake -C tools/gnulib/lib || die
	fi

	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die

	dodoc AUTHORS ChangeLog INTRODUCTION NEWS README TODO
	newdoc info/README README.info
	newdoc makeinfo/README README.makeinfo
}
