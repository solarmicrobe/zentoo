# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

DESCRIPTION="A Perl Module for the creation and modification of high-quality PDF files"
SRC_URI="mirror://cpan/authors/id/A/AR/AREIBENS/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~areibens/"

SLOT="0"
LICENSE="|| ( Artistic LGPL-2 )"
KEYWORDS="amd64 x86"
IUSE=""

SRC_TEST="do"

DEPEND="virtual/perl-IO-Compress
		dev-lang/perl"
RDEPEND="${DEPEND}"
