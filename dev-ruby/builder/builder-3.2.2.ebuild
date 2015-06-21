# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

RUBY_FAKEGEM_TASK_TEST="test_all"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.md CHANGES"

inherit ruby-fakegem eutils versionator

DESCRIPTION="A builder to facilitate programatic generation of XML markup"
HOMEPAGE="http://rubyforge.org/projects/builder/"

LICENSE="MIT"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="amd64"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/rdoc )"

all_ruby_prepare() {
	sed -i \
		-e '/rdoc\.template .*jamis/d' \
		Rakefile || die

	rm rakelib/* || die
}
