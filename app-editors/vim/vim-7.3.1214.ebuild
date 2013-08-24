# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
VIM_VERSION="7.3"
PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2,3_3} )
inherit vim

VIM_ORG_PATCHES="vim-patches-${PV}.patch.bz2"

SRC_URI="ftp://ftp.vim.org/pub/vim/unix/vim-${VIM_VERSION}.tar.bz2
	http://dev.gentoo.org/~radhermit/vim/${VIM_ORG_PATCHES}"

DESCRIPTION="Vim, an improved vi-style text editor"
KEYWORDS="amd64"

S=${WORKDIR}/vim${VIM_VERSION/.}

src_prepare() {
	vim_src_prepare

	if [[ ${CHOST} == *-interix* ]]; then
		epatch "${FILESDIR}"/${PN}-7.3-interix-link.patch
	fi
	epatch "${FILESDIR}"/${PN}-7.1.285-darwin-x11link.patch

	# fix python3 support
	epatch "${FILESDIR}"/${P}-python3.patch
}
