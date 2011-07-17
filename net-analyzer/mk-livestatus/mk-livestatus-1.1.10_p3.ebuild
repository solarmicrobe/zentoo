# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MY_PV="${PV/_p/p}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Nagios/Icinga event broker module that allows quick/direct access to your status data"
HOMEPAGE="http://mathias-kettner.de/checkmk_livestatus.html"
SRC_URI="http://mathias-kettner.de/download/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_P}"

src_prepare() {
	sed -i -e 's:$(LDFLAGS) -s:$(LDFLAGS):' src/Makefile.in
}

src_install() {
	emake -C src/ DESTDIR="${D}" install-binPROGRAMS install-data-local
}
