# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/mysql/mysql-5.5.ebuild,v 1.2 2010/03/23 14:48:06 darkside Exp $

EAPI="2"

DESCRIPTION="Virtual for MySQL client or database"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS=" amd64"
IUSE="embedded minimal static static-libs"

DEPEND=""
# TODO: add Drizzle and MariaDB here
RDEPEND="|| (
	=dev-db/mysql-${PV}*[embedded=,minimal=,static=,static-libs=]
	=dev-db/percona-server-${PV}*[embedded=,minimal=,static=,static-libs=]
)"
