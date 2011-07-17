# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs flag-o-matic

DESCRIPTION="A yacc-compatible parser generator"
HOMEPAGE="http://www.gnu.org/software/bison/bison.html"
SRC_URI="mirror://gnu/bison/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls static"

DEPEND="nls? ( sys-devel/gettext )"
RDEPEND="sys-devel/m4"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${PN}-2.4.2-gnulib_spawn.patch # 312697
	epatch "${FILESDIR}"/${PN}-2.4.2-gcc45_testsuite.patch
	epatch "${FILESDIR}"/${PN}-2.4.3-uclibc-sched_param-def.patch
}

src_compile() {
	use static && append-ldflags -static
	econf $(use_enable nls)
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die

	# This one is installed by dev-util/yacc
	mv "${D}"/usr/bin/yacc{,.bison} || die
	mv "${D}"/usr/share/man/man1/yacc{,.bison}.1 || die

	# We do not need this.
	rm -r "${D}"/usr/lib* || die

	dodoc AUTHORS NEWS ChangeLog README OChangeLog THANKS TODO
}

pkg_postinst() {
	if [[ ! -e ${ROOT}/usr/bin/yacc ]] ; then
		ln -s yacc.bison "${ROOT}"/usr/bin/yacc
	fi
}
