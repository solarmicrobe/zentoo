# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
XORG_STATIC=no
inherit xorg-2

DESCRIPTION="create dependencies in makefiles"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	x11-proto/xproto"
