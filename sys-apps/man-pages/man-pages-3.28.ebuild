# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

GENTOO_PATCH=2

DESCRIPTION="A somewhat comprehensive collection of Linux man pages"
HOMEPAGE="http://www.kernel.org/doc/man-pages/"
SRC_URI="mirror://kernel/linux/docs/manpages/Archive/${P}.tar.bz2
	mirror://gentoo/man-pages-gentoo-${GENTOO_PATCH}.tar.bz2
	http://dev.gentoo.org/~cardoe/files/man-pages-gentoo-${GENTOO_PATCH}.tar.bz2"

LICENSE="as-is GPL-2 BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="binchecks"

RDEPEND="virtual/man"
PDEPEND="sys-apps/man-pages-posix"

src_configure() { :; }

src_compile() { :; }

src_install() {
	emake install prefix="${EPREFIX}/usr" DESTDIR="${D}" || die
	dodoc man-pages-*.Announce README Changes*

	# Override with Gentoo specific or additional Gentoo pages
	cd "${WORKDIR}"/man-pages-gentoo
	doman */* || die
	dodoc README.Gentoo
}

pkg_postinst() {
	einfo "If you don't have a makewhatis cronjob, then you"
	einfo "should update the whatis database yourself:"
	einfo " # makewhatis -u"
}
