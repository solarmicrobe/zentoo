# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit autotools eutils multilib-build multilib-minimal multilib toolchain-funcs

DESCRIPTION="Low-level cryptographic library"
HOMEPAGE="http://www.lysator.liu.se/~nisse/nettle/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="|| ( LGPL-3 LGPL-2.1 )"
SLOT="0/6" # subslot = libnettle soname version
KEYWORDS="amd64"
IUSE="doc +gmp neon static-libs test cpu_flags_x86_aes"

DEPEND="gmp? ( dev-libs/gmp:0[${MULTILIB_USEDEP}] )"
RDEPEND="${DEPEND}
	abi_x86_32? (
		!<=app-emulation/emul-linux-x86-baselibs-20131008-r17
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32(-)]
	)"

MULTILIB_WRAPPED_HEADERS=(
	/usr/include/nettle/nettle-stdint.h
	/usr/include/nettle/version.h
)

src_prepare() {
	default

	sed -e '/CFLAGS=/s: -ggdb3::' \
		-e 's/solaris\*)/sunldsolaris*)/' \
		-i configure.ac || die

	# conditionally build tests and examples required by tests
	use test || sed -i '/SUBDIRS/s/testsuite examples//' Makefile.in || die

	eautoreconf
}

multilib_src_configure() {
	# --disable-openssl bug #427526
	ECONF_SOURCE="${S}" econf \
		--libdir="${EPREFIX}"/usr/$(get_libdir) \
		--disable-openssl \
		--disable-fat \
		$(use_enable gmp public-key) \
		$(use_enable static-libs static) \
		$(tc-is-static-only && echo --disable-shared) \
		$(use_enable doc documentation) \
		$(use_enable neon arm-neon) \
		$(use_enable cpu_flags_x86_aes x86-aesni)
}

multilib_src_install_all() {
	einstalldocs
	if use doc ; then
		dohtml nettle.html
		dodoc nettle.pdf
	fi
}
