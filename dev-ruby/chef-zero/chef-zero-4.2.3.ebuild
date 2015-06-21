# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

inherit ruby-fakegem

DESCRIPTION="Self-contained, easy-setup, fast-start in-memory Chef server for testing and solo setup purposes"
HOMEPAGE="https://github.com/jkeiser/chef-zero"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/ffi-yajl-1.1
	<dev-ruby/ffi-yajl-3
	>=dev-ruby/hashie-2.0
	>=dev-ruby/mixlib-log-1.3
	dev-ruby/rack
	>=dev-ruby/uuidtools-2.1
"
