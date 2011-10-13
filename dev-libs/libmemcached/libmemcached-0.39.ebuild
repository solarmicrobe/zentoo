# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="a C client library to the memcached server"
HOMEPAGE="http://tangent.org/552/libmemcached.html"
SRC_URI="http://download.tangent.org/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug hsieh"

DEPEND="net-misc/memcached
		virtual/perl-PodParser"
RDEPEND="${DEPEND}"

src_prepare() {
	EPATCH_OPTS="-F 40" epatch "${FILESDIR}/${PN}-0.39-runtestsasuser.patch"
	sed -r -i \
		-e 's,(context)(__attribute__),\1 \2,g' \
		libhashkit/hsieh.c || die "Failed to fix upstream typo"
}

src_configure() {
	econf \
		$(use_with debug debug) \
		$(use_enable hsieh hsieh_hash)
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS ChangeLog NEWS README THANKS TODO
	# remove manpage to avoid collision, see bug #299330
	rm -f "${D}"/usr/share/man/man1/memdump.* || die "Install failed"
	newman docs/memdump.1 memcached_memdump.1
}

src_test() {
	emake -j1 test-docs test-mem test-hash test-plus || die "Tests failed"
}
