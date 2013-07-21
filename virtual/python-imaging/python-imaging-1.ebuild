# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7,3_2,3_3} )

inherit python-r1

DESCRIPTION="Virtual for Python Imaging Library"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="tk"
REQUIRED_USE="
	python_targets_python2_5? (
		!python_targets_python3_2
		!python_targets_python3_3
	)
"

RDEPEND="
	python_targets_python2_5? ( dev-python/imaging[tk?,python_targets_python2_5(-)] )
	python_targets_python2_6? ( || (
		dev-python/pillow[tk?,python_targets_python2_6(-)]
		dev-python/imaging[tk?,python_targets_python2_6(-)]
	) )
	python_targets_python2_7? ( || (
		dev-python/pillow[tk?,python_targets_python2_7(-)]
		dev-python/imaging[tk?,python_targets_python2_7(-)]
	) )
	python_targets_python3_2? ( dev-python/pillow[tk?,python_targets_python3_2(-)] )
	python_targets_python3_3? ( dev-python/pillow[tk?,python_targets_python3_3(-)] )
"
