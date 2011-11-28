# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION="Revision Control System"
HOMEPAGE="http://www.gnu.org/software/rcs/"
SRC_URI="mirror://gnu/rcs/${P}.tar.gz
	mirror://gentoo/${P}-debian.diff.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="sys-apps/diffutils"

src_prepare() {
	epatch "${WORKDIR}"/${P}-debian.diff
}

src_configure() {
	# econf BREAKS this!
	./configure \
		--prefix="${EPREFIX}"/usr \
		--host=${CHOST} \
		--with-diffutils || die
}

src_install() {
	emake -j1 \
		prefix="${ED}"/usr \
		man1dir="${ED}"/usr/share/man/man1 \
		man3dir="${ED}"/usr/share/man/man3 \
		man5dir="${ED}"/usr/share/man/man5 \
		install || die

	dodoc ChangeLog CREDITS NEWS README REFS
}
