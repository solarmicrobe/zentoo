# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools

DESCRIPTION="A free socks4,5 and msproxy implementation"
HOMEPAGE="http://www.inet.no/dante/"
SRC_URI="ftp://ftp.inet.no/pub/socks/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="tcpd debug selinux pam"

RDEPEND="pam? ( virtual/pam )
	tcpd? ( sys-apps/tcp-wrappers )
	selinux? ( sec-policy/selinux-dante )
	userland_GNU? ( sys-apps/shadow )"
DEPEND="${RDEPEND}
	sys-devel/flex
	sys-devel/bison
	>=sys-apps/sed-4"

src_unpack() {
	unpack ${A}

	cd "${S}"
	epatch "${FILESDIR}/${P}-socksify.patch"
	epatch "${FILESDIR}/${P}-libpam.patch"

	sed -i \
		-e 's:/etc/socks\.conf:/etc/socks/socks.conf:' \
		-e 's:/etc/sockd\.conf:/etc/socks/sockd.conf:' \
		doc/{faq.ps,faq.tex,sockd.8,sockd.conf.5,socks.conf.5}

	eautoreconf
}

src_compile() {
	econf \
		`use_enable debug` \
		`use_enable tcpd libwrap` \
		`use_with pam` \
		--with-socks-conf=/etc/socks/socks.conf \
		--with-sockd-conf=/etc/socks/sockd.conf \
		|| die "bad ./configure"
	# the comments in the source say this is only useful for 2.0 kernels ...
	# well it may fix 2.0 but it breaks with 2.6 :)
	sed -i 's:if HAVE_LINUX_ECCENTRICITIES:if 0:' include/common.h
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install has failed"

	# bor: comment libdl.so out it seems to work just fine without it
	sed -i -e 's:libdl\.so::' "${D}/usr/bin/socksify" || die 'sed failed'

	# default configuration files
	insinto /etc/socks
	doins "${FILESDIR}"/sock?.conf
	cd "${D}/etc/socks" && {
		use pam && epatch "${FILESDIR}/sockd.conf-with-pam.patch"
		use tcpd && epatch "${FILESDIR}/sockd.conf-with-libwrap.patch"
	}
	cd "${S}"

	# our init script
	newinitd "${FILESDIR}/dante-sockd-init" dante-sockd
	newconfd "${FILESDIR}/dante-sockd-conf" dante-sockd

	# install documentation
	dodoc BUGS CREDITS NEWS README SUPPORT TODO
	docinto txt
	cd doc
	dodoc README* *.txt SOCKS4.*
	docinto example
	cd ../example
	dodoc *.conf
}

pkg_postinst() {
	enewuser sockd -1 -1 /etc/socks daemon
}
