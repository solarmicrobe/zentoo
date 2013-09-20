# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} pypy2_0 )

inherit distutils-r1

DESCRIPTION="Python Module for handling IEEE 754 floating point special values"
HOMEPAGE="http://chaco.bst.rochester.edu:8080/statcomp/projects/RStatServer/fpconst/ http://pypi.python.org/pypi/fpconst http://sourceforge.net/projects/rsoap/files/"
SRC_URI="mirror://sourceforge/rsoap/${P}.tar.gz"

KEYWORDS="amd64"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DEPEND=""
RDEPEND=""

DOCS=( CHANGELOG README pep-0754.txt )

python_test() {
	"${PYTHON}" -m fpconst || die "Self-tests fail with ${EPYTHON}"
}
