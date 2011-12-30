# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="Updated config.sub and config.guess file from GNU"
HOMEPAGE="http://savannah.gnu.org/projects/config"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S="${WORKDIR}"

src_prepare() {
	epatch "${WORKDIR}"/*.patch
	use elibc_uclibc && sed -i 's:linux-gnu:linux-uclibc:' testsuite/config-guess.data #180637
}

src_compile() { :;}

src_install() {
	insinto /usr/share/${PN}
	doins config.{sub,guess} || die
	fperms +x /usr/share/${PN}/config.{sub,guess}
	dodoc ChangeLog
}
