# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit java-virtuals-2

DESCRIPTION="Virtual for JavaBeans Activation Framework (JAF)"
HOMEPAGE="http://www.gentoo.org"
SRC_URI=""

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="|| (
			>=virtual/jre-1.6
			dev-java/sun-jaf:0
			dev-java/gnu-jaf:1
		)
		>=dev-java/java-config-2.1.8
		"

JAVA_VIRTUAL_PROVIDES="sun-jaf gnu-jaf-1"
JAVA_VIRTUAL_VM=">=virtual/jre-1.6"
