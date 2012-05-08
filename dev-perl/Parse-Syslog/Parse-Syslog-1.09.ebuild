# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module
DESCRIPTION="Parse::Syslog - Parse Unix syslog files"
HOMEPAGE="http://search.cpan.org/~dschwei/${P}"
SRC_URI="mirror://cpan/authors/id/D/DS/DSCHWEI/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64"
IUSE=""
SRC_TEST="do"

DEPEND="dev-lang/perl
		virtual/perl-Time-Local
		dev-perl/File-Tail"
