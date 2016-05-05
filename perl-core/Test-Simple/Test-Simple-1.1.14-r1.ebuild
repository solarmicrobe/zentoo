# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DIST_AUTHOR=EXODIST
DIST_VERSION=1.001014
inherit perl-module

DESCRIPTION="Basic utilities for writing tests"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	!<dev-perl/Test-Tester-0.114.0
	!<dev-perl/Test-use-ok-0.160.0"
DEPEND="${RDEPEND}"

mydoc="rfc*.txt"
