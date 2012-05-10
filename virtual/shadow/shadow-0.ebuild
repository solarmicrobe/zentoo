# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for user account management utilities"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# >=shadow-4-1 is required because of bug #367633 (user.eclass needs it).
DEPEND=""
RDEPEND="|| ( >=sys-apps/shadow-4.1 sys-apps/hardened-shadow )"