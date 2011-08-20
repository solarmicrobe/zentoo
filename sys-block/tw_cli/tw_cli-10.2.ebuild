# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

# Upstream actually only releases newer versions for new hardware
# and doesn't release new major versions for old hardware
# however their backwards compatibility is excellent.

DESCRIPTION="3ware SATA+PATA RAID controller Command Line Interface tool"
HOMEPAGE="http://www.3ware.com/kb/article.aspx?id=14847"
SRC_URI="http://www.lsi.com/downloads/Public/SATA/SATA%20Common%20Files/cli_linux_${PV}.zip"

LICENSE="3ware"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

# stripping seems to break this sometimes
RESTRICT="strip"

PN_ARCH="${ARCH/*-}"
PN_ARCH="${PN_ARCH/amd64/x86_64}"

S="${WORKDIR}"

src_install() {
	into /
	dosbin ${PN_ARCH}/tw_cli

	into /usr
	# 10.2 is missing this
	if [[ -f tw_cli.8.nroff ]]; then
		newman tw_cli.8.nroff tw_cli.8
	else
		ewarn "Upstream's 10.2 release is missing the tw_cli manpage."
	fi
	dohtml *.html
}
