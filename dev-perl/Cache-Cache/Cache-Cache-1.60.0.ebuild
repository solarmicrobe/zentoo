# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=JSWARTZ
MODULE_VERSION=1.06
inherit perl-module

DESCRIPTION="Generic cache interface and implementations"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=dev-perl/Digest-SHA1-2.02
	>=dev-perl/Error-0.15
	>=virtual/perl-Storable-1.0.14
	>=dev-perl/IPC-ShareLite-0.09"
DEPEND="${RDEPEND}"

export OPTIMIZE="$CFLAGS"
SRC_TEST="do"
