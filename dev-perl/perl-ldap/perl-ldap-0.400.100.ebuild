# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

MODULE_AUTHOR=GBARR
MODULE_VERSION=0.4001
inherit perl-module

DESCRIPTION="A collection of perl modules which provide an object-oriented interface to LDAP servers."

SLOT="0"
KEYWORDS="amd64"
IUSE="sasl xml ssl"

RDEPEND="dev-perl/Convert-ASN1
	dev-perl/URI
	sasl? ( virtual/perl-Digest-MD5 dev-perl/Authen-SASL )
	xml? ( dev-perl/XML-Parser
			dev-perl/XML-SAX
			dev-perl/XML-SAX-Writer )
	ssl? ( >=dev-perl/IO-Socket-SSL-0.93 )"
DEPEND="${RDEPEND}"

#SRC_TEST=do
