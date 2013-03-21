# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_P=PyChart-${PV}

DESCRIPTION="Python library for creating charts"
HOMEPAGE="http://home.gna.org/pychart/"
SRC_URI="http://download.gna.org/pychart/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="app-text/ghostscript-gpl"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
