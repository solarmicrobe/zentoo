# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=RJBS
MODULE_VERSION=1.002
inherit perl-module

DESCRIPTION="Produce RFC 822 date strings"

SLOT="0"
KEYWORDS="amd64"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	test? (
		dev-perl/Test-Pod
		>=dev-perl/Test-Pod-Coverage-1.0.8
	)"

SRC_TEST=do
