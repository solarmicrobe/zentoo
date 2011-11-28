# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils

DESCRIPTION="Enterprise scalable realtime graphing"
HOMEPAGE="http://graphite.wikidot.com/"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SRC_SHA1="81b839d"
SRC_URI="https://github.com/zentoo/graphite/tarball/${SRC_SHA1} -> zentoo-graphite-${PVR}.tar.gz"

LICENSE="Apache-2.0"
KEYWORDS="amd64"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/django
	dev-python/django-tagging
	dev-python/pycairo
	dev-python/pyparsing
	dev-python/pytz
	dev-python/twisted
	~dev-python/whisper-${PV}
	~net-analyzer/carbon-${PV}"

S="${WORKDIR}"/zentoo-graphite-${SRC_SHA1}

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 -1 ${PN},carbon
}

src_prepare() {
	rm -f conf/graphite.wsgi.example
}

src_install() {
	distutils_src_install

	insinto /etc/graphite
	doins conf/*.example
	doins "${FILESDIR}"/graphite.conf

	insinto /usr/share/graphite
	doins -r "${S}"/webapp/content "${S}"/webapp/graphite/templates

	exeinto /usr/libexec/graphite
	doexe bin/build-index.sh

	keepdir /var/{lib,log,run}/graphite
	fowners graphite:graphite /var/{lib,log,run}/graphite
}
