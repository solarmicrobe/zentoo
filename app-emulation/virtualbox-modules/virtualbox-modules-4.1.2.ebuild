# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# XXX: the tarball here is just the kernel modules split out of the binary
#      package that comes from virtualbox-bin

EAPI=2

inherit eutils linux-mod

DESCRIPTION="Kernel Modules for Virtualbox"
HOMEPAGE="http://www.virtualbox.org/"
SRC_URI="http://dev.gentoo.org/~polynomial-c/virtualbox/vbox-kernel-module-src-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

S="${WORKDIR}"

BUILD_TARGETS="all"
BUILD_TARGET_ARCH="${ARCH}"
MODULE_NAMES="vboxdrv(misc:${S}) vboxnetflt(misc:${S}) vboxnetadp(misc:${S}) vboxpci(misc:${S})"

pkg_setup() {
	# check for kernel options to support PCI passthrough (since 2.6.31)
	CONFIG_CHECK="~IOMMU_SUPPORT ~DMAR ~PCI_STUB"
	linux-mod_pkg_setup

	BUILD_PARAMS="KERN_DIR=${KV_DIR} KERNOUT=${KV_OUT_DIR}"
	enewgroup vboxusers
}

src_prepare() {
	grep -lR linux/autoconf.h *  | xargs sed -i -e 's:<linux/autoconf.h>:<generated/autoconf.h>:'
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
	elog "Starting with the 3.x release new kernel modules were added,"
	elog "be sure to load all the needed modules."
	elog ""
	elog "Please add \"vboxdrv\", \"vboxnetflt\" and \"vboxnetadp\" to:"
	if has_version sys-apps/openrc; then
		elog "/etc/conf.d/modules"
	else
		elog "/etc/modules.autoload.d/kernel-${KV_MAJOR}.${KV_MINOR}"
	fi
}
