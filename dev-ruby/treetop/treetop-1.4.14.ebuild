# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# jruby fails tests, not investigated yet.
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Treetop is a language for describing languages."
HOMEPAGE="http://treetop.rubyforge.org/"
LICENSE="Ruby"

KEYWORDS="amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/rr-0.10.2 dev-ruby/activesupport )"
ruby_add_rdepend ">=dev-ruby/polyglot-0.3.1"

all_ruby_prepare() {
	# Use a ruby18 compatible regexp, already fixed upstream.
	sed -i -e 's/\[:\^space:\]/\^[:space:]/' spec/compiler/character_class_spec.rb || die
}

all_ruby_install() {
	all_fakegem_install

	insinto /usr/share/doc/${PF}/examples
	doins -r examples/*
}