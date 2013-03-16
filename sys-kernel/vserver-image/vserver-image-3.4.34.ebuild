# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

VSPV="2.3.3.9"

inherit linux-image

DESCRIPTION="Zentoo Kernel Image with Linux-VServer patch"
HOMEPAGE="http://www.zentoo.org"

BASE_URI="http://www.zentoo.org/downloads"
SRC_URI="amd64? ( ${BASE_URI}/amd64/linux/linux-${PV}-vs${VSPV}.tar.xz )"

LICENSE="GPL-2"
KEYWORDS="amd64"
