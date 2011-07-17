# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit php-pear-r1 eutils

DESCRIPTION="Provides classes to deal with creation and manipulation of mime messages"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

PDEPEND="dev-php/PEAR-Mail_mimeDecode"

src_unpack() {
	unpack ${A}
	cd "${S}"

	# see Bug 125451; http://pear.php.net/bugs/bug.php?id=5333
	epatch "${FILESDIR}"/1.5.2-php-pass-by-reference-fix.patch
}
