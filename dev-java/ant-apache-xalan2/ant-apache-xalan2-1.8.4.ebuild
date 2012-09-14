# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

ANT_TASK_DEPNAME="xalan"

inherit ant-tasks

KEYWORDS="amd64"
IUSE=""

DEPEND="dev-java/xalan"
RDEPEND="${DEPEND}"

src_unpack() {
	ant-tasks_src_unpack all
}
