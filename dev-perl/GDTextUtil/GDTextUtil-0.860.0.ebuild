# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=MVERB
MODULE_VERSION=0.86
inherit perl-module

DESCRIPTION="Text utilities for use with GD"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-perl/GD"
DEPEND="${RDEPEND}"
