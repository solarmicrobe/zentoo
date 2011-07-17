# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for the GNU conversion library"
HOMEPAGE=""
SRC_URI=""
LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="elibc_glibc elibc_uclibc"
DEPEND=""

# - Don't put elibc_glibc? ( sys-libs/glibc ) to avoid circular deps between
# that and gcc
RDEPEND="!elibc_glibc? ( !elibc_uclibc? ( dev-libs/libiconv ) )"
