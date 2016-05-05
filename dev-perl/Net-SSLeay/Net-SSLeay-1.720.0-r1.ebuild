# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DIST_AUTHOR=MIKEM
DIST_VERSION=1.72
inherit multilib perl-module

DESCRIPTION="Perl extension for using OpenSSL"

LICENSE="openssl"
SLOT="0"
KEYWORDS="amd64"
IUSE="libressl test minimal examples"

RDEPEND="
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )
	virtual/perl-MIME-Base64
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? (
		!minimal? (
			dev-perl/Test-Exception
			dev-perl/Test-Warn
			dev-perl/Test-NoWarnings
		)
		virtual/perl-Test-Simple
	)
"
export OPTIMIZE="$CFLAGS"
export OPENSSL_PREFIX=${EPREFIX}/usr

src_prepare() {
	sed -i \
		-e "/\$opts->{optimize} = '-O2 -g';/d" \
		-e "s,\"\$prefix/lib\",\"\$prefix/$(get_libdir)\"," \
		inc/Module/Install/PRIVATE/Net/SSLeay.pm || die

	local my_test_control
	my_test_control=${DIST_TEST_OVERRIDE:-${DIST_TEST:-do parallel}}

	if use test; then
		perl_rm_files 't/local/01_pod.t' 't/local/02_pod_coverage.t' 't/local/kwalitee.t'
	fi
	if use test && has network ${my_test_control} ; then
		eapply "${FILESDIR}/${DIST_VERSION}-config-nettest-yes.patch"
	else
		eapply "${FILESDIR}/${DIST_VERSION}-config-nettest-no.patch"
	fi

	perl-module_src_prepare
}
src_install() {
	perl-module_src_install
	if use examples; then
		docompress -x /usr/share/doc/${PF}/examples
		insinto /usr/share/doc/${PF}/examples
		doins examples/*
	fi
}
