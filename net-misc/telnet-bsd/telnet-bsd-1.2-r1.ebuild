# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools

DESCRIPTION="Telnet and telnetd ported from OpenBSD with IPv6 support"
HOMEPAGE="ftp://ftp.suse.com/pub/people/kukuk/ipv6/"
SRC_URI="ftp://ftp.suse.com/pub/people/kukuk/ipv6/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls xinetd"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}
	!net-misc/netkit-telnetd
	xinetd? ( sys-apps/xinetd )"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-fbsd.patch

	eautoreconf
}

src_compile() {
	# FreeBSD doesn't seem to support PIE neither does hppa
	if use kernel_FreeBSD || use hppa; then
		export libc_cv_fpie="no"
	fi

	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"

	if use xinetd ; then
		insinto /etc/xinetd.d
		newins "${FILESDIR}"/telnetd.xinetd telnetd
	fi

	dodoc README THANKS NEWS AUTHORS ChangeLog INSTALL
}
