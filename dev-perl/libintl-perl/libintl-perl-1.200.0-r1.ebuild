# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=GUIDO
MODULE_VERSION=1.20
inherit perl-module

DESCRIPTION="High-Level Interface to Uniforum Message Translation"
HOMEPAGE="http://guido-flohr.net/projects/libintl-perl ${HOMEPAGE}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

SRC_TEST=do

src_test() {
	if grep -q '^de_' <( locale -a ) ; then
		if grep -q '^de_AT$' <( locale -a ) ; then
			perl-module_src_test
		else
			ewarn "Skipping tests, known broken with de_ and without de_AT"
		fi
	else
		perl-module_src_test
	fi
}