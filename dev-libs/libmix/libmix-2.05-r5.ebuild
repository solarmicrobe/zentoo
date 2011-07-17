# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools base multilib toolchain-funcs

DESCRIPTION="Programs Crypto/Network/Multipurpose Library"
HOMEPAGE="http://mixter.void.ru/"
SRC_URI="http://mixter.void.ru/${P/.}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="static-libs"
#IUSE="net2 static-libs"

#DEPEND="net2? ( net-libs/libpcap net-libs/libnet:1.0 )"
#RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-v${PV}

PATCHES=(
	"${FILESDIR}"/${P}-fix-pattern.patch
	"${FILESDIR}"/${P}-gentoo.patch
	"${FILESDIR}"/${P}-libnet.patch
	"${FILESDIR}"/${P}-gentoo2.patch
)

DOCS=( CHANGES )

pkg_setup() {
	tc-export CC CXX
}

src_prepare(){
	base_src_prepare
	eautoreconf
}

# net-libs/libnet doesn't provide shared libs, cannot be used currently

src_configure() {
	econf \
		--libdir=/usr/$(get_libdir) \
		$(use_enable static-libs static) \
		--without-net2
#		$(use_with net2)
}
