# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=MAKAMAKA
MODULE_VERSION=2.90
inherit perl-module

DESCRIPTION="JSON (JavaScript Object Notation) encoder/decoder"

SLOT="0"
KEYWORDS="amd64"
IUSE="test"

DEPEND="
	virtual/perl-ExtUtils-MakeMaker
	test? ( virtual/perl-Test-Simple )
"

SRC_TEST="do"
