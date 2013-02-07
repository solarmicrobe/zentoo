# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="*"

inherit python xorg-2

DESCRIPTION="X C-language Bindings protocol headers"
HOMEPAGE="http://xcb.freedesktop.org/"
EGIT_REPO_URI="git://anongit.freedesktop.org/git/xcb/proto"
[[ ${PV} != 9999* ]] && \
	SRC_URI="http://xcb.freedesktop.org/dist/${P}.tar.bz2"

KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-libs/libxml2"

src_prepare() {
	python_clean_py-compile_files
	xorg-2_src_prepare
}

pkg_postinst() {
	python_mod_optimize xcbgen
	ewarn "Please rebuild both libxcb and xcb-util if you are upgrading from version 1.6"
}

pkg_postrm() {
	python_mod_cleanup xcbgen
}
