# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils libtool multilib-minimal

DESCRIPTION="Tag Image File Format (TIFF) library"
HOMEPAGE="http://www.remotesensing.org/libtiff/"
SRC_URI="http://download.osgeo.org/libtiff/${P}.tar.gz
	ftp://ftp.remotesensing.org/pub/libtiff/${P}.tar.gz"

LICENSE="libtiff"
SLOT="0"
KEYWORDS="amd64"
IUSE="+cxx jbig jpeg lzma static-libs test zlib"

RDEPEND="jpeg? ( >=virtual/jpeg-0-r2:0=[${MULTILIB_USEDEP}] )
	jbig? ( >=media-libs/jbigkit-2.1:=[${MULTILIB_USEDEP}] )
	lzma? ( >=app-arch/xz-utils-5.0.5-r1:=[${MULTILIB_USEDEP}] )
	zlib? ( >=sys-libs/zlib-1.2.8-r1:=[${MULTILIB_USEDEP}] )
	abi_x86_32? (
		!<=app-emulation/emul-linux-x86-baselibs-20130224-r9
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32(-)]
	)"
DEPEND="${RDEPEND}"

REQUIRED_USE="test? ( jpeg )" #483132

MULTILIB_WRAPPED_HEADERS=(
	/usr/include/tiffconf.h
)

src_prepare() {
	elibtoolize
}

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf \
		$(use_enable static-libs static) \
		$(use_enable zlib) \
		$(use_enable jpeg) \
		$(use_enable jbig) \
		$(use_enable lzma) \
		$(use_enable cxx) \
		--without-x \
		--with-docdir="${EPREFIX}"/usr/share/doc/${PF}

	# remove useless subdirs
	if ! multilib_is_native_abi ; then
		sed -i \
			-e 's/ tools//' \
			-e 's/ contrib//' \
			-e 's/ man//' \
			-e 's/ html//' \
			Makefile || die
	fi
}

multilib_src_test() {
	if ! multilib_is_native_abi ; then
		emake -C tools
	fi
	emake check
}

multilib_src_install_all() {
	prune_libtool_files --all
	rm -f "${ED}"/usr/share/doc/${PF}/{COPYRIGHT,README*,RELEASE-DATE,TODO,VERSION}
}
