# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for command-line pagers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="|| ( sys-apps/less
	sys-apps/more
	sys-apps/most
	!prefix? ( sys-apps/util-linux )
	app-text/lv )"
