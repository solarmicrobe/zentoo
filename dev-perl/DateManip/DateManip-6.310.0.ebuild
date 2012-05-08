# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_PN=Date-Manip
MODULE_AUTHOR=SBECK
MODULE_VERSION=6.31
inherit perl-module

DESCRIPTION="Perl date manipulation routines"

SLOT="0"
KEYWORDS="amd64"
IUSE="test"

RDEPEND="
	dev-perl/YAML-Syck
	virtual/perl-Storable
"
DEPEND="${RDEPEND}
	>=virtual/perl-Module-Build-0.380.0
	test? (
		dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage
		dev-perl/Test-Inter
	)
"

SRC_TEST="do"

mydoc="HISTORY"
