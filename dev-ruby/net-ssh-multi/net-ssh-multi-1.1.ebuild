# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_TASK_TEST="none"

inherit ruby-fakegem

DESCRIPTION="Net::SSH::Multi is a library for controlling multiple Net::SSH
connections via a single interface."
HOMEPAGE="http://net-ssh.rubyforge.org/multi"
SRC_URI="https://github.com/net-ssh/${PN}/tarball/v${PV} -> ${P}.tgz"
RUBY_S="net-ssh-${PN}-*"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="amd64"
IUSE=""

ruby_add_bdepend "test? ( virtual/ruby-test-unit )"
ruby_add_rdepend ">=dev-ruby/net-ssh-2.1.4
	>=dev-ruby/net-ssh-gateway-0.99.0"

each_ruby_test() {
	${RUBY} -Ilib:test test/test_all.rb || die
}
