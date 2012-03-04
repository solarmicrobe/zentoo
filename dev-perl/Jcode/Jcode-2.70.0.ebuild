# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=DANKOGAI
MODULE_VERSION=2.07
inherit perl-module

DESCRIPTION="Japanese transcoding module for Perl"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=virtual/perl-MIME-Base64-2.1"
DEPEND="${RDEPEND}"

SRC_TEST="do"
