# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

DESCRIPTION="Internationalization Tool Collection"
HOMEPAGE="https://launchpad.net/intltool/"
SRC_URI="https://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	>=dev-lang/perl-5.8.1
	dev-perl/XML-Parser
"
RDEPEND="${DEPEND}
	sys-devel/gettext
"
DOCS=( AUTHORS ChangeLog NEWS README TODO doc/I18N-HOWTO )

src_prepare() {
	# Use plain localedir to install mo files to, rather than trying to
	# guess one, bug #432848#c11
	epatch "${FILESDIR}/${P}-localedir-fix.patch"

	# Fix handling absolute paths in single file key output, bug #470040
	epatch "${FILESDIR}/${PN}-0.50.2-absolute-paths.patch"
}
