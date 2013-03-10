# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit linux-image

DESCRIPTION="Zentoo Kernel Image"
HOMEPAGE="http://www.zentoo.org"

BASE_URI="http://www.zentoo.org/downloads"
SRC_URI="amd64? ( ${BASE_URI}/amd64/linux/linux-${PV}-gentoo.tar.xz )"

LICENSE="GPL-2"
KEYWORDS="amd64"
