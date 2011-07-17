# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Net::SSH::Multi is a library for controlling multiple Net::SSH
connections via a single interface."
HOMEPAGE="http://net-ssh.rubyforge.org/multi"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="amd64 x86"
IUSE=""

ruby_add_bdepend "dev-ruby/echoe
	test? ( virtual/ruby-test-unit !dev-ruby/test-unit:2 )"
ruby_add_rdepend "dev-ruby/echoe
	>=dev-ruby/net-ssh-1.99.2
	>=dev-ruby/net-ssh-gateway-0.99.0"
