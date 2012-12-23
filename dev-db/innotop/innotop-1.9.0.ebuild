# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-app

DESCRIPTION="innotop - A text-mode MySQL and InnoDB monitor like mytop, but with many more features"
HOMEPAGE="http://code.google.com/p/innotop/"
SRC_URI="http://innotop.googlecode.com/files/${P}.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="amd64"
SLOT="0"
IUSE=""

DEPEND="dev-perl/DBD-mysql
	dev-perl/TermReadKey
	virtual/perl-Term-ANSIColor
	virtual/perl-Time-HiRes"
RDEPEND="${DEPEND}"

src_install() {
	perl-module_src_install
}
