# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
PHP_EXT_NAME="ioncube"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="yes"
PHP_EXT_SKIP_PHPIZE="yes"
PHPSAPILIST="apache2 cgi fpm"

USE_PHP="php5-3 php5-4"
inherit php-ext-source-r2

DESCRIPTION="PHP extension for using memcached."
HOMEPAGE="http://www.ioncube.com/loaders.php"
SRC_URI="http://mirror.zenops.net/distfiles/ioncube_loaders_lin_x86-64-${PV}.tar.gz"

LICENSE="ionCube-Loaders"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# upstream does not ship any testsuite, so the PHPize test-runner fails.
RESTRICT="test"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}
PHP_EXT_S="${S}"

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

	php-ext-source-r2_createinifiles
}
