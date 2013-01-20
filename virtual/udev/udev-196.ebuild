# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Virtual to select between sys-fs/udev and sys-fs/eudev"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="gudev hwdb introspection keymap selinux static-libs"

DEPEND=""
RDEPEND="|| ( ~sys-fs/udev-196[gudev?,hwdb?,introspection?,keymap?,selinux?,static-libs?]
	>=sys-fs/eudev-1_beta1[gudev?,hwdb?,introspection?,keymap?,selinux?,static-libs?] )"
