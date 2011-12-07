# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib

DESCRIPTION="wrapper for automake to manage multiple automake versions"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}

src_unpack() {
	cp "${FILESDIR}"/am-wrapper-${PV}.sh "${T}"/
	# usr/bin/aclocal: bad substitution -> /bin/sh != POSIX shell
	if use prefix ; then
		sed -i -e '1c\#!'"${EPREFIX}"'/bin/sh' "${T}"/am-wrapper-${PV}.sh || die
	fi
}

src_install() {
	exeinto /usr/$(get_libdir)/misc
	newexe "${T}"/am-wrapper-${PV}.sh am-wrapper.sh || die

	keepdir /usr/share/aclocal

	dodir /usr/bin
	local x=
	for x in aclocal automake ; do
		dosym ../$(get_libdir)/misc/am-wrapper.sh /usr/bin/${x}
	done
}
