# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit distutils eutils git-2

DESCRIPTION="nepal is a system configuration panel for virtual webhosting"
HOMEPAGE="http://www.nepal-project.org"

EGIT_REPO_URI="git://dev.itratos.de/nepal.git"
EGIT_COMMIT="master"
EGIT_HAS_SUBMODULES=1

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/ipython
	>=dev-python/mysql-python-1.2.3
"

pkg_setup() {
	python_pkg_setup
	enewgroup nepal
	enewuser nepal -1 -1 /srv/system nepal
}

src_install() {
	distutils_src_install

	insinto /usr/share/${PN}
	doins -r locale media templates

	insinto /usr/share/${PN}/wsgi
	doins contrib/nepal.wsgi

	insinto /usr/lib/${PN}
	doins -r lib/*
	rm -rf "${D}"/usr/lib/${PN}/*/.git # git-2.eclass epic fail

	dosbin bin/nepal-{init,admin} bin/nepald
	dobin bin/nepalc

	newinitd "${FILESDIR}"/nepald.initd nepald

	dodoc AUTHORS CREDITS README.rst
}
