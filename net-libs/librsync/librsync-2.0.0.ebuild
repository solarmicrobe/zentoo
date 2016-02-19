# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Remote delta-compression library"
HOMEPAGE="http://librsync.sourcefrog.net/"
SRC_URI="https://github.com/librsync/librsync/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-libs/popt"
DEPEND="${RDEPEND}"

src_prepare() {
	# isprefix_test does not work in portage environment
	sed -i '169 s/^/#/' CMakeLists.txt || die

	# fix compiling with multilib-strict feature enabled
	sed -i "242 s/lib/$(get_libdir)/" CMakeLists.txt || die

	cmake-utils_src_prepare
}
