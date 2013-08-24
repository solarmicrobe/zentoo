# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit autotools eutils linux-info versionator flag-o-matic

DESCRIPTION="Linux Containers userspace utilities"
HOMEPAGE="http://lxc.sourceforge.net/"
SRC_URI="http://lxc.sourceforge.net/download/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="sys-libs/libcap"

DEPEND="${RDEPEND}
	>=sys-kernel/linux-headers-3.2"

RDEPEND="${RDEPEND}
	sys-apps/util-linux
	app-misc/pax-utils
	virtual/awk"

DOCS=(AUTHORS CONTRIBUTING MAINTAINERS TODO README doc/FAQ.txt)

S="${WORKDIR}"/lxc-90341b9e39561e37797777a34d0589c14c0c2a68

src_prepare() {
	eautoreconf
}

src_configure() {
	append-flags -fno-strict-aliasing

	econf \
		--localstatedir=/var \
		--bindir=/usr/sbin \
		--docdir=/usr/share/doc/${PF} \
		--with-config-path=/etc/lxc \
		--with-rootfs-path=/usr/lib/lxc/rootfs \
		--disable-apparmor
}

src_install() {
	default

	keepdir /etc/lxc
	keepdir /usr/lib/lxc/rootfs
	keepdir /var/log/lxc

	find "${D}" -name '*.la' -delete
}
