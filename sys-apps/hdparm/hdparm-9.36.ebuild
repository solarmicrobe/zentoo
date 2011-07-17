# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

DESCRIPTION="Utility to change hard drive performance parameters"
HOMEPAGE="http://sourceforge.net/projects/hdparm/"
SRC_URI="mirror://sourceforge/hdparm/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i \
		-e "/^CFLAGS/ s:-O2:${CFLAGS}:" \
		-e "/^LDFLAGS/ s:-s:${LDFLAGS}:" \
		Makefile || die "sed"
}

src_compile() {
	emake STRIP=: CC="$(tc-getCC)" || die "compile error"
}

src_install() {
	into /
	dosbin hdparm contrib/idectl || die "dosbin"

	newinitd "${FILESDIR}"/hdparm-init-8 hdparm
	newconfd "${FILESDIR}"/hdparm-conf.d.3 hdparm

	doman hdparm.8
	dodoc hdparm.lsm Changelog README.acoustic hdparm-sysconfig
}
