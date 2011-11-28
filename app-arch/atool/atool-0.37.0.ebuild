# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="a script for managing file archives of various types"
HOMEPAGE="http://www.nongnu.org/atool/"
SRC_URI="http://savannah.nongnu.org/download/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-lang/perl
	!app-text/adiff"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die 'emake install failed'
	dodoc AUTHORS ChangeLog NEWS README TODO
}
