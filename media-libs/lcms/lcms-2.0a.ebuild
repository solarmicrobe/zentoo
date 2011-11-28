# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit libtool

DESCRIPTION="A lightweight, speed optimized color management engine"
HOMEPAGE="http://www.littlecms.com/"
SRC_URI="mirror://sourceforge/${PN}/lcms2-${PV}.tar.gz"

LICENSE="MIT"
SLOT="2"
KEYWORDS="amd64"
IUSE="jpeg static-libs tiff zlib"

RDEPEND="jpeg? ( virtual/jpeg )
	tiff? ( media-libs/tiff )
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}"

RESTRICT="test" # Segment maxima GBD test fails randomly

S=${WORKDIR}/${P/a}

src_prepare() {
	elibtoolize
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_enable static-libs static) \
		$(use_with jpeg) \
		$(use_with tiff) \
		$(use_with zlib)
}

src_install() {
	emake DESTDIR="${D}" install || die

	insinto /usr/share/lcms2/profiles
	doins testbed/*.icm || die

	dodoc AUTHORS ChangeLog || die

	insinto /usr/share/doc/${PF}/pdf
	doins doc/*.pdf || die

	find "${D}" -name '*.la' -exec rm -f '{}' +
}
