# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit autotools eutils

DESCRIPTION="General purpose crypto library based on the code used in GnuPG"
HOMEPAGE="http://www.gnupg.org/"
SRC_URI="mirror://gnupg/libgcrypt/${P}.tar.bz2
	ftp://ftp.gnupg.org/gcrypt/${PN}/${P}.tar.bz2
	mirror://gentoo/${P}-idea.patch.bz2"

LICENSE="LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="static-libs"

RDEPEND=">=dev-libs/libgpg-error-1.8"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS ChangeLog NEWS README THANKS TODO )

src_prepare() {
	epatch "${FILESDIR}"/${P}-uscore.patch
	epatch "${FILESDIR}"/${PN}-multilib-syspath.patch
	epatch "${WORKDIR}"/${P}-idea.patch
	eautoreconf
}

src_configure() {
	# --disable-padlock-support for bug #201917
	econf \
		--disable-padlock-support \
		--disable-dependency-tracking \
		--enable-noexecstack \
		--disable-O-flag-munging \
		$(use_enable static-libs static)
}

src_install() {
	default

	use static-libs || find "${D}" -name '*.la' -delete
}
