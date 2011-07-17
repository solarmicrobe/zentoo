# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit libtool

DESCRIPTION="lib that implements the client side of the SMTP protocol"
HOMEPAGE="http://www.stafford.uklinux.net/libesmtp/"
SRC_URI="http://www.stafford.uklinux.net/${PN}/${P}.tar.bz2"

LICENSE="LGPL-2.1 GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug ssl static-libs threads"

RDEPEND="ssl? ( dev-libs/openssl )"
DEPEND="${RDEPEND}"

src_prepare() {
	elibtoolize
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_enable static-libs static) \
		--enable-all \
		$(use_enable threads pthreads) \
		$(use_enable debug) \
		$(use_with ssl openssl)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS Notes README TODO
	insinto /usr/share/doc/${PF}/xml
	doins doc/api.xml
}
