# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Python Cryptography Toolkit"
HOMEPAGE="http://www.dlitz.net/software/pycrypto/ http://pypi.python.org/pypi/pycrypto"
SRC_URI="http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/${P}.tar.gz"

LICENSE="PSF-2 public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc +gmp"

RDEPEND="gmp? ( dev-libs/gmp )"
DEPEND="${RDEPEND}
	doc? ( dev-python/docutils
		>=dev-python/epydoc-3 )"

python_configure_all() {
	# the configure does not interact with python in any way,
	# it just sets up the C header file.
	econf \
		$(use_with gmp) \
		--without-mpir
}

python_compile_all() {
	if use doc; then
		rst2html.py Doc/pycrypt.rst > Doc/index.html
		epydoc --config=Doc/epydoc-config --exclude-introspect="^Crypto\.(Random\.OSRNG\.nt|Util\.winrandom)$" || die
	fi
}

python_test() {
	esetup.py test
}

python_install_all() {
	local DOCS=( ACKS ChangeLog README TODO )
	use doc && local HTML_DOCS=( Doc/apidoc/. Doc/index.html )

	distutils-r1_python_install_all
}