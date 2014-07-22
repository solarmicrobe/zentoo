# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="scaling, counting, bloom filter library"
HOMEPAGE="https://github.com/bitly/dablooms"
SRC_URI="https://github.com/bitly/dablooms/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake prefix=/usr CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

src_install() {
	emake prefix=/usr CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" DESTDIR="${D}" install
}
