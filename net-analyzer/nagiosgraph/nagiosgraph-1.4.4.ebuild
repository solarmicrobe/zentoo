# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit multilib

DESCRIPTION="nagiosgraph parses performance data from Nagios plugins"
HOMEPAGE="http://nagiosgraph.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PV}/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/perl
	virtual/perl-CGI
	virtual/perl-Time-HiRes
	virtual/perl-MIME-Base64
	dev-perl/GD
"

src_prepare() {
	sed -i -e '/use.*lib/s:/opt/nagiosgraph/etc:/etc/nagiosgraph:g' \
		cgi/*.cgi lib/insert.pl

	cp "${FILESDIR}"/nagiosgraph.conf etc/nagiosgraph.conf
}

src_install() {
	insinto /etc/nagiosgraph
	doins -r etc/*

	insinto /usr/libexec
	newins lib/insert.pl nagiosgraph_insert.pl

	exeinto /usr/$(get_libdir)/nagios/cgi-bin
	doexe cgi/*.cgi

	insinto /usr/share/nagios/htdocs
	doins share/nagiosgraph.{css,js}

	keepdir /var/nagios/rrd
	fowners nagios:nagios /var/nagios/rrd
	fperms 0755 /var/nagios/rrd
}
