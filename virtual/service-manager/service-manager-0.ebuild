# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for various service managers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="kernel_linux prefix"

RDEPEND="
	prefix? ( >=sys-apps/baselayout-prefix-2.2 )
	!prefix? (
		|| (
		sys-apps/openrc
		kernel_linux? ( || (
			sys-apps/systemd
			sys-process/runit
			virtual/daemontools
	) ) ) )"
DEPEND=""
