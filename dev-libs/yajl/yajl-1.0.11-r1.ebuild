# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils

DESCRIPTION="Small event-driven (SAX-style) JSON parser"
HOMEPAGE="http://lloyd.github.com/yajl/"
SRC_URI="http://github.com/lloyd/yajl/tarball/${PV} -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

IUSE=""

src_prepare() {
	cd "${WORKDIR}"/lloyd-${PN}-*
	S=$(pwd)

	epatch "${FILESDIR}"/${PN}-fix_static_linking.patch
}

src_test() {
	pushd "${CMAKE_BUILD_DIR}" > /dev/null
	emake test
	popd > /dev/null
}
