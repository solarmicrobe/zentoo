# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic toolchain-funcs eutils

DESCRIPTION="ELF related utils for ELF 32/64 binaries that can check files for security relevant properties"
HOMEPAGE="http://hardened.gentoo.org/pax-utils.xml"
SRC_URI="mirror://gentoo/pax-utils-${PV}.tar.xz
	http://dev.gentoo.org/~solar/pax/pax-utils-${PV}.tar.xz
	http://dev.gentoo.org/~vapier/dist/pax-utils-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="caps"
#RESTRICT="mirror"

RDEPEND="caps? ( sys-libs/libcap )"
DEPEND="${RDEPEND}
	app-arch/xz-utils"

src_unpack() {
	# avoid newer EAPI for easy upgrade paths
	xz -dc "${DISTDIR}/${A}" | tar xf - || die
}

src_compile() {
	emake CC="$(tc-getCC)" USE_CAP=$(use caps && echo yes) || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc BUGS README TODO
}
