# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org fontenc library"

KEYWORDS="amd64"
IUSE=""

RDEPEND="sys-libs/zlib
	x11-proto/xproto"
DEPEND="${RDEPEND}"

CONFIGURE_OPTIONS="--with-encodingsdir=${EPREFIX}/usr/share/fonts/encodings"
