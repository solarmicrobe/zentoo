# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils

MY_PN=${PN}-server
MY_P=${MY_PN}-${PV/_/}

DESCRIPTION="Daemon that forwards system logs to MongoDB databases"
HOMEPAGE="http://www.graylog2.org/"
SRC_URI="http://github.com/downloads/Graylog2/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="virtual/jdk"
RDEPEND="virtual/jre"

S="${WORKDIR}/${MY_P}"

src_install() {
	insinto /etc
	newins graylog2.conf.example graylog2.conf
	fperms 600 /etc/graylog2.conf

	insinto /usr/share/graylog2
	doins graylog2-server.jar

	newinitd "${FILESDIR}/${PN}.initd" ${PN}
}
