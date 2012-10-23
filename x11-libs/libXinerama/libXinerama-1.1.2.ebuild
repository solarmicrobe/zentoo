# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit xorg-2

DESCRIPTION="X.Org Xinerama library"

KEYWORDS="amd64"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-proto/xextproto
	>=x11-proto/xineramaproto-1.2"
DEPEND="${RDEPEND}"
