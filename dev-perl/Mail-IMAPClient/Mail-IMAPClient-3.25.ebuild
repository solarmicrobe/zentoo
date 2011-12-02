# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

MODULE_AUTHOR=PLOBBES
inherit perl-module eutils

DESCRIPTION="IMAP client module for Perl"

SLOT="0"
KEYWORDS="amd64"
IUSE="test"

RDEPEND=">=dev-perl/Parse-RecDescent-1.94"
DEPEND="${RDEPEND}
	test? ( dev-perl/Test-Pod )"
#		>=virtual/perl-File-Temp-0.18 )"
		# only used in t/basic.t

SRC_TEST="do"

mydoc="FAQ"
