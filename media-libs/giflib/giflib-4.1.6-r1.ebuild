# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils libtool

DESCRIPTION="Library to handle, display and manipulate GIF images"
HOMEPAGE="http://sourceforge.net/projects/giflib/"
SRC_URI="mirror://sourceforge/giflib/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="rle X"

DEPEND="!media-libs/libungif
	X? (
		x11-libs/libXt
		x11-libs/libX11
		x11-libs/libICE
		x11-libs/libSM
	)
	rle? ( media-libs/urt )"

src_prepare() {
	epatch "${FILESDIR}"/${P}-gif2rle.patch
	epatch "${FILESDIR}"/${P}-giffix-null-Extension-fix.patch
	elibtoolize
	epunt_cxx
}

src_configure() {
	local myconf=""

	# prevent circular depend #111455
	if has_version media-libs/urt ; then
		myconf="${myconf} $(use_enable rle)"
	else
		myconf="${myconf} --disable-rle"
	fi

	econf \
		--disable-static \
		--disable-gl \
		$(use_enable X x11) \
		${myconf}
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete
	dodoc AUTHORS BUGS ChangeLog NEWS ONEWS README TODO doc/*.txt
	dohtml -r doc
}
