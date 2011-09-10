# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

GITHUB_SHA1="bdaa203"

DESCRIPTION="Improved MySQL Graphs for Munin"
HOMEPAGE="https://github.com/kjellm/munin-mysql"
SRC_URI="https://github.com/kjellm/munin-mysql/tarball/${GITHUB_SHA1} -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="contrib"

DEPEND=""
RDEPEND="${DEPEND}
	net-analyzer/munin"

S="${WORKDIR}"/kjellm-munin-mysql-${GITHUB_SHA1}

src_prepare() {
	perl-module_src_prepare
	rm Makefile
}

src_install() {
	SITE_LIB=$(perl -V:installsitelib | cut -d\' -f2)

	exeinto /usr/libexec/munin/plugins
	doexe mysql

	insinto /etc/munin/plugin-conf.d
	doins mysql.conf

	insinto ${SITE_LIB}/Munin/MySQL/Graph
	doins lib/Munin/MySQL/Graph/*.pm
	use contrib && doins contrib/Munin/MySQL/Graph/*.pm
}
