# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} pypy2_0 )

inherit distutils-r1

MY_P="Pyrex-${PV}"

DESCRIPTION="A language for writing Python extension modules"
HOMEPAGE="http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/"
SRC_URI="http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="examples"

S="${WORKDIR}/${MY_P}"

DEPEND=""
RDEPEND=""
DOCS=( CHANGES.txt README.txt ToDo.txt USAGE.txt )

python_install_all() {
	distutils-r1_python_install_all

	dohtml -A c -r Doc/.

	if use examples; then
		dodoc -r Demos
		docompress -x /usr/share/doc/${PF}/Demos
	fi
}
