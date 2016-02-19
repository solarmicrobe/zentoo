# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.md doc/text/news.md"

inherit ruby-fakegem

# Assume for now that ruby23 is not eselected yet and only
# depend on yard for the other ruby implementations. Without this
# assumption bootstrapping ruby23 won't be possible due to the yard
# dependency tree.
USE_RUBY="${USE_RUBY/ruby23/}" ruby_add_bdepend "doc? ( dev-ruby/yard )"

DESCRIPTION="An xUnit family unit testing framework for Ruby"
HOMEPAGE="https://rubygems.org/gems/test-unit"

LICENSE="|| ( Ruby GPL-2 ) PSF-2"
SLOT="2"
KEYWORDS="amd64"
IUSE="doc test"

ruby_add_rdepend "dev-ruby/power_assert"

all_ruby_compile() {
	all_fakegem_compile

	if use doc; then
		yard doc --title ${PN} || die
	fi
}

each_ruby_test() {
	${RUBY} test/run-test.rb || die "testsuite failed"
}

all_ruby_install() {
	all_fakegem_install

	newbin "${FILESDIR}"/testrb-3 testrb-2
}
