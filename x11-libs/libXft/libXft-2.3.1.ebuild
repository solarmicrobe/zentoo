# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit xorg-2 flag-o-matic

DESCRIPTION="X.Org Xft library"

KEYWORDS="amd64"
IUSE=""

RDEPEND=">=x11-libs/libXrender-0.8.2
	x11-libs/libX11
	x11-libs/libXext
	media-libs/freetype
	media-libs/fontconfig
	x11-proto/xproto
	virtual/ttf-fonts"
DEPEND="${RDEPEND}"
