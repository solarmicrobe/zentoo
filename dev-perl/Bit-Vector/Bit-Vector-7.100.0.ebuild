# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=STBEY
MODULE_VERSION=7.1
inherit perl-module

DESCRIPTION="Efficient bit vector, set of integers and big int math library"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-perl/Carp-Clan
	>=virtual/perl-Storable-2.20"
DEPEND="${RDEPEND}"

SRC_TEST="do"
