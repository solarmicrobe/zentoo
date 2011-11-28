# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

MODULE_AUTHOR=MSCHWARTZ
inherit perl-module

DESCRIPTION="map charsets from and to utf16 code"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

SRC_TEST="do"
PATCHES=( "${FILESDIR}"/0.112-no-scripts.patch )
