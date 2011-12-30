# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools

DESCRIPTION="portmap replacement which supports RPC over various protocols"
HOMEPAGE="http://sourceforge.net/projects/rpcbind/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="selinux"

RDEPEND="net-libs/libtirpc
	selinux? ( sec-policy/selinux-rpcbind )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/${P}-pkgconfig.patch
	eautoreconf
}

src_configure() {
	econf --bindir=/sbin
}

src_install() {
	emake DESTDIR="${D}" install || die
	doman man/rpc{bind,info}.8
	dodoc AUTHORS ChangeLog NEWS README
	newinitd "${FILESDIR}"/rpcbind.initd rpcbind || die
	newconfd "${FILESDIR}"/rpcbind.confd rpcbind || die
}
