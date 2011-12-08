# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A somewhat comprehensive collection of Linux german man page translations"
HOMEPAGE="http://www.infodrom.org/projects/manpages-de/"
SRC_URI="http://www.infodrom.org/projects/manpages-de/download/manpages-de-${PV}.tar.gz"

LICENSE="as-is GPL-2 BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="virtual/man"

S=${WORKDIR}/manpages-de-${PV}

src_compile() { :; }

src_install() {
	make MANDIR="${D}"/usr/share/man/de install  || die
	dodoc CHANGES README

	# Remove man pages provided by other packages
	#  - shadow
	rm "${D}"/usr/share/man/de/man1/{chsh,groups,login,passwd,newgrp,su}.1*
	#  - man
	rm "${D}"/usr/share/man/de/man1/{apropos,man,whatis}.1*
	#  - man-db
	rm "${D}"/usr/share/man/de/man1/{manpath,zsoelim}.1*
	rm "${D}"/usr/share/man/de/man5/manpath.5*
	rm "${D}"/usr/share/man/de/man8/{catman,mandb}.8*
}
