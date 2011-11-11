# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MODULE_AUTHOR=GAAS
MODULE_VERSION=6.00
inherit perl-module

DESCRIPTION="Date conversion for HTTP date formats"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	!<dev-perl/libwww-perl-6
	virtual/perl-Time-Local
"
DEPEND="${RDEPEND}"

SRC_TEST=do
