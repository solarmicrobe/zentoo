# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools eutils

DESCRIPTION="A graphics library for fast image creation"
HOMEPAGE="http://libgd.org/ http://www.boutell.com/gd/"
SRC_URI="http://libgd.org/releases/${P}.tar.bz2"

LICENSE="|| ( as-is BSD )"
SLOT="2"
KEYWORDS="amd64"
IUSE="fontconfig jpeg png static-libs truetype xpm zlib"

RDEPEND="fontconfig? ( media-libs/fontconfig )
	jpeg? ( virtual/jpeg )
	png? ( >=media-libs/libpng-1.4 )
	truetype? ( >=media-libs/freetype-2.1.5 )
	xpm? ( x11-libs/libXpm x11-libs/libXt )
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-libpng14.patch #305101
	epatch "${FILESDIR}"/${P}-maxcolors.patch #292130
	epatch "${FILESDIR}"/${P}-fontconfig.patch #363367

	# Try libpng14 first, then fallback to plain libpng
	sed -i -e 's:png12:png14:' configure.ac || die

	# Avoid programs we never install
	sed -i '/^noinst_PROGRAMS/s:=:=\n___fooooo =:' Makefile.in || die

	if ! use png ; then
		sed -i -r \
			-e '/^bin_PROGRAMS/,/^noinst_PROGRAMS/s:(gdparttopng|gdtopng|gd2topng|pngtogd|pngtogd2|webpng)..EXEEXT.::g' \
			Makefile.in || die
	fi
	if ! use zlib ; then
		sed -i -r \
			-e '/^bin_PROGRAMS/,/^noinst_PROGRAMS/s:(gd2topng|gd2copypal|gd2togif|giftogd2|gdparttopng)..EXEEXT.::g' \
			Makefile.in || die
	fi

	eautoconf
	find . -type f -print0 | xargs -0 touch -r configure
}

usex() { use $1 && echo ${2:-yes} || echo ${3:-no} ; }
src_configure() {
	export ac_cv_lib_z_deflate=$(usex zlib)
	econf \
		$(use_enable static-libs static) \
		$(use_with fontconfig) \
		$(use_with png) \
		$(use_with truetype freetype) \
		$(use_with jpeg) \
		$(use_with xpm)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc INSTALL README*
	dohtml -r ./
	use static-libs || rm -f "${D}"/usr/*/libgd.la
}
