# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

MODULE_AUTHOR=PVANDRY
MY_PN=gettext
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}
inherit perl-module

DESCRIPTION="A Perl module for accessing the GNU locale utilities"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="sys-devel/gettext"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/compatibility-with-POSIX-module.diff )

# Disabling the tests - not ready for prime time - mcummings
#SRC_TEST="do"
