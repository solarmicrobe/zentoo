# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} )

inherit python-r1

DESCRIPTION="Virtual for Python Imaging Library"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="jpeg tk"

RDEPEND="dev-python/pillow[jpeg?,tk?,${PYTHON_USEDEP}]"
