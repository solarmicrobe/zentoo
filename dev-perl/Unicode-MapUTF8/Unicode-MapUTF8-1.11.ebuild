# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR=SNOWHARE
inherit perl-module

DESCRIPTION="Conversions to and from arbitrary character sets and UTF8"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-perl/Unicode-Map
	dev-perl/Unicode-Map8
	dev-perl/Unicode-String
	dev-perl/Jcode
	dev-lang/perl"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build"
