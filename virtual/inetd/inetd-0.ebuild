# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for the internet super-server daemon"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="|| ( sys-apps/xinetd
		sys-apps/netkit-base
		sys-apps/ucspi-tcp
		dev-python/twisted-runner
		net-misc/ipsvd
		sys-freebsd/freebsd-usbin )"
