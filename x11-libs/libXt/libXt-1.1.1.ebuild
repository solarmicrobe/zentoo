# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit xorg-2 toolchain-funcs

DESCRIPTION="X.Org Xt library"

KEYWORDS="amd64"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libSM
	x11-libs/libICE
	x11-proto/xproto
	x11-proto/kbproto"
DEPEND="${RDEPEND}"

pkg_setup() {
	xorg-2_pkg_setup

	tc-is-cross-compiler && export CFLAGS_FOR_BUILD="${BUILD_CFLAGS}"
}
