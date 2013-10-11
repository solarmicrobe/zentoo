# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

XORG_STATIC=no
inherit xorg-2

DESCRIPTION="C preprocessor interface to the make utility"
KEYWORDS="amd64"
IUSE=""

RDEPEND="x11-misc/xorg-cf-files"
DEPEND="${RDEPEND}
	x11-proto/xproto"

src_prepare() {
	# don't use Sun compilers on Solaris, we want GCC from prefix
	sed -i \
		-e "1s/^/#if defined(sun)\n# undef sun\n#endif/" \
		imake.c imakemdep.h || die "sed failed"
	xorg-2_src_prepare
}
