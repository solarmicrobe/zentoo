# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Virtual for ${PN#perl-}"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="
	|| ( =dev-lang/perl-5.22* =dev-lang/perl-5.20* ~perl-core/Net-Ping-${PV} )
	!<perl-core/Net-Ping-${PV}
	!>perl-core/Net-Ping-${PV}-r999
"
