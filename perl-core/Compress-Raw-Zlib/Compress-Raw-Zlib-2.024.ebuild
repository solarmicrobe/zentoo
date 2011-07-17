# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

MODULE_AUTHOR=PMQS
inherit multilib perl-module

DESCRIPTION="Low-Level Interface to zlib compression library"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=sys-libs/zlib-1.2.2.1"
DEPEND="${RDEPEND}"
#	test? ( dev-perl/Test-Pod )"

SRC_TEST="do"

src_prepare() {
	use prefix || EPREFIX=
	perl-module_src_prepare

	cat <<-EOF > "${S}/config.in"
		BUILD_ZLIB = False
		INCLUDE = ${EPREFIX}/usr/include
		LIB = ${EPREFIX}/usr/$(get_libdir)

		OLD_ZLIB = False
		GZIP_OS_CODE = AUTO_DETECT
	EOF
}
