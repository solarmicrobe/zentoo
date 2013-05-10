# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2,3_3} pypy{1_8,1_9,2_0} )
inherit python-r1

DESCRIPTION="A virtual for the Python argparse module"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

setup_globals() {
	local flag

	RDEPEND="${PYTHON_DEPS}"
	for flag in python_targets_python{2_5,2_6,3_1}; do
		RDEPEND+=" ${flag}? ( dev-python/argparse[${flag}] )"
	done
}
setup_globals
