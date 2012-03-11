# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=MHOSKEN
MODULE_VERSION=0.48
inherit perl-module

DESCRIPTION="module for compiling and altering fonts"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="virtual/perl-IO-Compress
	dev-perl/XML-Parser"
DEPEND="${RDEPEND}"

SRC_TEST="do"