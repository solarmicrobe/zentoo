# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=GAAS
MODULE_VERSION=6.01
inherit perl-module

DESCRIPTION="Low-level HTTP connection (client)"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	!<dev-perl/libwww-perl-6
	virtual/perl-Compress-Raw-Zlib
	virtual/perl-IO
	virtual/perl-IO-Compress
"
DEPEND="${RDEPEND}"

SRC_TEST=do
