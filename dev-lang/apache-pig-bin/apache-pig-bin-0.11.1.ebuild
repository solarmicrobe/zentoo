# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils java-utils-2

MY_PN="pig"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="High-level language and platform for analyzing large data sets"
HOMEPAGE="http://hadoop.apache.org/"
SRC_URI="mirror://apache/${MY_PN}/${MY_P}/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror binchecks"
IUSE=""

DEPEND=""
RDEPEND=">=virtual/jre-1.6
	sys-cluster/hadoop"

S="${WORKDIR}/${MY_P}"
INSTALL_DIR=/opt/${MY_PN}
DATA_DIR=/var/db/${MY_PN}
export CONFIG_POTECT="${CONFIG_PROTECT} ${INSTALL_DIR}/conf"

src_install() {
	dodir "${INSTALL_DIR}" || die "Cannot create INSTALL_DIR"
	cd "${S}"/
	rm -rf build.xml docs src lib-src ivy ivy.xml test tutorial pig-0.11.1.jar shims || die
	mv "${S}"/* "${D}${INSTALL_DIR}" || die "install failed"

	# env file
	cat > 99"${MY_PN}" <<-EOF
		PATH=${INSTALL_DIR}/bin
		ROOTPATH=${INSTALL_DIR}/bin
		CONFIG_PROTECT=${INSTALL_DIR}/conf
	EOF
	doenvd 99"${MY_PN}" || die "doenvd failed"
}

pkg_postinst() {
	env-update
	elog "For info on configuration see http://hadoop.apache.org/${MY_PN}/docs/r${PV}"
}

pkg_postrm() {
	env-update
}
