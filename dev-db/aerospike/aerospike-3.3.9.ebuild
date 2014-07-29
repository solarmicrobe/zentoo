# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 systemd

DESCRIPTION="Aerospike Database Server"
HOMEPAGE="https://github.com/aerospike/aerospike-server"

EGIT_REPO_URI="https://github.com/aerospike/aerospike-server.git"
EGIT_HAS_SUBMODULES=1
EGIT_COMMIT="${PV}-1"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-libs/openssl
	dev-lang/lua"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/common-Makefile.patch
	epatch "${FILESDIR}"/mod-lua-Makefile.patch
}

src_compile() {
	emake DISTDIR="${D}" LD_CRYPTO=shared
}

src_install() {
	dobin target/Linux-x86_64/bin/asd

	insinto /usr/lib/aerospike/udf/lua
	doins modules/lua-core/src/*.lua

	insinto /usr/lib/aerospike/udf/lua/external
	doins modules/lua-core/src/external/*.lua

	insinto /usr/lib/aerospike/udf/lua/ldt
	doins modules/lua-core/src/ldt/*.lua

	keepdir /var/lib/aerospike/smd
	keepdir /var/lib/aerospike/udf/lua

	insinto /etc/aerospike
	doins "${FILESDIR}"/aerospike.conf

	systemd_dounit "${FILESDIR}"/aerospike.service
}
