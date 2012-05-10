# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org Xxf86vm library"

KEYWORDS="amd64"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	>=x11-proto/xf86vidmodeproto-2.3
	x11-proto/xextproto
	x11-proto/xproto"
DEPEND="${RDEPEND}"