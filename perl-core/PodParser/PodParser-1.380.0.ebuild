# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR=MAREKR
MODULE_VERSION=1.38
MY_PN=Pod-Parser
inherit perl-module

DESCRIPTION="Base class for creating POD filters and translators"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

SRC_TEST="do"
