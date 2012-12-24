# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils multilib

DESCRIPTION="A library for applications dealing with netlink socket"
HOMEPAGE="http://www.infradead.org/~tgr/libnl/"
SRC_URI="http://www.infradead.org/~tgr/libnl/files/${P}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="1.1"
KEYWORDS="amd64"
IUSE="doc"

DEPEND="doc? ( app-doc/doxygen )"
DOCS=( ChangeLog )

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-vlan-header.patch \
		"${FILESDIR}"/${P}-minor-leaks.patch \
		"${FILESDIR}"/${P}-glibc-2.8-ULONG_MAX.patch \
		"${FILESDIR}"/${P}-flags.patch \
		"${FILESDIR}"/${P}-inline.patch
}

src_compile() {
	default

	if use doc ; then
		cd "${S}/doc"
		emake gendoc || die "emake gendoc failed"
	fi
}

src_install() {
	default

	if use doc ; then
		cd "${S}/doc"
		dohtml -r html/*
	fi
}
