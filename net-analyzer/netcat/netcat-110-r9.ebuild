# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs flag-o-matic

PATCH_VER="1.0"
MY_P=nc${PV}
DESCRIPTION="the network swiss army knife"
HOMEPAGE="http://nc110.sourceforge.net/"
SRC_URI="mirror://sourceforge/nc110/${MY_P}.tgz
	ftp://sith.mimuw.edu.pl/pub/users/baggins/IPv6/nc-v6-20000918.patch.gz
	mirror://gentoo/${P}-patches-${PATCH_VER}.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="crypt ipv6 static"

DEPEND="crypt? ( dev-libs/libmix )"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
	unpack ${MY_P}.tgz ${P}-patches-${PATCH_VER}.tar.bz2
	epatch "${DISTDIR}"/nc-v6-20000918.patch.gz patch
	sed -i 's:#define HAVE_BIND:#undef HAVE_BIND:' netcat.c
	sed -i 's:#define FD_SETSIZE 16:#define FD_SETSIZE 1024:' netcat.c #34250
}

src_compile() {
	export XLIBS=""
	export XFLAGS="-DLINUX -DTELNET -DGAPING_SECURITY_HOLE"
	use ipv6 && XFLAGS="${XFLAGS} -DINET6"
	use static && export STATIC="-static"
	use crypt && XFLAGS="${XFLAGS} -DAESCRYPT" && XLIBS="${XLIBS} -lmix"
	[[ ${CHOST} == *-solaris* ]] && XLIBS="${XLIBS} -lnsl -lsocket"
	make -e CC="$(tc-getCC) ${CFLAGS} ${LDFLAGS}" nc || die
}

src_install() {
	dobin nc || die "dobin failed"
	dodoc README* netcat.blurb debian-*
	doman nc.1
	docinto scripts
	dodoc scripts/*
}
