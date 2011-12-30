# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils

DESCRIPTION="CPU, RAM memory, and load monitor for use with tmux"
HOMEPAGE="http://github.com/thewtex/tmux-mem-cpu-load/"
SRC_URI="http://www.github.com/thewtex/${PN}/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_prepare() {
	cd "${WORKDIR}"/thewtex-${PN}-*
	S=$(pwd)
}

src_install() {
	cmake-utils_src_install
	dodoc README.rst || die
}
