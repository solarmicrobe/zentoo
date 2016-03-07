# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="History.rdoc History-Types.rdoc README.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="data"

inherit ruby-fakegem

DESCRIPTION="Provides a mailcap-like MIME Content-Type lookup for Ruby"
HOMEPAGE="https://github.com/mime-types/ruby-mime-types"

LICENSE="MIT Artistic GPL-2"
SLOT="2"
KEYWORDS="amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/minitest:5 )"

all_ruby_prepare() {
	# Avoid unneeded dependency on minitest-focus.
	sed -i -e '/focus/ s:^:#:' test/minitest_helper.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e 'Dir["test/test_*.rb"].each{|f| require f}' || die
}