# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR=DANKOGAI
inherit perl-module

DESCRIPTION="Japanese transcoding module for Perl"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=virtual/perl-MIME-Base64-2.1
	dev-lang/perl"
RDEPEND="${DEPEND}"

SRC_TEST="do"
