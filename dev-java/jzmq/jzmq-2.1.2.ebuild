# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

WANT_AUTOCONF="2.5"
inherit autotools java-pkg-2

DESCRIPTION="Java language binding for ZeroMQ"
HOMEPAGE="http://www.zeromq.org/bindings:java"
SRC_URI="https://github.com/zeromq/jzmq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

COMMON_DEP="net-libs/zeromq"
RDEPEND=">=virtual/jre-1.6
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.6
	${COMMON_DEP}"

src_prepare() {
	eautoreconf
}

src_compile() {
	emake -j1
}

src_install() {
	emake DESTDIR="${D}" install

	# move jar into the right place
	java-pkg_dojar "${D}"/usr/share/java/zmq.jar
	rm -rf "${D}"/usr/share/java

	dodoc README.md ChangeLog
}