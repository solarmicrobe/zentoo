# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/numexpr/numexpr-2.3.1.ebuild,v 1.4 2014/02/21 23:08:23 bicatali Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Fast numerical array expression evaluator for Python and NumPy"
HOMEPAGE="https://github.com/pydata/numexpr"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	>=dev-python/numpy-1.7.1[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( ANNOUNCE.rst AUTHORS.txt README.rst RELEASE_NOTES.rst )

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_test() {
	cd "${BUILD_DIR}"/lib* || die
	"${PYTHON}" -c "import numexpr; numexpr.test()" || die
}
