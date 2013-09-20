# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1 eutils

MY_P=${P/pyxml/PyXML}

DESCRIPTION="A collection of libraries to process XML with Python"
HOMEPAGE="http://pyxml.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="BSD CNRI MIT PSF-2 public-domain"
# Other licenses:
# BeOpen Python Open Source License Agreement Version 1
# Zope Public License (ZPL) Version 1.0
SLOT="0"
KEYWORDS="amd64"
IUSE="doc examples"

DEPEND=">=dev-libs/expat-1.95.6"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

python_prepare_all() {
	local PATCHES=(
		"${FILESDIR}/${P}-python-2.6.patch"
	)

	# Delete internal copy of old version of unittest module.
	rm -f test/unittest.py

	distutils-r1_python_prepare_all
}

python_compile() {
	# use the already-installed shared copy of libexpat
	distutils-r1_python_compile --with-libexpat="${EPREFIX}/usr"
}

python_test() {
	cd test || die
	"${PYTHON}" regrtest.py || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	local DOCS=( ANNOUNCE CREDITS doc/*.txt )

	distutils-r1_python_install_all

	doman doc/man/*
	if use doc; then
		dohtml -A api,web -r doc/*
		dodoc doc/*.tex
	fi
	use examples && dodoc -r demo
}
