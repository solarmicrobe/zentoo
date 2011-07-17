# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools

DESCRIPTION="Popular filesystem benchmark"
SRC_URI="ftp://ftp.samba.org/pub/tridge/dbench/${P}.tar.gz"
HOMEPAGE="http://samba.org/ftp/tridge/dbench/"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-libs/popt"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${WORKDIR}/${P}"
	eautoheader
	eautoconf
	}

src_install() {
	dobin dbench tbench tbench_srv
	dodoc README INSTALL
	doman dbench.1
	insinto /usr/share/dbench
	doins client.txt
}

pkg_postinst() {
	elog "You can find the client.txt file in ${ROOT}usr/share/dbench."
}
