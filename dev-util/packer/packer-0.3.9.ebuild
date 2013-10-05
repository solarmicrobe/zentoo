# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A tool for creating machine images"
HOMEPAGE="http://www.packer.io"
SRC_URI="amd64? ( https://dl.bintray.com/mitchellh/packer/0.3.9_linux_amd64.zip -> ${P}_amd64.zip )"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	exeinto /usr/bin
	doexe "${S}"/*
}
