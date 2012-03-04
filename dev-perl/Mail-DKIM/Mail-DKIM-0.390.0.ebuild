# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=JASLONG
MODULE_VERSION=0.39
inherit perl-module

DESCRIPTION="Mail::DKIM - Signs/verifies Internet mail using DKIM message signatures"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-perl/Crypt-OpenSSL-RSA-0.24
	virtual/perl-Digest-SHA
	virtual/perl-MIME-Base64
	dev-perl/Net-DNS
	dev-perl/MailTools"
RDEPEND="${DEPEND}"

SRC_TEST="do"

src_test(){
	# disable online tests
	for test in policy public_key verifier ; do
		mv "${S}"/t/${test}.t{,.disable}
	done
	perl-module_src_test
}
