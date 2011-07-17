# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_TASK_DOC="doc"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="A simple library to assist in enabling tunneled Net::SSH connections"
HOMEPAGE="http://net-ssh.rubyforge.org/gateway"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="amd64 x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/net-ssh-2.0.0"

ruby_add_bdepend "
	doc? ( dev-ruby/echoe )
	test? (
		dev-ruby/echoe
		virtual/ruby-test-unit
	)"
