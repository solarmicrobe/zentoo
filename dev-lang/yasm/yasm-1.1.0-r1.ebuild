# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
PYTHON_DEPEND="python? 2:2.6"

inherit autotools eutils python

DESCRIPTION="An assembler for x86 and x86_64 instruction sets"
HOMEPAGE="http://www.tortall.net/projects/yasm/"
SRC_URI="http://www.tortall.net/projects/yasm/releases/${P}.tar.gz"

LICENSE="Artistic BSD GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls python"

RDEPEND="nls? ( virtual/libintl )"
DEPEND="nls? ( sys-devel/gettext )
	python? ( >=dev-python/cython-0.13 )"

pkg_setup() {
	if use python; then
		python_set_active_version 2
		python_pkg_setup
	fi
}

src_prepare() {
	epatch \
		"${FILESDIR}"/${PN}-1.1.0-skip_cython_check.patch \
		"${FILESDIR}"/${PN}-1.1.0-cython-0.14.patch
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable python) \
		$(use_enable python python-bindings) \
		--disable-dependency-tracking \
		$(use_enable nls)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS
}
