# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR=MHOSKEN
inherit perl-module

DESCRIPTION="module for compiling and altering fonts"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="virtual/perl-IO-Compress
	dev-perl/XML-Parser
	dev-lang/perl"
RDEPEND="${DEPEND}"

SRC_TEST="do"
