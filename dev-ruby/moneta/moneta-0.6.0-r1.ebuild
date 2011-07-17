# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRADOC="README TODO"

inherit ruby-fakegem

GITHUB_USER="wycats"

DESCRIPTION="A unified interface to key/value stores"
HOMEPAGE="http://github.com/wycats/moneta"
SRC_URI="http://github.com/${GITHUB_USER}/moneta/tarball/${PV} -> ${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

S="${WORKDIR}/${GITHUB_USER}-${PN}-*"

RUBY_PATCHES=( "${P}-optional-memcache.patch" )

ruby_add_bdepend "test? ( dev-ruby/rspec:0 )"
