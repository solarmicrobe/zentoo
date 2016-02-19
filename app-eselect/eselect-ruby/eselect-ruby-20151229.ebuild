# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Manages multiple Ruby versions"
HOMEPAGE="https://www.gentoo.org"
SRC_URI="https://dev.gentoo.org/~flameeyes/ruby-team/ruby.eselect-${PVR}.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=app-admin/eselect-1.0.2"

S=${WORKDIR}

src_install() {
	insinto /usr/share/eselect/modules
	newins "${WORKDIR}/ruby.eselect-${PVR}" ruby.eselect || die
}
