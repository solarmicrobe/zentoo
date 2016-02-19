# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Display a histogram of diff changes"
HOMEPAGE="http://invisible-island.net/diffstat/"
SRC_URI="ftp://invisible-island.net/diffstat/${P}.tgz"

LICENSE="HPND"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_configure() {
	# We can drop this once a new release is made w/newer autotools.
	export CONFIG_SHELL="/bin/bash" #529744
	default
}
