# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils flag-o-matic libtool python

MY_PN="gamin"
MY_P=${MY_PN}-${PV}

DESCRIPTION="Library providing the FAM File Alteration Monitor API"
HOMEPAGE="http://www.gnome.org/~veillard/gamin/"
SRC_URI="http://www.gnome.org/~veillard/${MY_PN}/sources/${MY_P}.tar.gz
	mirror://gentoo/${MY_PN}-0.1.9-freebsd.patch.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug kernel_linux"

RDEPEND=">=dev-libs/glib-2
	>=dev-libs/libgamin-0.1.10
	!app-admin/fam
	!<app-admin/gamin-0.1.10"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Fix compile warnings; bug #188923
	epatch "${DISTDIR}/${MY_PN}-0.1.9-freebsd.patch.bz2"

	# Fix file-collision due to shared library, upstream bug #530635
	epatch "${FILESDIR}/${P}-noinst-lib.patch"

	# autoconf is required as the user-cflags patch modifies configure.in
	# however, elibtoolize is also required, so when the above patch is
	# removed, replace the following call with a call to elibtoolize
	eautoreconf
}

src_compile() {
	# fixes bug 225403
	#append-flags "-D_GNU_SOURCE"

	econf --disable-debug \
		--disable-libgamin \
		$(use_enable kernel_linux inotify) \
		$(use_enable debug debug-api)

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "installation failed"
}
