# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit scons-utils multilib

DESCRIPTION="C Driver for MongoDB"
HOMEPAGE="https://github.com/mongodb/mongo-c-driver"
SRC_URI="https://github.com/mongodb/mongo-c-driver/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/mongodb-mongo-c-driver-013fe75

src_configure() {
	myesconsargs=(
		--c99
		--addrinfo
		--install-library-path="${D}"/usr/$(get_libdir)
		--install-include-path="${D}"/usr/include
	)
}

src_compile() {
	escons
}

src_install() {
	dodir /usr/$(get_libdir) /usr/include

	# SConstruct is really broken
	for lib in libmongoc libbson; do
		cp ${lib}.so "${D}"/usr/$(get_libdir)/${lib}.so.0.6.0 || die
		dosym ${lib}.so.0.6.0 /usr/$(get_libdir)/${lib}.so.0.6
		dosym ${lib}.so.0.6 /usr/$(get_libdir)/${lib}.so
	done

	cp src/{bson,mongo}.h "${D}"/usr/include || die
}
