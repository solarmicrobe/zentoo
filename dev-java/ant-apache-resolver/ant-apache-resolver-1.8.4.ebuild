# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

ANT_TASK_DEPNAME="xml-commons-resolver"

inherit ant-tasks

KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-java/xml-commons-resolver-1.2:0"
RDEPEND="${DEPEND}"
