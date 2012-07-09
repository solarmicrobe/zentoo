# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for JDK"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="1.6"
KEYWORDS="amd64"
IUSE=""

# icedtea-bin-1* is old versioning scheme of icedtea-bin-6*
X86_OPTS="|| (
		=dev-java/icedtea-bin-6*
		=dev-java/sun-jdk-1.6.0*
	)"

RDEPEND="|| (
		amd64? ( ${X86_OPTS} )
	)"
DEPEND=""
