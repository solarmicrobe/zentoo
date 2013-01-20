# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="gdisk - GPT partition table manipulator for Linux"
HOMEPAGE="http://www.rodsbooks.com/gdisk/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-libs/icu
	dev-libs/popt
	sys-libs/ncurses"
DEPEND="${RDEPEND}"

src_compile() {
	emake CXX="$(tc-getCXX)"
}

src_install() {
	local x
	for x in gdisk sgdisk cgdisk fixparts; do
		dosbin ${x}
		doman ${x}.8
	done
	dodoc README NEWS
}
