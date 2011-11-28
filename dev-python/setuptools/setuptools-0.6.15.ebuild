# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils eutils

MY_PN="distribute"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Distribute (fork of Setuptools) is a collection of extensions to Distutils"
HOMEPAGE="http://pypi.python.org/pypi/distribute"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="PSF-2.2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_P}"

DOCS="README.txt docs/easy_install.txt docs/pkg_resources.txt docs/setuptools.txt"
PYTHON_MODNAME="easy_install.py pkg_resources.py setuptools site.py"

src_prepare() {
	distutils_src_prepare

	epatch "${FILESDIR}/${PN}-0.6_rc7-noexe.patch"
	epatch "${FILESDIR}/distribute-0.6.12-disable_versioned_easy_install.patch"
	epatch "${FILESDIR}/distribute-0.6.12-fix_deprecation_warnings.patch"

	# Disable tests requiring network connection.
	rm -f setuptools/tests/test_packageindex.py
}

src_test() {
	# test_install_site_py fails with disabled byte-compiling in Python 2.7 / >=3.2.
	python_enable_pyc

	distutils_src_test

	python_disable_pyc
	find "(" -name "*.pyc" -o -name "*\$py.class" ")" -print0 | xargs -0 rm -f
	find -name "__pycache__" -print0 | xargs -0 rmdir
}

src_install() {
	DONT_PATCH_SETUPTOOLS="1" distutils_src_install
}
