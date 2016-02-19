# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4,5} pypy )

inherit distutils-r1

DESCRIPTION="Simple generic functions for Python"
HOMEPAGE="https://pypi.python.org/pypi/simplegeneric"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	app-arch/unzip
	dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

python_test() {
	esetup.py test
}
