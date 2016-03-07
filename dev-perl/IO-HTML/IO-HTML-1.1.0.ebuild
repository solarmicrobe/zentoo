# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=CJM
MODULE_VERSION=1.001
inherit perl-module

DESCRIPTION="Open an HTML file with automatic charset detection"

SLOT="0"
KEYWORDS="amd64"
IUSE="test"

RDEPEND="
	virtual/perl-Carp
	>=virtual/perl-Encode-2.100.0
	>=virtual/perl-Exporter-5.570.0
"
DEPEND="${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.300.0
	test? (
		virtual/perl-Scalar-List-Utils
		virtual/perl-File-Temp
		>=virtual/perl-Test-Simple-0.880.0
	)
"
# Scalar::Util

SRC_TEST="do parallel"
