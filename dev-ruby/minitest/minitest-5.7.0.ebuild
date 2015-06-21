# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="minitest/unit is a small and fast replacement for ruby's huge and slow test/unit"
HOMEPAGE="https://github.com/seattlerb/minitest"

LICENSE="MIT"
SLOT="5"
KEYWORDS="amd64"
IUSE="doc test"

each_ruby_test() {
	${RUBY} -Ilib:test:. -e "Dir['**/test_*.rb'].each{|f| require f}" || die "Tests failed"
}
