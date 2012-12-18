# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Remember: we cannot leverage autotools in this ebuild in order
#           to avoid circular deps with autotools

EAPI="4"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="http://git.tukaani.org/xz.git"
	inherit git-2 autotools
	SRC_URI=""
	EXTRA_DEPEND="sys-devel/gettext dev-vcs/cvs >=sys-devel/libtool-2" #272880 286068
else
	inherit libtool
	MY_P="${PN/-utils}-${PV/_}"
	SRC_URI="http://tukaani.org/xz/${MY_P}.tar.gz"
	KEYWORDS="amd64"
	S=${WORKDIR}/${MY_P}
	EXTRA_DEPEND=
fi

inherit eutils multilib

DESCRIPTION="utils for managing LZMA compressed files"
HOMEPAGE="http://tukaani.org/xz/"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="nls static-libs +threads"

RDEPEND="!<app-arch/lzma-4.63
	!app-arch/lzma-utils
	!<app-arch/p7zip-4.57"
DEPEND="${RDEPEND}
	${EXTRA_DEPEND}"

if [[ ${PV} == "9999" ]] ; then
src_prepare() {
	eautopoint
	eautoreconf
}
else
src_prepare() {
	elibtoolize  # to allow building shared libs on Solaris/x64
}
fi

src_configure() {
	econf \
		$(use_enable nls) \
		$(use_enable threads) \
		$(use_enable static-libs static)
}

src_install() {
	default
	find "${ED}"/usr/ -name liblzma.la -delete || die # dependency_libs=''
	rm "${ED}"/usr/share/doc/xz/COPYING* || die
	mv "${ED}"/usr/share/doc/{xz,${PF}} || die
}

pkg_preinst() {
	preserve_old_lib /usr/$(get_libdir)/liblzma$(get_libname 0)
}

pkg_postinst() {
	preserve_old_lib_notify /usr/$(get_libdir)/liblzma$(get_libname 0)
}
