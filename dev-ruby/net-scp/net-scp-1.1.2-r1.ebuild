# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

RUBY_FAKEGEM_EXTRADOC="CHANGES.txt README.rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A pure Ruby implementation of the SCP client protocol"
HOMEPAGE="http://net-ssh.rubyforge.org/scp"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="amd64"
IUSE=""

ruby_add_bdepend "
	doc? ( >=dev-ruby/net-ssh-2.6.5 )
	test? (
		dev-ruby/mocha
	)"

ruby_add_rdepend ">=dev-ruby/net-ssh-2.6.5"

each_ruby_test() {
	${RUBY} -Ilib:test test/test_all.rb || die
}
