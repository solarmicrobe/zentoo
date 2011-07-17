# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MODULE_AUTHOR=NANIS
inherit perl-module

DESCRIPTION="Crypt::SSLeay module for perl"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# Disabling tests for now. Opening a port always leads to mixed results for
# folks - bug 59554
# nb. Re-enabled tests, seem to be better written now, keeping an eye on bugs
# for this though.
SRC_TEST="do"

DEPEND=">=dev-libs/openssl-0.9.7c
	virtual/perl-MIME-Base64"
RDEPEND="${DEPEND}"
# PDEPEND: circular dependencies bug #144761
PDEPEND="dev-perl/libwww-perl"

export OPTIMIZE="${CFLAGS}"
myconf="--lib=${EPREFIX}/usr"
