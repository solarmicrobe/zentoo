# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/xlrd/xlrd-0.9.2.ebuild,v 1.6 2014/03/03 23:48:29 pacho Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy2_0 )

inherit distutils-r1

DESCRIPTION="Library for developers to extract data from Microsoft Excel (tm) spreadsheet files"
HOMEPAGE="http://pypi.python.org/pypi/xlrd"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc examples"

DEPEND=""
RDEPEND=""

src_prepare() {
	distutils-r1_src_prepare
	# add shebang to runxlrd.py
	sed -i -e '1i#!/usr/bin/encompdoc.html  xlrd.htmlv python' scripts/runxlrd.py || die
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		dohtml ${PN}/doc/{compdoc.html,xlrd.html}
	fi

	if use examples; then
		docompress -x usr/share/doc/${P}/examples/
		insinto usr/share/doc/${P}/examples
		doins ${PN}/examples/*
	fi
}