# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=BWARFIELD
MODULE_VERSION=1.44
inherit perl-module

DESCRIPTION="Perl5 module to create charts using the GD module"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-perl/GDTextUtil
	dev-perl/GD
	media-libs/gd"
DEPEND="${RDEPEND}"
