# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=MSCHILLI
MODULE_VERSION=6.06
inherit perl-module

DESCRIPTION="Provide https support for LWP::UserAgent"
SRC_URI+=" https://dev.gentoo.org/~tove/distfiles/${CATEGORY}/${PN}/${PN}_ca-cert-r1.patch.gz"

SLOT="0"
IUSE=""
KEYWORDS="amd64"

RDEPEND="
	app-misc/ca-certificates
	>=dev-perl/libwww-perl-6.20.0
	>=dev-perl/Net-HTTP-6
	>=dev-perl/IO-Socket-SSL-1.540.0
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
"

PATCHES=(
	"${FILESDIR}"/${PN}-6.60.0-etcsslcerts.patch
	"${FILESDIR}"/${PN}-6.60.0-CVE-2014-3230.patch
)

SRC_TEST=online
