# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR="CWEST"
inherit perl-module

DESCRIPTION="SSL support for Net::SMTP"

IUSE=""

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="amd64 x86"

DEPEND="dev-lang/perl
		virtual/perl-libnet
		dev-perl/IO-Socket-SSL"
RDEPEND="${DEPEND}"

mydoc="Changes README"
SRC_TEST="do"
