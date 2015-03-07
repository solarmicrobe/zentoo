# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem versionator

DESCRIPTION="Ohai profiles your system and emits JSON"
HOMEPAGE="http://wiki.opscode.com/display/chef/Ohai"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/ffi-1.9
	>=dev-ruby/ffi-yajl-1.1
	>=dev-ruby/ipaddress-0
	>=dev-ruby/mime-types-2.0
	>=dev-ruby/mixlib-cli-0
	>=dev-ruby/mixlib-config-2.0
	>=dev-ruby/mixlib-log-0
	>=dev-ruby/mixlib-shellout-2.0
	>=dev-ruby/net-dhcp-0
	>=dev-ruby/rake-10.1
	>=dev-ruby/systemu-2.6.4"

each_ruby_prepare() {
	ruby_fakegem_metadata_gemspec ../metadata ${RUBY_FAKEGEM_GEMSPEC}
	sed -i -e '/wmi-lite/d' ${RUBY_FAKEGEM_GEMSPEC} || die "Unable to fix up dependencies."
}

