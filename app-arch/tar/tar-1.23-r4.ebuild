# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit flag-o-matic eutils

DESCRIPTION="Use this to make tarballs :)"
HOMEPAGE="http://www.gnu.org/software/tar/"
SRC_URI="http://ftp.gnu.org/gnu/tar/${P}.tar.bz2
	ftp://alpha.gnu.org/gnu/tar/${P}.tar.bz2
	mirror://gnu/tar/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls static userland_GNU"

RDEPEND=""
DEPEND="${RDEPEND}
	nls? ( >=sys-devel/gettext-0.10.35 )"

src_prepare() {
	epatch "${FILESDIR}"/${P}-revert-pipe.patch #309001
	epatch "${FILESDIR}"/${P}-strncpy.patch #317139
	epatch "${FILESDIR}"/${P}-symlink-k-hang.patch #327641
	epatch "${FILESDIR}"/${P}-tests.patch #326785

	if ! use userland_GNU ; then
		sed -i \
			-e 's:/backup\.sh:/gbackup.sh:' \
			scripts/{backup,dump-remind,restore}.in \
			|| die "sed non-GNU"
	fi
}

src_configure() {
	local myconf
	use static && append-ldflags -static
	use userland_GNU || myconf="--program-prefix=g"
	# Work around bug in sandbox #67051
	gl_cv_func_chown_follows_symlink=yes \
	econf \
		--enable-backup-scripts \
		--bindir=/bin \
		--libexecdir=/usr/sbin \
		$(use_enable nls) \
		${myconf}
}

src_install() {
	local p=""
	use userland_GNU || p=g

	emake DESTDIR="${D}" install || die "make install failed"

	if [[ -z ${p} ]] ; then
		# a nasty yet required piece of baggage
		exeinto /etc
		doexe "${FILESDIR}"/rmt || die
	fi

	dodoc AUTHORS ChangeLog* NEWS README* THANKS
	newman "${FILESDIR}"/tar.1 ${p}tar.1
	mv "${D}"/usr/sbin/${p}backup{,-tar}
	mv "${D}"/usr/sbin/${p}restore{,-tar}

	rm -f "${D}"/usr/$(get_libdir)/charset.alias
}
