# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Manage /usr/bin/pinentry symlink"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="app-admin/eselect
	!<app-crypt/pinentry-0.8.0-r1"
DEPEND="${RDEPEND}"

src_install() {
	insinto /usr/share/eselect/modules
	newins "${FILESDIR}"/${P} pinentry.eselect || die
}
