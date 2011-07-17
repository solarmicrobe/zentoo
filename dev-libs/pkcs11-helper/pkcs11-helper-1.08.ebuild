# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="PKCS#11 helper library"
HOMEPAGE="http://www.opensc-project.org/opensc/wiki/pkcs11-helper"
SRC_URI="http://www.opensc-project.org/files/${PN}/${P}.tar.bz2"

LICENSE="|| ( BSD GPL-2 )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc gnutls nss static-libs"

RDEPEND=">=dev-libs/openssl-0.9.7
	gnutls? ( >=net-libs/gnutls-1.4.4 )
	nss? ( dev-libs/nss )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	doc? ( >=app-doc/doxygen-1.4.7 )"

src_configure() {
	econf \
		--docdir="${EPREFIX}/usr/share/doc/${PF}" \
		$(use_enable doc) \
		$(use_enable gnutls crypto-engine-gnutls) \
		$(use_enable nss crypto-engine-nss) \
		$(use_enable static-libs static)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	find "${ED}" -name "*.la" -print0 | xargs -0 rm -f
}
