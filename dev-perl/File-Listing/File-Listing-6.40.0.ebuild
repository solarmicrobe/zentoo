# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=GAAS
MODULE_VERSION=6.04
inherit perl-module

DESCRIPTION="Parse directory listings"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	!<dev-perl/libwww-perl-6
	>=dev-perl/HTTP-Date-6.0.0
"
DEPEND="${RDEPEND}"

SRC_TEST=do
