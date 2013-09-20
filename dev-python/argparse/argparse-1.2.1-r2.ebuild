# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
# Other implementations ship argparse.
PYTHON_COMPAT=( python2_6 )

inherit distutils-r1

DESCRIPTION="An easy, declarative interface for creating command line tools"
HOMEPAGE="http://code.google.com/p/argparse/ http://pypi.python.org/pypi/argparse"
SRC_URI="http://argparse.googlecode.com/files/${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	COLUMNS=80 PYTHONPATH="${BUILD_DIR}/lib" \
		"${PYTHON}" test/test_argparse.py
}
