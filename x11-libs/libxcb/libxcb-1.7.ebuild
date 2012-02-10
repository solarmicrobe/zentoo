# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

XORG_EAUTORECONF=yes
inherit python xorg-2

DESCRIPTION="X C-language Bindings library"
HOMEPAGE="http://xcb.freedesktop.org/"
EGIT_REPO_URI="git://anongit.freedesktop.org/git/xcb/libxcb"
[[ ${PV} != 9999* ]] && \
	SRC_URI="http://xcb.freedesktop.org/dist/${P}.tar.bz2"

KEYWORDS="amd64"
IUSE="doc selinux"

RDEPEND="x11-libs/libXau
	x11-libs/libXdmcp
	dev-libs/libpthread-stubs"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	dev-libs/libxslt
	=dev-lang/python-2*[xml]
	>=x11-proto/xcb-proto-1.6"

	PATCHES=( "${FILESDIR}/${P}-interix.patch" )

pkg_setup() {
	python_set_active_version 2
	xorg-2_pkg_setup
	XORG_CONFIGURE_OPTIONS=(
		$(use_enable doc build-docs)
		$(use_enable selinux)
		--enable-xinput
	)
}
