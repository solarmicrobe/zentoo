# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils flag-o-matic prefix systemd

DESCRIPTION="File transfer program to keep remote files into sync"
HOMEPAGE="http://rsync.samba.org/"
SRC_URI="http://rsync.samba.org/ftp/rsync/src/${P/_/}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="acl iconv ipv6 static xattr"

LIB_DEPEND="acl? ( virtual/acl[static-libs(+)] )
	xattr? ( kernel_linux? ( sys-apps/attr[static-libs(+)] ) )
	>=dev-libs/popt-1.5[static-libs(+)]"
RDEPEND="!static? ( ${LIB_DEPEND//\[static-libs(+)]} )
	iconv? ( virtual/libiconv )"
DEPEND="${RDEPEND}
	static? ( ${LIB_DEPEND} )"

S=${WORKDIR}/${P/_/}

src_prepare() {
	epatch_user
}

src_configure() {
	use static && append-ldflags -static
	econf \
		--without-included-popt \
		$(use_enable acl acl-support) \
		$(use_enable xattr xattr-support) \
		$(use_enable ipv6) \
		$(use_enable iconv) \
		--with-rsyncd-conf="${EPREFIX}"/etc/rsyncd.conf
	touch proto.h-tstamp #421625
}

src_install() {
	emake DESTDIR="${D}" install
	newconfd "${FILESDIR}"/rsyncd.conf.d rsyncd
	newinitd "${FILESDIR}"/rsyncd.init.d-r1 rsyncd
	dodoc NEWS OLDNEWS README TODO tech_report.tex
	insinto /etc
	newins "${FILESDIR}"/rsyncd.conf-3.0.9-r1 rsyncd.conf

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/rsyncd.logrotate rsyncd

	insinto /etc/xinetd.d
	newins "${FILESDIR}"/rsyncd.xinetd-3.0.9-r1 rsyncd

	# Install the useful contrib scripts
	exeinto /usr/share/rsync
	doexe support/*
	rm -f "${ED}"/usr/share/rsync/{Makefile*,*.c}

	eprefixify "${ED}"/etc/{,xinetd.d}/rsyncd*

	systemd_dounit "${FILESDIR}/rsyncd.service"
}

pkg_postinst() {
	if egrep -qis '^[[:space:]]use chroot[[:space:]]*=[[:space:]]*(no|0|false)' \
		"${EROOT}"/etc/rsyncd.conf "${EROOT}"/etc/rsync/rsyncd.conf ; then
		ewarn "You have disabled chroot support in your rsyncd.conf.  This"
		ewarn "is a security risk which you should fix.  Please check your"
		ewarn "/etc/rsyncd.conf file and fix the setting 'use chroot'."
	fi
}
