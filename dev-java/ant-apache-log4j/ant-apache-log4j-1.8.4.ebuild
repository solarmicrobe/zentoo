# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

ANT_TASK_DEPNAME="log4j"

inherit ant-tasks

KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-java/log4j-1.2.13-r2:0"
RDEPEND="${DEPEND}"
