# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Ganymed is a event collection daemon"
HOMEPAGE="https://github.com/zenops/ganymed"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/activesupport-3.2
	>=dev-ruby/eventmachine-0.12.10
	>=dev-ruby/madvertise-ext-0.1.2
	>=dev-ruby/madvertise-logging-0.3.2
	dev-ruby/mixlib-cli
	dev-ruby/servolux
	dev-ruby/msgpack
	>=dev-ruby/mongo-1.6
	dev-ruby/em-websocket
	dev-ruby/yajl-ruby
	dev-ruby/sys-filesystem
	>=dev-ruby/ohai-0.6.12
"

all_ruby_install() {
	all_fakegem_install
	keepdir /etc/ganymed
	newinitd "${FILESDIR}/ganymed.initd"
}
