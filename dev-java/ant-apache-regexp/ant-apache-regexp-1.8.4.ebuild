# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

ANT_TASK_DEPNAME="jakarta-regexp-1.4"

inherit ant-tasks

KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-java/jakarta-regexp-1.4-r1:1.4"
RDEPEND="${DEPEND}"
