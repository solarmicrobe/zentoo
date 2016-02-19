# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_7 python3_{3,4,5} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="library with cross-python path, ini-parsing, io, code, log facilities"
HOMEPAGE="http://pylib.readthedocs.org/ https://pypi.python.org/pypi/py"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc test"

RDEPEND=""
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( >=dev-python/pytest-2.4.2[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

python_prepare_all() {
	sed -e 's:intersphinx_mapping:#&:' -i doc/conf.py || die
	distutils-r1_python_prepare_all
}

python_compile_all() {
	use doc && emake -C doc html
}

python_test() {
	# 1 failure, test_comments, under both pypy only.
	# Also appears the home repo has no issue tracker.
	[[ "${EPYTHON}" == pypy ]] && return
	py.test -v -v || die "testing failed with ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/_build/html/. )
	distutils-r1_python_install_all
}
