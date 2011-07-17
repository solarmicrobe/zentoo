# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils perl-module

DESCRIPTION="A URI Perl Module"
HOMEPAGE="http://search.cpan.org/~gbarr/"
SRC_URI="mirror://cpan/authors/id/G/GB/GBARR/${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="sasl"

SRC_TEST="do"

DEPEND="dev-lang/perl
		sasl? ( dev-perl/Authen-SASL )"
RDEPEND="${DEPEND}"

src_unpack() {
	perl-module_src_unpack
	cd "${S}"
	cp "${FILESDIR}"/libnet.cfg "${S}"
	epatch "${FILESDIR}"/${PV}-hostname.patch
}
