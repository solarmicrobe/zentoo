# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=MSCHWARTZ
MODULE_VERSION=0.112
inherit perl-module

DESCRIPTION="Map charsets from and to utf16 code"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

SRC_TEST="do"
PATCHES=( "${FILESDIR}"/0.112-no-scripts.patch )
