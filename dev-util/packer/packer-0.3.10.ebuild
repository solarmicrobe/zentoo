# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/docker/docker-0.6.5.ebuild,v 1.1 2013/10/31 20:47:50 gregkh Exp $

EAPI=5

DESCRIPTION="A tool for creating machine images"
HOMEPAGE="http://www.packer.io"
SRC_URI=""

EGIT_REPO_URI="git://github.com/mitchellh/packer.git"
#EGIT_COMMIT="v${PV}"
EGIT_COMMIT="v${PV}"

inherit git-2 eutils

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	>=dev-lang/go-1.1.2
	dev-vcs/bzr
	dev-vcs/git
	dev-vcs/mercurial
"
RDEPEND=""

EGIT_SOURCEDIR="${WORKDIR}/gopath/src/github.com/mitchellh/packer"
S="${EGIT_SOURCEDIR}"

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	epatch "${FILESDIR}"/packer-0.3.10-portcount.patch
}

src_compile() {
	export GOPATH="${WORKDIR}/gopath"
	emake || die
}

src_install() {
	dobin "${S}"/bin/packer*
}
