# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Gecode is an environment for developing constraint-based systems and applications"
SRC_URI="http://www.gecode.org/download/${P}.tar.gz"
HOMEPAGE="http://www.gecode.org/"

SLOT="0"
LICENSE="MIT"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
