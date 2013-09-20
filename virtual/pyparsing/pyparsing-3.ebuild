# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy2_0 )
inherit python-r1

DESCRIPTION="A virtual for pyparsing, for Python 2 & 3"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=dev-python/pyparsing-2.0.1:0[${PYTHON_USEDEP}]"
