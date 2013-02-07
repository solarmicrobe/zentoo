# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit xorg-2

DESCRIPTION="Library providing generic access to the PCI bus and devices"
KEYWORDS="amd64"
IUSE="minimal zlib"

DEPEND="!<x11-base/xorg-server-1.5
	zlib? ( sys-libs/zlib )"
RDEPEND="${DEPEND}
	sys-apps/hwids"

pkg_setup() {
	xorg-2_pkg_setup

	XORG_CONFIGURE_OPTIONS=(
		"$(use_with zlib)"
		"--with-pciids-path=${EPREFIX}/usr/share/misc"
	)
}

src_install() {
	xorg-2_src_install
	if ! use minimal; then
		dodir /usr/bin || die
		${BASH} "${AUTOTOOLS_BUILD_DIR:-${S}}/libtool" --mode=install "$(type -P install)" -c "${AUTOTOOLS_BUILD_DIR:-${S}}/scanpci/scanpci" "${ED}"/usr/bin || die
	fi
}
