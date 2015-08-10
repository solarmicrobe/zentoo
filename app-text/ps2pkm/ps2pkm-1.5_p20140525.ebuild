# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit flag-o-matic toolchain-funcs

DESCRIPTION="Tool that converts a PostScript type1 font into a corresponding TeX PK font"
HOMEPAGE="http://tug.org/texlive/"
SRC_URI="mirror://gentoo/texlive-${PV#*_p}-source.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-libs/kpathsea-6.2.0"
RDEPEND="
	!<app-text/texlive-core-2010
	!app-text/ptex
	${DEPEND}"
DEPEND="${DEPEND}
	virtual/pkgconfig"

S=${WORKDIR}/texlive-${PV#*_p}-source/texk/${PN}
DOCS=( "ChangeLog" "CHANGES.type1" "README" "README.14m" "README.type1" )

src_configure() {
	has_version '>=dev-libs/kpathsea-6.2.1' && append-cppflags "$($(tc-getPKG_CONFIG) --cflags kpathsea)"
	econf --with-system-kpathsea
}
