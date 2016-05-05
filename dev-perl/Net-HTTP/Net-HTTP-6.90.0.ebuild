# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DIST_AUTHOR=ETHER
DIST_VERSION=6.09
inherit perl-module

DESCRIPTION="Low-level HTTP connection (client)"

SLOT="0"
KEYWORDS="amd64"
IUSE="minimal"

PATCHES=( "${FILESDIR}/networktest.patch" )
RDEPEND="
	!minimal? (
		>=dev-perl/IO-Socket-SSL-1.380.0
	)
	!<dev-perl/libwww-perl-6
	virtual/perl-Compress-Raw-Zlib
	virtual/perl-IO
	virtual/perl-IO-Compress
	dev-perl/URI
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
"
