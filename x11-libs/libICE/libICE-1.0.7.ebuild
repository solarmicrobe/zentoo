# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org ICE library"

KEYWORDS="amd64"
IUSE="doc ipv6"

RDEPEND="x11-libs/xtrans
	x11-proto/xproto"
DEPEND="${RDEPEND}
	doc? ( app-text/xmlto )"

pkg_setup() {
	xorg-2_pkg_setup

	CONFIGURE_OPTIONS="$(use_enable ipv6)
		$(use_enable doc docs)
		$(use_enable doc specs)
		$(use_with doc xmlto)
		--without-fop"
}
