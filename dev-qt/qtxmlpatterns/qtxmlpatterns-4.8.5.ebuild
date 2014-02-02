# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit qt4-build

DESCRIPTION="The XmlPatterns module for the Qt toolkit"
SLOT="4"
if [[ ${QT4_BUILD_TYPE} == live ]]; then
	KEYWORDS=""
else
	KEYWORDS="amd64"
fi
IUSE=""

DEPEND="
	~dev-qt/qtcore-${PV}[aqua=,debug=]
"
RDEPEND="${DEPEND}"

pkg_setup() {
	QT4_TARGET_DIRECTORIES="
		src/xmlpatterns
		tools/xmlpatterns
		tools/xmlpatternsvalidator"

	QT4_EXTRACT_DIRECTORIES="${QT4_TARGET_DIRECTORIES}
		include/QtCore
		include/QtNetwork
		include/QtXml
		include/QtXmlPatterns
		src/network
		src/xml
		src/corelib"

	QCONFIG_ADD="xmlpatterns"
	QCONFIG_DEFINE="QT_XMLPATTERNS"

	qt4-build_pkg_setup
}

src_configure() {
	myconf+=" -xmlpatterns"

	qt4-build_src_configure
}
