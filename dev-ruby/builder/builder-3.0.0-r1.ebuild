# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 ree18 jruby"

RUBY_FAKEGEM_TASK_TEST="test_all"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README CHANGES"

inherit ruby-fakegem eutils

DESCRIPTION="A builder to facilitate programatic generation of XML markup"
HOMEPAGE="http://rubyforge.org/projects/builder/"

LICENSE="MIT"
SLOT="3"
KEYWORDS="amd64"
IUSE=""

ruby_add_bdepend "test? ( virtual/ruby-test-unit )"

DEPEND+=" doc? ( dev-util/ctags )"

all_ruby_prepare() {
	sed -i \
		-e '/rdoc\.template .*jamis/d' \
		-e 's:xctags:exuberant-ctags:' \
		Rakefile || die

	# Remove file that should not be part of the distribution.
	rm test/test_cssbuilder.rb || die

	epatch "${FILESDIR}"/${P}+ruby-1.9.2.patch
	epatch "${FILESDIR}"/${P}-tests.patch
}
