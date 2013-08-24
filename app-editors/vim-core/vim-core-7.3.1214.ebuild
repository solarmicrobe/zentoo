# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
VIM_VERSION="7.3"
inherit vim

VIM_CORE_GENTOO_PATCHES="vim-core-${VIM_VERSION}-gentoo-patches-r3.tar.bz2"
VIM_ORG_PATCHES="vim-patches-${PV}.patch.bz2"
VIMRC_FILE_SUFFIX="-r4"

SRC_URI="ftp://ftp.vim.org/pub/vim/unix/vim-${VIM_VERSION}.tar.bz2
	http://dev.gentoo.org/~radhermit/vim/${VIM_CORE_GENTOO_PATCHES}
	http://dev.gentoo.org/~radhermit/vim/${VIM_ORG_PATCHES}"

DESCRIPTION="vim and gvim shared files"
KEYWORDS="amd64"

S=${WORKDIR}/vim${VIM_VERSION/.}
