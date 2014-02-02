# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )
XORG_MULTILIB=yes

inherit python-r1 xorg-2

DESCRIPTION="X C-language Bindings protocol headers"
HOMEPAGE="http://xcb.freedesktop.org/"
EGIT_REPO_URI="git://anongit.freedesktop.org/git/xcb/proto"
[[ ${PV} != 9999* ]] && \
	SRC_URI="http://xcb.freedesktop.org/dist/${P}.tar.bz2"

KEYWORDS="amd64"
IUSE=""

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	dev-libs/libxml2"

src_configure() {
	xorg-2_src_configure
	#Note: multilib is not supported with python, therefore use only one ABI
	python_foreach_impl autotools-utils_src_configure
}

src_compile() {
	xorg-2_src_compile

	python_foreach_impl autotools-utils_src_compile -C xcbgen \
		top_builddir="${WORKDIR}/${P}-${ABI:-${DEFAULT_ABI}}"
}

src_install() {
	xorg-2_src_install

	python_foreach_impl autotools-utils_src_install -C xcbgen \
		top_builddir="${WORKDIR}/${P}-${ABI:-${DEFAULT_ABI}}"
}

pkg_postinst() {
	ewarn "Please rebuild both libxcb and xcb-util if you are upgrading from version 1.6"
}
