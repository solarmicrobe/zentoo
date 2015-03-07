# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

inherit ruby-fakegem versionator

DESCRIPTION="Ohai profiles your system and emits JSON"
HOMEPAGE="http://wiki.opscode.com/display/chef/Ohai"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_rdepend "
	dev-ruby/ipaddress
	>=dev-ruby/mime-types-2.0
	dev-ruby/mixlib-cli
	>=dev-ruby/mixlib-config-2.0
	dev-ruby/mixlib-log
	>=dev-ruby/mixlib-shellout-2.0
	>=dev-ruby/rake-10.1
	>=dev-ruby/systemu-2.6.4"
