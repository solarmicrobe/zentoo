# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

DESCRIPTION="Digest::Nilsimsa - Perl version of Nilsimsa code"
HOMEPAGE="http://search.cpan.org/~vipul/"
SRC_URI="mirror://cpan/authors/id/V/VI/VIPUL/${P}.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"
