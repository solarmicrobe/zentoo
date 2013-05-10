# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit xorg-2

DESCRIPTION="X.Org Xfixes library"

KEYWORDS="amd64"
IUSE=""

RDEPEND="x11-libs/libX11
	>=x11-proto/fixesproto-5
	x11-proto/xproto
	x11-proto/xextproto"
DEPEND="${RDEPEND}"
