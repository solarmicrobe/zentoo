# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MODULE_AUTHOR=DAGOLDEN
MODULE_VERSION=0.3800
inherit perl-module

DESCRIPTION="Build and install Perl modules"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	>=virtual/perl-CPAN-Meta-2.110.420
	>=virtual/perl-Parse-CPAN-Meta-1.440.100
	>=virtual/perl-Module-Metadata-1.0.2
	>=virtual/perl-Perl-OSType-1
	>=virtual/perl-ExtUtils-CBuilder-0.27
	>=virtual/perl-ExtUtils-ParseXS-2.22.05
	>=virtual/perl-Archive-Tar-1.09
	>=virtual/perl-Test-Harness-3.16
	>=virtual/perl-version-0.87
"
RDEPEND="${DEPEND}"

SRC_TEST="do"
