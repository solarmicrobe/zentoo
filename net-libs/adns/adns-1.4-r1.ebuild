# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils multilib toolchain-funcs

DESCRIPTION="Advanced, easy to use, asynchronous-capable DNS client library and utilities"
HOMEPAGE="http://www.chiark.greenend.org.uk/~ian/adns/"
SRC_URI="ftp://ftp.chiark.greenend.org.uk/users/ian/adns/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/${P}-cnamechain.patch
	#remove bogus test wrt bug #295072
	rm "${S}"/regress/case-cnametocname.sys
}

src_configure() {
	CC=$(tc-getCC) econf || die "econf failed"
}

src_compile() {
	emake AR=$(tc-getAR) RANLIB=$(tc-getRANLIB) || die "emake failed"
}

src_install () {
	dodir /usr/{include,bin,$(get_libdir)}
	emake prefix="${D}"/usr libdir="${D}"/usr/$(get_libdir) install || die "emake install failed"
	dodoc README TODO changelog "${FILESDIR}"/README.security
	dohtml *.html
}

pkg_postinst() {
	ewarn "$(<${FILESDIR}/README.security)"
}
