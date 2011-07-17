# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Utility to select the default PostgreSQL slot"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI="http://dev.gentoo.org/~titanofold/${P}.tbz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="app-admin/eselect
		 !!dev-db/libpq"

S="${WORKDIR}"

src_install() {
	keepdir /etc/eselect/postgresql

	insinto /usr/share/eselect/modules
	doins postgresql.eselect

	dosym /usr/bin/eselect /usr/bin/postgresql-config
}

pkg_postinst() {
	ewarn "If you are updating from app-admin/eselect-postgresql-0.4 or older, run:"
	ewarn
	ewarn "    eselect postgresql update"
	ewarn
	ewarn "To get your system in a proper state."
	elog "You should set your desired PostgreSQL slot:"
	elog "    eselect postgresql list"
	elog "    eselect postgresql set <slot>"
}
