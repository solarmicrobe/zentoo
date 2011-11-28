# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Virtual for jpeg library"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="static-libs"

RDEPEND="|| ( media-libs/libjpeg-turbo:0[static-libs?] media-libs/jpeg:0[static-libs?] )"
DEPEND=""
