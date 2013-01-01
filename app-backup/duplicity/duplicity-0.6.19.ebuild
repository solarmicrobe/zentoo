# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython 2.7-pypy-*"

inherit distutils

DESCRIPTION="Secure backup system using gnupg to encrypt data"
HOMEPAGE="http://www.nongnu.org/duplicity/"
SRC_URI="http://code.launchpad.net/${PN}/0.6-series/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="s3"

DEPEND="
	net-libs/librsync
	app-crypt/gnupg
"
RDEPEND="${DEPEND}
	dev-python/paramiko
	>=dev-python/pexpect-2.1
	>=dev-python/py-gnupg-0.3.2
	s3? ( dev-python/boto )
"

src_prepare() {
	distutils_src_prepare
	sed -i -r "s/'COPYING',//" setup.py || die "Couldn't remove unnecessary COPYING file."
}
