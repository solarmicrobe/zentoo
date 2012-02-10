# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools eutils multilib toolchain-funcs

DESCRIPTION="A system-independent library for user-level network packet capture"
HOMEPAGE="http://www.tcpdump.org/"
SRC_URI="http://www.tcpdump.org/release/${P}.tar.gz
	http://www.jp.tcpdump.org/release/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="bluetooth ipv6 libnl static-libs"

RDEPEND="bluetooth? ( net-wireless/bluez )
	libnl? ( dev-libs/libnl:1.1 )"
DEPEND="${RDEPEND}
	sys-devel/flex
	virtual/yacc"

DOCS=( CREDITS CHANGES VERSION TODO README{,.dag,.linux,.macosx,.septel} )

src_prepare() {
	epatch \
		"${FILESDIR}/${PN}-1.1-cross-linux.patch" \
		"${FILESDIR}/${P}-ignore-ENODEV.patch"

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable ipv6) \
		$(use_with libnl) \
		$(use_enable bluetooth)
}

src_compile() {
	emake all shared
}

src_install() {
	default

	# remove static libraries (--disable-static does not work)
	if ! use static-libs; then
		find "${ED}" -name '*.a' -exec rm {} + || die
	fi

	# We need this to build pppd on G/FBSD systems
	if [[ "${USERLAND}" == "BSD" ]]; then
		insinto /usr/include
		doins pcap-int.h
	fi
}
