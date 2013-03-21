# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="ssl(+),xml(+)"

inherit distutils-r1

MY_P="gdata-${PV}"

DESCRIPTION="Python client library for Google data APIs"
HOMEPAGE="http://code.google.com/p/gdata-python-client/ http://pypi.python.org/pypi/gdata"
SRC_URI="http://gdata-python-client.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S="${WORKDIR}/${MY_P}"
