# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython"

inherit distutils

DESCRIPTION="Python wrapper for the local database Sqlite"
HOMEPAGE="http://pysqlite.org/"
SRC_URI="mirror://sourceforge/pysqlite/pysqlite-${PV}.tar.gz"

LICENSE="pysqlite"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-db/sqlite:0"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

PYTHON_MODNAME="sqlite"

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}/examples || die
	doins -r examples/* || die
}
