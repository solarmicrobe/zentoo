# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Wrapper scripts that will execute EDITOR or PAGER"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

S="${WORKDIR}"

src_prepare() {
	sed -e 's/@VAR@/EDITOR/g' "${FILESDIR}/${P}.sh" >editor || die
	sed -e 's/@VAR@/PAGER/g'  "${FILESDIR}/${P}.sh" >pager  || die
}

src_install() {
	exeinto /usr/libexec
	doexe editor pager
	# backwards compatibility
	dosym editor /usr/libexec/gentoo-editor
}
