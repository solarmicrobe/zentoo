# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=TIMB
MODULE_VERSION=1.618
inherit perl-module eutils

DESCRIPTION="The Perl DBI Module"

SLOT="0"
KEYWORDS="amd64"
IUSE="test"

RDEPEND=">=dev-perl/PlRPC-0.2
	>=virtual/perl-Sys-Syslog-0.17
	virtual/perl-File-Spec"
DEPEND="${RDEPEND}
	test? ( >=virtual/perl-Test-Simple-0.90 )"

SRC_TEST="do"
mydoc="ToDo"
MAKEOPTS="${MAKEOPTS} -j1"
