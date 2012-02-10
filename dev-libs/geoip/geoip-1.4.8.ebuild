# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools

MY_P=${P/geoip/GeoIP}

DESCRIPTION="easily lookup countries by IP addresses, even when Reverse DNS entries don't exist"
HOMEPAGE="http://www.maxmind.com/geoip/api/c.shtml"
SRC_URI="
	http://www.maxmind.com/download/geoip/api/c/${MY_P}.tar.gz
	ipv6? ( http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz )
"

# GPL-2 for md5.c - part of libGeoIPUpdate, MaxMind for GeoLite Country db
LICENSE="LGPL-2.1 GPL-2 MaxMind2"
SLOT="0"
KEYWORDS="amd64"
IUSE="ipv6 perl-geoipupdate static-libs"

RDEPEND="
	perl-geoipupdate? (
		dev-perl/PerlIO-gzip
		dev-perl/libwww-perl
	)
"

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -e "s:usr local share GeoIP:usr share GeoIP:" \
		-e "s:usr local etc:etc:" \
		-i apps/geoipupdate-pureperl.pl || die

	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default
	use perl-geoipupdate && dobin apps/geoipupdate-pureperl.pl
	dodoc AUTHORS ChangeLog README TODO conf/GeoIP.conf.default
	rm "${ED}/etc/GeoIP.conf.default"
	if ! use static-libs; then
		rm -f "${D}"/usr/lib*/lib*.la
	fi

	if use ipv6; then
		insinto /usr/share/GeoIP
		doins "${WORKDIR}/GeoIPv6.dat" || die
	fi

	dosbin "${FILESDIR}/geoipupdate.sh"
}
