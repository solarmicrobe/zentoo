# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

# Force users doing their own patches to install their own tools
AUTOTOOLS_AUTO_DEPEND=no

inherit eutils toolchain-funcs autotools

DESCRIPTION="Linux kernel (2.4+) firewall, NAT and packet mangling tools"
HOMEPAGE="http://www.iptables.org/"
SRC_URI="http://iptables.org/projects/iptables/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="ipv6 netlink"

DEPEND="virtual/os-headers"
RDEPEND="netlink? ( net-libs/libnfnetlink )"

src_prepare() {
	# Only run autotools if user patched something
	epatch_user && eautoreconf || elibtoolize
}

src_configure() {
	sed -i \
		-e "/nfnetlink=[01]/s:=[01]:=$(use netlink && echo 1 || echo 0):" \
		configure
	econf \
		--sbindir=/sbin \
		--libexecdir=/$(get_libdir) \
		--enable-devel \
		--enable-libipq \
		--enable-shared \
		--enable-static \
		$(use_enable ipv6)
}

src_compile() {
	emake V=1 || die
}

src_install() {
	emake install DESTDIR="${D}" || die
	doman iptables-apply.8 || die
	dodoc INCOMPATIBILITIES iptables.xslt || die

	# all the iptables binaries are in /sbin, so might as well
	# put these small files in with them
	into /
	dosbin iptables-apply || die
	dosym iptables-apply /sbin/ip6tables-apply || die

	insinto /usr/include
	doins include/iptables.h $(use ipv6 && echo include/ip6tables.h) || die
	insinto /usr/include/iptables
	doins include/iptables/internal.h || die

	keepdir /var/lib/iptables
	newinitd "${FILESDIR}"/${PN}-1.3.2.init iptables || die
	newconfd "${FILESDIR}"/${PN}-1.3.2.confd iptables || die
	if use ipv6 ; then
		keepdir /var/lib/ip6tables
		newinitd "${FILESDIR}"/iptables-1.3.2.init ip6tables || die
		newconfd "${FILESDIR}"/ip6tables-1.3.2.confd ip6tables || die
	fi

	# Move important libs to /lib
	gen_usr_ldscript -a ip{4,6}tc ipq iptc xtables
	find "${D}" -type f -name '*.la' -exec rm -rf '{}' '+' || die "la removal failed"
}
