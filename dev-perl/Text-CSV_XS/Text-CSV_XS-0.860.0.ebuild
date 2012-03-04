# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_A_EXT=tgz
MODULE_AUTHOR=HMBRAND
MODULE_VERSION=0.86
inherit perl-module

DESCRIPTION="Comma-separated values manipulation routines"

SLOT="0"
KEYWORDS="amd64"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	test? (
		dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage
	)
"

SRC_TEST="parallel"
