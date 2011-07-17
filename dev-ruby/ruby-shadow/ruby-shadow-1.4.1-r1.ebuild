# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18"

inherit ruby-ng

DESCRIPTION="ruby shadow bindings"
HOMEPAGE="http://ttsky.net"
SRC_URI="http://ttsky.net/src/${P}.tar.gz"

S=${WORKDIR}/shadow-${PV}

LICENSE="Ruby"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RUBY_PATCHES=( "${P}-debian.patch" )

each_ruby_configure() {
	${RUBY} extconf.rb || die "Configuration failed."
}

each_ruby_compile() {
	emake || die "Compilation failed."
}

each_ruby_install() {
	emake install DESTDIR="${D}" || die "Installation failed."
}

all_ruby_install() {
	dodoc HISTORY README README.euc
}
