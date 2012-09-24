# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="Debian/Ubuntu bootstrap scripts"
HOMEPAGE="http://packages.qa.debian.org/d/debootstrap.html"
SRC_URI="mirror://debian/pool/main/d/${PN}/${PN}_${PV}.tar.gz
	mirror://gentoo/devices.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	app-arch/dpkg
	net-misc/wget
	sys-devel/binutils
"

DOCS=( TODO debian/changelog )

src_unpack() {
	unpack ${PN}_${PV}.tar.gz
	cp "${DISTDIR}"/devices.tar.gz "${S}"
}

src_compile() {
	return
}

src_install() {
	default
	doman debootstrap.8
}

pkg_postinst() {
	elog "To check Release files against a keyring"
	elog " (--keyring=K), please install app-crypt/gnupg."
}
