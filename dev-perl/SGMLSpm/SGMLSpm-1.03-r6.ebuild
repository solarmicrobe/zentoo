# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils perl-module

MY_P="${P}ii"
S=${WORKDIR}/${PN}

DESCRIPTION="Perl library for parsing the output of nsgmls"
HOMEPAGE="http://search.cpan.org/author/DMEGG/SGMLSpm-1.03ii/"
SRC_URI="mirror://cpan/authors/id/D/DM/DMEGG/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"
mydoc="TODO BUGS"

src_unpack() {
	unpack ${A}
	cp "${FILESDIR}"/Makefile.PL "${S}"/Makefile.PL
	epatch "${FILESDIR}"/sgmlspl.patch
	mv "${S}"/sgmlspl{.pl,}
}
