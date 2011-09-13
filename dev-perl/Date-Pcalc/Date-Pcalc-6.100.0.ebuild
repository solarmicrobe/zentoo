# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=STBEY
MODULE_VERSION=6.1
inherit perl-module

DESCRIPTION="Gregorian calendar date calculations"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-perl/Bit-Vector-7
	>=dev-perl/Carp-Clan-5.3"
RDEPEND="${DEPEND}"

SRC_TEST="do"
mydoc="ToDo"
