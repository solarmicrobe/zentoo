# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

XORG_PACKAGE_NAME="lib${PN}"
# this package just installs some .c and .h files, no libraries
XORG_STATIC=no
inherit xorg-2

DESCRIPTION="X.Org xtrans library"
KEYWORDS="amd64"
IUSE="doc"

RDEPEND=""
DEPEND="${RDEPEND}
	doc? ( app-text/xmlto )"

pkg_setup() {
	CONFIGURE_OPTIONS="$(use_enable doc docs)
		$(use_with doc xmlto)
		--without-fop"
}
