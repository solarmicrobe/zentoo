# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Utility to change the binutils version being used"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# We also RDEPEND on sys-apps/findutils which is in base @system
RDEPEND="sys-apps/gentoo-functions"

S=${WORKDIR}

src_install() {
	newbin "${FILESDIR}"/${PN}-${PV} ${PN}
	doman "${FILESDIR}"/${PN}.8
}
