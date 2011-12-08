# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs flag-o-matic

MY_PN=${PN}src
DESCRIPTION="Uncompress rar files"
HOMEPAGE="http://www.rarlab.com/rar_add.htm"
SRC_URI="http://www.rarlab.com/rar/${MY_PN}-${PV}.tar.gz"

LICENSE="unRAR"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="!<=app-arch/unrar-gpl-0.0.1_p20080417"

S=${WORKDIR}/unrar

src_compile() {
	append-lfs-flags #356155
	emake \
		-f makefile.unix \
		CXXFLAGS="${CXXFLAGS}" \
		CXX="$(tc-getCXX)" \
		STRIP="true" || die "emake failed"
}

src_install() {
	dobin unrar || die
	dodoc readme.txt
}
