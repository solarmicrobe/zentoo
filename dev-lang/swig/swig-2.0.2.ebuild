# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="Simplified Wrapper and Interface Generator"
HOMEPAGE="http://www.swig.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3 as-is"
SLOT="0"
KEYWORDS="amd64"
IUSE="ccache doc pcre"
RESTRICT="test"

DEPEND="pcre? ( dev-libs/libpcre )"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_enable ccache) \
		$(use_with pcre)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc ANNOUNCE CHANGES CHANGES.current README TODO || die "dodoc failed"
	if use doc; then
		dohtml -r Doc/{Devel,Manual} || die "dohtml failed"
	fi
}
