# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="A virtual for the JPEG implementation"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="static-libs"

RDEPEND="!prefix? ( >=media-libs/libjpeg-turbo-1.2.0:0[static-libs?] )
	prefix? ( || (
		>=media-libs/libjpeg-turbo-1.2.0:0[static-libs?]
		>=media-libs/jpeg-8d:0[static-libs?]
		) )"
DEPEND=""
