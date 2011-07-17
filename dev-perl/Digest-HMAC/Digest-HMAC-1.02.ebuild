# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

MODULE_AUTHOR=GAAS
inherit perl-module

DESCRIPTION="Keyed Hashing for Message Authentication"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="virtual/perl-Digest-MD5
	dev-perl/Digest-SHA1"
DEPEND="${RDEPEND}"

SRC_TEST="do"
