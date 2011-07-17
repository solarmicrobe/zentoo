# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

DESCRIPTION="Provides interoperable MD5-based crypt() functions"
HOMEPAGE="http://search.cpan.org/~luismunoz/"
SRC_URI="mirror://cpan/authors/id/L/LU/LUISMUNOZ/${P}.tar.gz"

LICENSE="|| ( Artistic Apache-2.0 )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SRC_TEST="do"

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"
