# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Internationalization Tool Collection"
HOMEPAGE="http://edge.launchpad.net/intltool/"
SRC_URI="http://edge.launchpad.net/intltool/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-lang/perl-5.8.1
	dev-perl/XML-Parser"
RDEPEND="${DEPEND}
	sys-devel/gettext"

DOCS=( AUTHORS ChangeLog NEWS README TODO doc/I18N-HOWTO )
