# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit java-pkg-2 user versionator

MY_P=${PN}-$(replace_version_separator 3 -)

DESCRIPTION="Nexus is a maven repository manager"
HOMEPAGE="http://www.sonatype.org/nexus/"
SRC_URI="http://www.sonatype.org/downloads/${MY_P}-bundle.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.6
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.6
	${COMMON_DEP}"

S="${WORKDIR}"/${MY_P}

pkg_setup() {
	enewgroup nexus
	enewuser nexus -1 /bin/bash /opt/nexus nexus
}

src_compile() {
	: # do nothing
}

src_install() {
	# move binary blob to /opt/nexus
	dodir /opt
	mv "${S}" "${D}"/opt/${PN} || die

	# but keep data and logs in the correct place
	keepdir /var/{lib,log}/${PN}
	rm -rf "${D}"/opt/${PN}/logs || die
	ln -s /var/log/${PN} "${D}"/opt/nexus/logs || die

	# for /var/lib/nexus config
	cp "${FILESDIR}"/nexus.properties "${D}"/opt/nexus/conf/nexus.properties || die

	# nexus user owns everything
	fowners -R nexus:nexus /{opt,var/lib,var/log}/${PN}

	# sane init script
	newinitd "${FILESDIR}/nexus.initd" ${PN}
}
