# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ree18 ruby19 jruby"

RUBY_FAKEGEM_DOCDIR="doc"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem eutils

DESCRIPTION="A modular Ruby webserver interface"
HOMEPAGE="http://rubyforge.org/projects/rack"
SRC_URI="mirror://rubyforge/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# The gem has automagic dependencies over mongrel, ruby-openid,
# memcache-client, thin, mongrel and camping; not sure if we should
# make them dependencies at all.
ruby_add_bdepend test dev-ruby/test-spec

USE_RUBY=ruby19 \
	ruby_add_bdepend "ruby_targets_ruby19 test" '=dev-ruby/test-unit-1*'

all_ruby_prepare() {
	epatch "${FILESDIR}"/${P}-gentoo.patch
}

each_ruby_test() {
	# Since the Rakefile calls specrb directly rather than loading it, we
	# cannot use it to launch the tests or only the currently-selected
	# RUBY interpreter will be tested.
	${RUBY} -S specrb -Ilib:test -w -a \
		-t '^(?!Rack::Handler|Rack::Adapter|Rack::Session::Memcache|rackup)' \
		|| die "test failed for ${RUBY}"
}
