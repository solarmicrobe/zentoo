# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR=UMEMOTO
inherit perl-module

DESCRIPTION="IPv6 related part of the C socket.h defines and structure manipulators"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

SRC_TEST="do"

DEPEND="dev-lang/perl"
src_unpack() {
	base_src_unpack
	tc-export CC
}
