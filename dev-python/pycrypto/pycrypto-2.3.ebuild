# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils eutils

DESCRIPTION="Python Cryptography Toolkit"
HOMEPAGE="http://www.dlitz.net/software/pycrypto/ http://pypi.python.org/pypi/pycrypto"
SRC_URI="http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/${P}.tar.gz"

LICENSE="public-domain PSF-2.2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc +gmp"

RDEPEND="gmp? ( dev-libs/gmp )"
DEPEND="${RDEPEND}
	doc? ( dev-python/docutils >=dev-python/epydoc-3 )"

# Some tests fail with some limit of inlining of functions.
# Avoid warnings about breaking strict-aliasing rules.
PYTHON_CFLAGS=("2.* + -fno-inline-functions -fno-strict-aliasing")

DOCS="ACKS ChangeLog README TODO"
PYTHON_MODNAME="Crypto"

src_prepare() {
	distutils_src_prepare
	epatch "${FILESDIR}/${PN}-2.1.0-gmp.patch"
}

src_configure() {
	use gmp \
		&& export USE_GMP="1" \
		|| export USE_GMP="0"
}

src_compile() {
	distutils_src_compile

	if use doc; then
		einfo "Generation of documentation"
		rst2html.py Doc/pycrypt.rst > Doc/index.html
		PYTHONPATH="$(ls -d build-$(PYTHON --ABI -f)/lib.*)" epydoc --config=Doc/epydoc-config --exclude-introspect="^Crypto\.(Random\.OSRNG\.nt|Util\.winrandom)$" || die "Generation of documentation failed"
	fi
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml Doc/index.html || die "dohtml failed"
		dohtml Doc/apidoc/* || die "dohtml failed"
	fi
}
