# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_TEST="test"
RUBY_FAKEGEM_TASK_DOC="doc"

RUBY_FAKEGEM_EXTRADOC="CONTRIBUTING README.md"
RUBY_FAKEGEM_DOCDIR="doc"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb rails VERSION VERSION_NAME"

inherit ruby-fakegem

DESCRIPTION="HAML - a ruby web page templating engine"
HOMEPAGE="http://haml-lang.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

# TODO: haml has some emacs modes that it could be installing, in case
IUSE=""

ruby_add_rdepend "dev-ruby/sass"

# It could use merb during testing as well, but it's not mandatory
ruby_add_bdepend "
	test? (
		dev-ruby/hpricot
		dev-ruby/erubis
		dev-ruby/rails
		dev-ruby/ruby_parser
	)
	doc? (
		dev-ruby/yard
		dev-ruby/maruku
	)"

all_ruby_prepare() {
	# unbundle sass; remove dependency over fssm and add one over sass
	# itself.
	rm -r vendor/ || die

	pushd .. &>/dev/null
	epatch "${FILESDIR}"/${P}-sass.patch
	sed -i \
		-e '/vendor\//d' \
		metadata || die
	popd &>/dev/null
}
