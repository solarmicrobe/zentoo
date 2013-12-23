# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="Ohai profiles your system and emits JSON"
HOMEPAGE="http://wiki.opscode.com/display/chef/Ohai"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# specs have issues with multiple ruby versions
RESTRICT="test"

ruby_add_rdepend "
	dev-ruby/ipaddress
	dev-ruby/mixlib-cli
	dev-ruby/mixlib-config
	dev-ruby/mixlib-log
	dev-ruby/mixlib-shellout
	dev-ruby/systemu
	dev-ruby/yajl-ruby"

each_ruby_install() {
	each_fakegem_install

	ruby_fakegem_newins \
		"${FILESDIR}"/lxc_virtualization.rb \
		lib/ohai/plugins/linux/lxc_virtualization.rb
}

all_ruby_install() {
	all_fakegem_install

	doman docs/man/man1/ohai.1
}
