# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit java-pkg-2 user

DESCRIPTION="A distributed, column-oriented analytical datastore"
HOMEPAGE="https://github.com/metamx/druid"
SRC_URI="https://github.com/metamx/druid/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-java/maven-bin"
RDEPEND=">=virtual/jdk-1.6"

S="${WORKDIR}/druid-${P}"

pkg_setup() {
	java-pkg-2_pkg_setup
	enewgroup druid
	enewuser druid -1 /bin/sh /var/lib/druid druid
}

src_compile() {
	mvn -Duser.home="${T}/home" package || die "failed to build with maven"
}

src_install() {
	rm -rf examples || die "cannot remove examples"

	insinto /usr/share/${PN}/lib
	for jar in $(find "${S}" -name '*-selfcontained.jar'); do
		doins ${jar}
	done

	# init scripts
	for i in master broker compute realtime; do
		newinitd "${FILESDIR}"/druid.initd druid-${i}
		newconfd "${FILESDIR}"/druid-${i}.confd druid-${i}
	done

	keepdir /etc/druid
}
