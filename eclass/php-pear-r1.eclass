# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#
# Author: Tal Peer <coredumb@gentoo.org>
# Author: Luca Longinotti <chtekk@gentoo.org>

# @ECLASS: php-pear-r1.eclass
# @MAINTAINER:
# Gentoo PHP Team <php-bugs@gentoo.org>
# @BLURB: Provides means for an easy installation of PEAR packages.
# @DESCRIPTION:
# This eclass provides means for an easy installation of PEAR packages.
# For more information on PEAR, see http://pear.php.net/
# Note that this eclass doesn't handle dependencies of PEAR packages
# on purpose; please use (R)DEPEND to define them correctly!

inherit multilib

EXPORT_FUNCTIONS src_install

DEPEND="dev-lang/php
	>=dev-php/pear-1.8.1"
RDEPEND="${DEPEND}"

# @ECLASS-VARIABLE: PHP_PEAR_PKG_NAME
# @DESCRIPTION:
# Set this if the the PEAR package name differs from ${PN/PEAR-/}
# (generally shouldn't be the case).
[[ -z "${PHP_PEAR_PKG_NAME}" ]] && PHP_PEAR_PKG_NAME="${PN/PEAR-/}"

fix_PEAR_PV() {
	tmp="${PV}"
	tmp="${tmp/_/}"
	tmp="${tmp/rc/RC}"
	tmp="${tmp/beta/b}"
	tmp="${tmp/alpha/a}"
	PEAR_PV="${tmp}"
}

# @ECLASS-VARIABLE: PEAR_PV
# @DESCRIPTION:
# Set in ebuild if the eclass ${PV} mangling breaks SRC_URI for alpha/beta/rc versions
[[ -z "${PEAR_PV}" ]] && fix_PEAR_PV

PEAR_PN="${PHP_PEAR_PKG_NAME}-${PEAR_PV}"

[[ -z "${SRC_URI}" ]] && SRC_URI="http://pear.php.net/get/${PEAR_PN}.tgz"
[[ -z "${HOMEPAGE}" ]] && HOMEPAGE="http://pear.php.net/${PHP_PEAR_PKG_NAME}"

S="${WORKDIR}/${PEAR_PN}"

# @FUNCTION: php-pear-r1_src_install
# @DESCRIPTION:
# Takes care of standard install for PEAR packages.
php-pear-r1_src_install() {
	# SNMP support
	addpredict /usr/share/snmp/mibs/.index
	addpredict /var/lib/net-snmp/
	addpredict /session_mm_cli0.sem

	PHP_BIN="/usr/bin/php"

	cd "${S}"

	if [[ -f "${WORKDIR}"/package2.xml ]] ; then
		mv -f "${WORKDIR}/package2.xml" "${S}"
		if has_version '>=dev-php/PEAR-PEAR-1.7.0' ; then
			local WWW_DIR="/usr/share/webapps/${PN}/${PVR}/htdocs"
			peardev -d php_bin="${PHP_BIN}" -d www_dir="${WWW_DIR}" \
				install --force --loose --nodeps --offline --packagingroot="${D}" \
				"${S}/package2.xml" || die "Unable to install PEAR package"
		else
			peardev -d php_bin="${PHP_BIN}" install --force --loose --nodeps --offline --packagingroot="${D}" \
				"${S}/package2.xml" || die "Unable to install PEAR package"
		fi
	else
		mv -f "${WORKDIR}/package.xml" "${S}"
		if has_version '>=dev-php/PEAR-PEAR-1.7.0' ; then
			local WWW_DIR="/usr/share/webapps/${PN}/${PVR}/htdocs"
			peardev -d php_bin="${PHP_BIN}" -d www_dir="${WWW_DIR}" \
				install --force --loose --nodeps --offline --packagingroot="${D}" \
				"${S}/package.xml" || die "Unable to install PEAR package"
		else
			peardev -d php_bin="${PHP_BIN}" install --force --loose --nodeps --offline --packagingroot="${D}" \
				"${S}/package.xml" || die "Unable to install PEAR package"
		fi
	fi

	rm -Rf "${D}/usr/share/php/.channels" \
	"${D}/usr/share/php/.depdblock" \
	"${D}/usr/share/php/.depdb" \
	"${D}/usr/share/php/.filemap" \
	"${D}/usr/share/php/.lock" \
	"${D}/usr/share/php/.registry"
}
