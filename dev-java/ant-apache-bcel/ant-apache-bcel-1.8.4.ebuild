# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

ANT_TASK_DEPNAME="bcel"

inherit ant-tasks

KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-java/bcel-5.1-r3:0"
RDEPEND="${DEPEND}"
