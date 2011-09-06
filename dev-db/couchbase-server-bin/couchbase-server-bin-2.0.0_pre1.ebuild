# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="NoSQL database based on memcached and couchdb"
HOMEPAGE="http://www.couchbase.org"
SRC_URI="http://www.zentoo.org/distfiles/couchbase-server-community_x86_64_${PV}.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/openssl:0.9.8
	dev-libs/cyrus-sasl"

S="${WORKDIR}"/couchbase-server-community_x86_64_${PV}

pkg_setup() {
	enewgroup couchbase
	enewuser couchbase -1 -1 /opt/couchbase couchbase
}

src_install() {
	dodir /opt
	mv "${S}"/opt/couchbase "${D}"/opt/couchbase
	fowners couchbase:couchbase -R /opt/couchbase

	newinitd "${FILESDIR}"/couchbase-server.initd couchbase-server
	newconfd "${FILESDIR}"/couchbase-server.confd couchbase-server
}
