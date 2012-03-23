# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

MY_P=${P/_}

inherit libtool toolchain-funcs eutils

DESCRIPTION="a portable, high level programming interface to various calling conventions."
HOMEPAGE="http://sourceware.org/libffi/"
SRC_URI="ftp://sourceware.org/pub/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="debug static-libs test"

RDEPEND=""
DEPEND="test? ( dev-util/dejagnu )"

S=${WORKDIR}/${MY_P}

pkg_setup() {
	# Detect and document broken installation of sys-devel/gcc in the build.log wrt #354903
	if ! has_version dev-libs/libffi; then
		local base="${T}/conftest"
		echo 'int main() { }' > "${base}.c"
		$(tc-getCC) -o "${base}" "${base}.c" -lffi >&/dev/null && \
			ewarn "Found a copy of second libffi in your system. Uninstall it before continuing."
	fi
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-3.0.9-x32.patch
	elibtoolize
}

src_configure() {
	use userland_BSD && export HOST="${CHOST}"
	econf \
		--disable-dependency-tracking \
		$(use_enable static-libs static) \
		$(use_enable debug)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc ChangeLog* README
	find "${D}" -name '*.la' -exec rm -f {} +
}
