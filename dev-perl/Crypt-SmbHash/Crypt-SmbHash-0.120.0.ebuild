# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=BJKUIT
MODULE_VERSION=0.12
inherit perl-module

DESCRIPTION="LM/NT hashing, for Samba's smbpasswd entries"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-perl/Digest-MD4"
DEPEND="${RDEPEND}"
