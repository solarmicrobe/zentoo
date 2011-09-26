# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
SCONS_MIN_VERSION="1.2.0"

inherit eutils multilib scons-utils versionator flag-o-matic

MY_P=${PN}-src-r${PV/_rc/-rc}

DESCRIPTION="A high-performance, open source, schema-free document-oriented database"
HOMEPAGE="http://www.mongodb.org"
SRC_URI="http://downloads.mongodb.org/src/${MY_P}.tar.gz"

LICENSE="AGPL-3 Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+static-libs"

DEPEND="dev-libs/boost
	net-libs/libpcap"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

pkg_setup() {
	enewgroup mongodb
	enewuser mongodb -1 -1 /var/lib/${PN} mongodb

	# TODO: does not compile with full compiler name
	# see https://jira.mongodb.org/browse/SERVER-3827 for details
	#scons_opts="--cxx=$(tc-getCXX) --sharedclient --usesm"

	# TODO: also broken with as-needed ... sigh
	append-ldflags $(no-as-needed)
}

src_prepare() {
	epatch "${FILESDIR}/${PN}-2.0-fix-scons.patch"
}

src_compile() {
	escons all
}

src_install() {
	escons --full --nostrip install --prefix="${D}"/usr

	use static-libs || rm "${D}/usr/$(get_libdir)/libmongoclient.a"

	for x in /var/{lib,log,run}/${PN}; do
		keepdir "${x}"
		fowners mongodb:mongodb "${x}"
	done

	doman debian/mongo*.1

	newinitd "${FILESDIR}/${PN}.initd" ${PN}
	newconfd "${FILESDIR}/${PN}.confd" ${PN}
	newinitd "${FILESDIR}/${PN/db/s}.initd" ${PN/db/s}
	newconfd "${FILESDIR}/${PN/db/s}.confd" ${PN/db/s}
}

src_test() {
	escons test
	"${S}"/test --dbpath=unittest || die
}
