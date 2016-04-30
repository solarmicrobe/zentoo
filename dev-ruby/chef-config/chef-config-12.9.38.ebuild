# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem versionator

DESCRIPTION="Chef's default configuration and config loading"
HOMEPAGE="https://github.com/chef/chef"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/fuzzyurl-0.8.0
	>=dev-ruby/mixlib-config-2.0
	>=dev-ruby/mixlib-shellout-2.0"

each_ruby_prepare() {
	ruby_fakegem_metadata_gemspec ../metadata ${RUBY_FAKEGEM_GEMSPEC}
	sed -i -e '/rspec/d' ${RUBY_FAKEGEM_GEMSPEC} || die "Unable to fix up dependencies."
}
