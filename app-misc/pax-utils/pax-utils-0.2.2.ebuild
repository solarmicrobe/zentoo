# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic toolchain-funcs eutils

DESCRIPTION="ELF related utils for ELF 32/64 binaries that can check files for security relevant properties"
HOMEPAGE="http://hardened.gentoo.org/pax-utils.xml"
SRC_URI="mirror://gentoo/pax-utils-${PV}.tar.bz2
	http://dev.gentoo.org/~solar/pax/pax-utils-${PV}.tar.bz2
	http://dev.gentoo.org/~vapier/dist/pax-utils-${PV}.tar.bz2"
#SRC_URI="http://wh0rd.org/pax-utils-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="caps"
#RESTRICT="mirror"

DEPEND="caps? ( sys-libs/libcap )"
RDEPEND="${DEPEND}"

src_compile() {
	emake CC="$(tc-getCC)" USE_CAP=$(use caps && echo yes) || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc BUGS README TODO
}
