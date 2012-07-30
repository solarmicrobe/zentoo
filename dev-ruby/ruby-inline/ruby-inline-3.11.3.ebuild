# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ree18 ruby19"

RUBY_FAKEGEM_NAME="RubyInline"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.txt History.txt"

inherit ruby-fakegem

DESCRIPTION="Allows to embed C/C++ in Ruby code"
HOMEPAGE="http://www.zenspider.com/ZSS/Products/RubyInline/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc test"

ruby_add_rdepend dev-ruby/zentest

ruby_add_bdepend "
	doc? (
		dev-ruby/hoe
		dev-ruby/hoe-seattlerb
	)
	test? (
		dev-ruby/hoe
		dev-ruby/hoe-seattlerb
	)"

all_ruby_prepare() {
	epatch "${FILESDIR}/${PN}-3.11.0-gentoo.patch"

	# Respect ruby's (and thus Gentoo's) LDFLAGS, and explicitly link
	# against the ruby shared library to avoid confusion and potential
	# crashes when later using the shared object.
	epatch "${FILESDIR}/${PN}-3.11.1-ldflags.patch"

	sed -i -e '/isolate/ s:^:#:' Rakefile || die
}

all_ruby_install() {
	all_fakegem_install

	docinto examples
	dodoc example.rb example2.rb demo/*.rb
}
