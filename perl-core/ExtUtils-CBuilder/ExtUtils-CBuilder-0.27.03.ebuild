# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit versionator
MY_P=${PN}-$(delete_version_separator 2 )
MODULE_AUTHOR=DAGOLDEN
S=${WORKDIR}/${MY_P}
inherit perl-module

DESCRIPTION="Compile and link C code for Perl modules"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

SRC_TEST="do"
