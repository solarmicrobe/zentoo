# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

USE_RUBY="ruby18 ruby19 jruby ree18"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Provides a mailcap-like MIME Content-Type lookup for Ruby."
HOMEPAGE="http://rubyforge.org/projects/mime-types"

LICENSE="Ruby Artistic GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/hoe dev-ruby/rubyforge )
	test? ( dev-ruby/hoe virtual/ruby-test-unit dev-ruby/rubyforge )"

all_ruby_prepare() {
	# when rcov is installed, and a new enough Hoe is installed as
	# well, the Rakefile will fail because Hoe::test_files is no
	# longer defined. Since we don't use rcov for testing, we just
	# disable the whole section unconditionally.
	sed -i -e '/rcovtask/,/end/ s:^:#:' Rakefile || die "Rakefile fix failed"

	epatch "${FILESDIR}/${P}-linux-tests.patch"
}
