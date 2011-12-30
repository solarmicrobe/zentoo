# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MODULE_AUTHOR=DAGOLDEN
MODULE_VERSION=1.4401
inherit perl-module

DESCRIPTION="Parse META.yml and other similar CPAN metadata files"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	>=virtual/perl-CPAN-Meta-YAML-0.2
	>=virtual/perl-JSON-PP-2.271.30
"
DEPEND="${RDEPEND}"

SRC_TEST=do
