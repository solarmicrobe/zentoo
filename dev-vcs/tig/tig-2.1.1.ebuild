# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit bash-completion-r1 toolchain-funcs

DESCRIPTION="text mode interface for git"
HOMEPAGE="http://jonas.nitro.dk/tig/"
SRC_URI="http://jonas.nitro.dk/tig/releases/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="unicode"

DEPEND="
	sys-libs/ncurses:0=[unicode?]
	sys-libs/readline:0="
RDEPEND="${DEPEND}
	dev-vcs/git"

src_prepare() {
	# pre-generated manpages are in the root directory
	sed -i '/^MANDOC/s#doc/##g' Makefile || die
}

src_configure() {
	econf $(use_with unicode ncursesw)
}

src_compile() {
	emake V=1
}

src_test() {
	# workaround parallel test failures
	emake -j1 test
}

src_install() {
	emake DESTDIR="${D}" install install-doc-man
	dohtml manual.html README.html NEWS.html
	newbashcomp contrib/tig-completion.bash ${PN}

	docinto examples
	dodoc contrib/*.tigrc
}
