# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit multilib-build

DESCRIPTION="Virtual for the GNU conversion library"
HOMEPAGE=""
SRC_URI=""
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="elibc_glibc elibc_uclibc elibc_musl"
DEPEND=""

# - Don't put elibc_glibc? ( sys-libs/glibc ) to avoid circular deps between
# that and gcc
RDEPEND="!elibc_glibc? ( !elibc_uclibc? ( !elibc_musl? ( dev-libs/libiconv[${MULTILIB_USEDEP}] ) ) )"
