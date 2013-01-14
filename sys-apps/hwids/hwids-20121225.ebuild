# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit udev

DESCRIPTION="Hardware (PCI, USB, OUI, IAB) IDs databases"
HOMEPAGE="https://github.com/gentoo/hwids"
SRC_URI="https://github.com/gentoo/hwids/archive/${P}.tar.gz"

LICENSE="|| ( GPL-2 BSD ) public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE="+udev"

DEPEND="udev? ( dev-lang/perl !=sys-fs/udev-196 )"
RDEPEND="!<sys-apps/pciutils-3.1.9-r2
	!<sys-apps/usbutils-005-r1"

S=${WORKDIR}/hwids-${P}

src_configure() {
	MAKEOPTS+=" UDEV=$(usex udev)"
	MAKEOPTS+=" DOCDIR=${EPREFIX}/usr/share/doc/${PF}"
	MAKEOPTS+=" MISCDIR=${EPREFIX}/usr/share/misc"
	MAKEOPTS+=" HWDBDIR=${EPREFIX}$(udev_get_udevdir)/hwdb.d"
	MAKEOPTS+=" DESTDIR=${D}"
}

pkg_postinst() {
	if use udev && [[ $(udevadm --help 2>&1) == *hwdb* ]]; then
		udevadm hwdb --update
	fi
}