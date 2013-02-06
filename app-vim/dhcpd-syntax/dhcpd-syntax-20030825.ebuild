# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit vim-plugin eutils

DESCRIPTION="vim plugin: syntax highlighting for dhcpd.conf"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=744"
LICENSE="vim.org"
KEYWORDS="amd64"
IUSE=""

VIM_PLUGIN_HELPTEXT=\
"This plugin provides syntax highlighting for dhcpd.conf files."

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-multiple-addresses.patch
}