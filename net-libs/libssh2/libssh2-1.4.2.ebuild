# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit autotools-utils

DESCRIPTION="Library implementing the SSH2 protocol"
HOMEPAGE="http://www.libssh2.org/"
SRC_URI="http://www.${PN}.org/download/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="gcrypt static-libs test zlib"

DEPEND="!gcrypt? ( dev-libs/openssl )
	gcrypt? ( dev-libs/libgcrypt )
	zlib? ( sys-libs/zlib )"
RDEPEND="${DEPEND}"

DOCS=( README )

PATCHES=( "${FILESDIR}"/${P}-pkgconfig.patch )

src_configure() {
	local myeconfargs

	if use gcrypt; then
		myeconfargs+=" --with-libgcrypt"
	else
		myeconfargs+=" --with-openssl"
	fi

	# Disable tests that require extra permissions (bug #333319)
	use test && export ac_cv_path_SSHD=

	myeconfargs+=(
		$(use_with zlib libz)
	)
	autotools-utils_src_configure
}
