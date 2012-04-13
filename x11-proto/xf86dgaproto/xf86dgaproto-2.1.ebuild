# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit x-modular

DESCRIPTION="X.Org XF86DGA protocol headers"

KEYWORDS="amd64"
IUSE=""

RDEPEND="!<x11-libs/libXxf86dga-1.0.99.1"
DEPEND="${RDEPEND}"
