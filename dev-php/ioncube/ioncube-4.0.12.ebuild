# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PHP_EXT_NAME="ioncube"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="yes"
PHP_EXT_SKIP_PHPIZE="yes"
DOCS="README.txt"

inherit php-ext-source-r2

DESCRIPTION="PHP extension for using memcached."
HOMEPAGE="http://www.ioncube.com/loaders.php"
SRC_URI="http://www.zentoo.org/distfiles/ioncube_loaders_lin_x86-64-${PV}.tar.gz"

LICENSE="ionCube-Loaders"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# upstream does not ship any testsuite, so the PHPize test-runner fails.
RESTRICT="test"

S="${WORKDIR}"/${PN}

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	for slot in $(php_get_slots); do
		php_init_slot_env ${slot}
		insinto "${EXT_DIR}"
		newins ioncube_loader_lin_${slot/php}.so "${PHP_EXT_NAME}.so" || die "Unable to install extension"
	done
}
