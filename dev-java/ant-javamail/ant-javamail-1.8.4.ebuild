# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

ANT_TASK_DEPNAME="--virtual javamail"

inherit ant-tasks

KEYWORDS="amd64"
IUSE=""

DEPEND="java-virtuals/javamail
	java-virtuals/jaf"
RDEPEND="${DEPEND}"

src_unpack() {
	ant-tasks_src_unpack all
	java-pkg_jar-from --virtual jaf
}
