# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_NAME="libxml-ruby"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README CHANGES"

inherit ruby-fakegem

DESCRIPTION="Ruby libxml with a user friendly API, akin to REXML, but feature complete and significantly faster."
HOMEPAGE="http://libxml.rubyforge.org"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="${RDEPEND} dev-libs/libxml2"
DEPEND="${DEPEND} dev-libs/libxml2"

# The tests fail with a segmentation fault. Not good, and plenty of
# similar bug reports upstream, but no fix yet.
RESTRICT="test"

each_ruby_configure() {
		${RUBY} setup.rb config
}

each_ruby_compile() {
		${RUBY} setup.rb setup
}

each_ruby_install() {
	each_fakegem_install

	ruby_fakegem_newins ext/libxml/libxml_ruby.so lib/libxml_ruby.so
}
