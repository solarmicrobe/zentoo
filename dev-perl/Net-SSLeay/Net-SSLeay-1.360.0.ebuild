# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=FLORA
MODULE_VERSION=1.36
inherit perl-module

DESCRIPTION="Net::SSLeay module for perl"

LICENSE="openssl"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}"
#	test? ( dev-perl/Test-Exception
#		dev-perl/Test-Warn
#		dev-perl/Test-NoWarnings )"

#SRC_TEST=do

export OPTIMIZE="$CFLAGS"
export OPENSSL_PREFIX=${EPREFIX}/usr
