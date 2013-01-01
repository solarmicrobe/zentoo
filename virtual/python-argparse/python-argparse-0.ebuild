# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2,3_3} pypy{1_8,1_9} jython2_5 )
inherit python-r1

DESCRIPTION="A virtual for the Python argparse module"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

setup_globals() {
	local i

	RDEPEND=
	for i in "${PYTHON_COMPAT[@]}"; do
		case "${i}" in
			python2_5|python2_6|jython2_5)
				# Note: add USE-deps when dev-python/argparse starts
				# supporting PYTHON_TARGETS
				RDEPEND+=" python_targets_${i}? ( dev-python/argparse )"
				;;
			*)
				;;
		esac
	done
}
setup_globals
