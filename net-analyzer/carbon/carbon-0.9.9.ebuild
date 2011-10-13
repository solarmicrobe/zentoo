# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils

DESCRIPTION="Backend data caching and persistence daemon for Graphite"
HOMEPAGE="http://graphite.wikidot.com/"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SRC_SHA1="240a798"
SRC_URI="https://github.com/zentoo/graphite/tarball/${SRC_SHA1} -> zentoo-graphite-${PVR}.tar.gz"

LICENSE="Apache-2.0"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/twisted
	dev-python/txAMQP
	~dev-python/whisper-${PV}"

S="${WORKDIR}"/zentoo-graphite-${SRC_SHA1}/carbon

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 -1 ${PN}
}

src_prepare() {
	rm -f setup.cfg || die
}

src_install() {
	distutils_src_install
	rm -rf "${D}"/usr/conf || die

	insinto /etc/${PN}
	doins "${FILESDIR}"/*.conf

	newinitd "${FILESDIR}"/carbon-cache.initd carbon-cache

	keepdir /var/{lib,log}/carbon
	keepdir /var/lib/carbon/{whisper,rrd}

	fperms 0775 /var/lib/carbon

	fowners carbon:carbon /var/{lib,log}/carbon
	fowners carbon:carbon /var/lib/carbon/{whisper,rrd}
}
