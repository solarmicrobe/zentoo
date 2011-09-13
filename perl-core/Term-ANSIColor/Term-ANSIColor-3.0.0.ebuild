# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MY_PN="ANSIColor"
MODULE_AUTHOR=RRA
MODULE_VERSION=3.00
inherit perl-module

DESCRIPTION="Color screen output using ANSI escape sequences."

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	test? ( dev-perl/Test-Pod )"

SRC_TEST="do"
