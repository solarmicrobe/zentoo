# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Virtual for MySQL client or database"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="-*"
IUSE="embedded minimal static"

DEPEND=""
RDEPEND="|| (
	=dev-db/mysql-${PV}*[embedded=,minimal=,static=]
)"
