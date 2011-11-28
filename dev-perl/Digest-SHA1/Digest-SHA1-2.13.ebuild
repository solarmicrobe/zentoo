# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MODULE_AUTHOR=GAAS
inherit perl-module

DESCRIPTION="NIST SHA message digest algorithm"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="virtual/perl-digest-base"
RDEPEND="${DEPEND}"

SRC_TEST="do"
