# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=SNOWHARE
MODULE_VERSION=1.11
inherit perl-module

DESCRIPTION="Conversions to and from arbitrary character sets and UTF8"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-perl/Unicode-Map
	dev-perl/Unicode-Map8
	dev-perl/Unicode-String
	dev-perl/Jcode"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build"
