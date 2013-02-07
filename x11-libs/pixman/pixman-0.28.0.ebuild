# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit xorg-2 toolchain-funcs versionator

EGIT_REPO_URI="git://anongit.freedesktop.org/git/pixman"
DESCRIPTION="Low-level pixel manipulation routines"

KEYWORDS="amd64"
IUSE="altivec iwmmxt mmxext neon sse2"

src_configure() {
	XORG_CONFIGURE_OPTIONS=(
		$(use_enable mmxext mmx)
		$(use_enable sse2)
		$(use_enable altivec vmx)
		$(use_enable neon arm-neon)
		$(use_enable iwmmxt arm-iwmmxt)
		--disable-gtk
		--disable-libpng
	)
	xorg-2_src_configure
}
