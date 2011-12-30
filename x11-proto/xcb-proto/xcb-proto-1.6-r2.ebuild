# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.5"

inherit python xorg-2

DESCRIPTION="X C-language Bindings protocol headers"
HOMEPAGE="http://xcb.freedesktop.org/"
EGIT_REPO_URI="git://anongit.freedesktop.org/git/xcb/proto"
[[ ${PV} != 9999* ]] && \
	SRC_URI="http://xcb.freedesktop.org/dist/${P}.tar.bz2"

KEYWORDS="amd64"
IUSE=""

PATCHES=(
	"${FILESDIR}/1.6-fix_negative.patch"
	"${FILESDIR}/1.6-libdir-pc.patch"
)

RDEPEND=""
DEPEND="${RDEPEND}
	dev-libs/libxml2"

pkg_setup() {
	python_set_active_version 2
}

src_install() {
	xorg-2_src_install
	python_clean_installation_image
}

pkg_postinst() {
	python_mod_optimize xcbgen
	ewarn "Please rebuild both libxcb and xcb-util if you are upgrading from version 1.6"
}

pkg_postrm() {
	python_mod_cleanup xcbgen
}
