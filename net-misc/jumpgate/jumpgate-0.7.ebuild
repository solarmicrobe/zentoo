# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs autotools

DESCRIPTION="An advanced TCP connection forwarder."
HOMEPAGE="http://jumpgate.sourceforge.net"
SRC_URI="http://jumpgate.sourceforge.net/${P}.tar.gz"
LICENSE="as-is"

SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND=""
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"

	if [ "$(gcc-major-version)" == "4" ] ; then
		sed -i -e '/^AC_CHECK_TYPE/d' configure.in
		eautoreconf || die "eautoreconf failed"
	fi
}

src_install() {
	emake install install_prefix="${D}" || die
	dodoc README ChangeLog
}
