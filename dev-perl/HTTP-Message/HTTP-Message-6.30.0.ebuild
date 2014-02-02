# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=GAAS
MODULE_VERSION=6.03
inherit perl-module

DESCRIPTION="Base class for Request/Response"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	!<dev-perl/libwww-perl-6
	virtual/perl-Compress-Raw-Zlib
	>=dev-perl/URI-1.10
	>=virtual/perl-Encode-2.12
	>=dev-perl/HTTP-Date-6.0.0
	>=dev-perl/Encode-Locale-1.0.0
	>=dev-perl/LWP-MediaTypes-6.0.0
	>=dev-perl/HTML-Parser-3.33
	>=virtual/perl-IO-Compress-2.021
	>=virtual/perl-MIME-Base64-2.1
"
DEPEND="${RDEPEND}"

SRC_TEST=online
