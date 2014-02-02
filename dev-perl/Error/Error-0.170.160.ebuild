# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

MODULE_AUTHOR=SHLOMIF
MODULE_VERSION=0.17016
inherit perl-module

DESCRIPTION="Error/exception handling in an OO-ish way"

SLOT="0"
KEYWORDS="amd64"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	virtual/perl-Module-Build
	test? ( >=dev-perl/Test-Pod-1.14
		>=dev-perl/Test-Pod-Coverage-1.04 )"

SRC_TEST="do"
