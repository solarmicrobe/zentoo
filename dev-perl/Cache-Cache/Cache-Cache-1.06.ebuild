# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR="JSWARTZ"
inherit perl-module

DESCRIPTION="Generic cache interface and implementations"

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="amd64"
IUSE=""

SRC_TEST="do"

DEPEND=">=dev-perl/Digest-SHA1-2.02
	>=dev-perl/Error-0.15
	>=virtual/perl-Storable-1.0.14
	>=dev-perl/IPC-ShareLite-0.09
	dev-lang/perl"
RDEPEND="${DEPEND}"

export OPTIMIZE="$CFLAGS"
