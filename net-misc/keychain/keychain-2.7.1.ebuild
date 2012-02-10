# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="manage ssh and GPG keys in a convenient and secure manner. Frontend for ssh-agent/ssh-add"
HOMEPAGE="http://www.funtoo.org/en/security/keychain/intro/"
SRC_URI="http://www.funtoo.org/archive/keychain/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash
	|| ( net-misc/openssh net-misc/ssh )"

src_compile() { :; } # Do nothing here.

src_install() {
	dobin keychain || die "dobin failed"
	doman keychain.1 || die "doman failed"
	dodoc ChangeLog README.rst || die
}
