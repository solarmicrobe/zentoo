# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for SSH client and server"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="minimal"

DEPEND=""
RDEPEND="minimal? (
		|| ( net-misc/dropbear net-misc/openssh )
	)
	!minimal? (
		|| ( net-misc/openssh net-misc/dropbear )
	)"
