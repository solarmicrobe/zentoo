# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic toolchain-funcs

MY_P=${P/-/_}
DESCRIPTION="Lists open files for running Unix processes"
HOMEPAGE="ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/"
SRC_URI="ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/${MY_P}.tar.bz2
	ftp://vic.cc.purdue.edu/pub/tools/unix/lsof/${MY_P}.tar.bz2
	ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/${MY_P}.tar.bz2"

LICENSE="lsof"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="static selinux"

DEPEND="selinux? ( sys-libs/libselinux )"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}/${MY_P}_src

src_unpack() {
	unpack ${A}
	cd ${MY_P}
	unpack ./${MY_P}_src.tar
}

yesno() { use $1 && echo y || echo n ; }
target() { use kernel_FreeBSD && echo freebsd || echo linux ; }

src_compile() {
	use static && append-ldflags -static

	touch .neverInv
	LINUX_HASSELINUX=$(yesno selinux) \
	LSOF_CC=$(tc-getCC) \
	LSOF_AR="$(tc-getAR) rc" \
	LSOF_RANLIB=$(tc-getRANLIB) \
	LSOF_CFGF="${CFLAGS} ${CPPFLAGS}" \
	LSOF_CFGL="${CFLAGS} ${LDFLAGS}" \
	./Configure -n $(target) || die

	emake DEBUG="" all || die "emake failed"
}

src_install() {
	dobin lsof || die "dosbin"

	insinto /usr/share/lsof/scripts
	doins scripts/*

	doman lsof.8
	dodoc 00*
}
