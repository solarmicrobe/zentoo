# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="ASN.1 library"
HOMEPAGE="http://www.gnu.org/software/libtasn1/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc static-libs"

DEPEND=">=dev-lang/perl-5.6
	sys-devel/bison"
RDEPEND=""

DOCS=( AUTHORS ChangeLog NEWS README THANKS )

src_configure(){
	local myconf

	[[ "${VALGRIND_TESTS}" == "0" ]] && myconf+=" --disable-valgrind-tests"
	econf \
		$(use_enable static-libs static) \
		${myconf}
}

src_install() {
	default
	find "${ED}" -name '*.la' -exec rm -f {} +

	if use doc; then
		dodoc doc/libtasn1.ps || die "dodoc failed"
	fi
}
