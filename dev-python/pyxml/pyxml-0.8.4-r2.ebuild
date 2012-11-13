# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython 2.7-pypy-*"

inherit distutils eutils

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

DOCS="ANNOUNCE CREDITS doc/*.txt"
PYTHON_MODNAME="_xmlplus"

src_prepare(){
	distutils_src_prepare

	epatch "${FILESDIR}/${P}-python-2.6.patch"

	# Delete internal copy of old version of unittest module.
	rm -f test/unittest.py
}

src_compile() {
	local myconf

	# if you want to use 4Suite, then their XSLT/XPATH is
	# better according to the docs
	if has_version "dev-python/4suite"; then
		myconf="--without-xslt --without-xpath"
	fi

	# use the already-installed shared copy of libexpat
	distutils_src_compile --with-libexpat="${EPREFIX}/usr" ${myconf}
}
src_test() {
	cd test
	testing() {
		PYTHONPATH="$(ls -d ../build-${PYTHON_ABI}/lib.*)" "$(PYTHON)" regrtest.py
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	doman doc/man/*
	if use doc; then
		dohtml -A api,web -r doc/*
		insinto /usr/share/doc/${PF} && doins doc/*.tex
	fi
	use examples && cp -r demo "${ED}usr/share/doc/${PF}"
}
