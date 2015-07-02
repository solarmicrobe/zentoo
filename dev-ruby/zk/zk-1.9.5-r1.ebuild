# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
USE_RUBY="ruby22"

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A High-Level wrapper for Apache's Zookeeper"
HOMEPAGE="https://github.com/slyphon/zk"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/logging dev-ruby/zookeeper"

each_ruby_prepare() {
	ruby_fakegem_metadata_gemspec ../metadata ${RUBY_FAKEGEM_GEMSPEC}
	sed -i -e 's/"~> 1.8.2"/">= 1.8.2"/' ${RUBY_FAKEGEM_GEMSPEC} || die "Unable to fix up dependencies."
}
