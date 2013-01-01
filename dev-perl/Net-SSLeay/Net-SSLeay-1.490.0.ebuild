# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=MIKEM
MODULE_VERSION=1.49
inherit multilib perl-module

DESCRIPTION="Net::SSLeay module for perl"

LICENSE="openssl"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}"
#	test? ( dev-perl/Test-Exception
#		dev-perl/Test-Warn
#		dev-perl/Test-NoWarnings )"

#SRC_TEST=do

export OPTIMIZE="$CFLAGS"
export OPENSSL_PREFIX=${EPREFIX}/usr

src_prepare() {
	sed -i \
		-e "/\$opts->{optimize} = '-O2 -g';/d" \
		-e "s,\"\$prefix/lib\",\"\$prefix/$(get_libdir)\"," \
		inc/Module/Install/PRIVATE/Net/SSLeay.pm || die
	perl-module_src_prepare
}
