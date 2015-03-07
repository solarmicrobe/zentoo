# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit multilib-build

DESCRIPTION="Virtual for MySQL client or database"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0/18"
KEYWORDS="amd64"
IUSE="embedded minimal static static-libs"

DEPEND=""
RDEPEND="|| (
	=dev-db/mariadb-10.0*[embedded=,minimal=,static=,static-libs=,${MULTILIB_USEDEP}]
	=dev-db/mysql-${PV}*[embedded=,minimal=,static=,static-libs=,${MULTILIB_USEDEP}]
	=dev-db/percona-server-${PV}*[embedded=,minimal=,static=,static-libs=,${MULTILIB_USEDEP}]
	=dev-db/mariadb-galera-10.0*[embedded=,minimal=,static=,static-libs=,${MULTILIB_USEDEP}]
	=dev-db/mysql-cluster-7.3*[embedded=,minimal=,static=,static-libs=,${MULTILIB_USEDEP}]
)"
