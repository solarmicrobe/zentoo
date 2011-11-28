# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

MODULE_AUTHOR="CAPTTOFU"
MY_P=${PN}-$(delete_version_separator 2 )
S=${WORKDIR}/${MY_P}
inherit eutils perl-module

DESCRIPTION="The Perl DBD:mysql Module"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-perl/DBI
	virtual/mysql"
DEPEND="${RDEPEND}"

mydoc="ToDo"
