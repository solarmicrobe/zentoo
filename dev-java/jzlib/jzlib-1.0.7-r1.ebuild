# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="JZlib is a re-implementation of zlib in pure Java."
HOMEPAGE="http://www.jcraft.com/jzlib/"
SRC_URI="http://www.jcraft.com/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=virtual/jdk-1.4"
RDEPEND=">=virtual/jre-1.4"

src_unpack() {
	unpack ${A}
	cp "${FILESDIR}/jzlib_build.xml" "${S}/build.xml" || die
	mkdir "${S}/src" || die
	mv "${S}/com/" "${S}/src/" || die
}

EANT_BUILD_TARGET="dist"

src_install() {
	java-pkg_newjar dist/lib/jzlib*.jar jzlib.jar
	use doc && java-pkg_dojavadoc javadoc
	use source && java-pkg_dosrc src
	dodoc README ChangeLog || die
}