# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ree18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="rack-protection.gemspec"

inherit ruby-fakegem eutils versionator

DESCRIPTION="This gem protects against typical web attacks."
HOMEPAGE="https://github.com/rkh/rack-protection"

LICENSE="MIT"
SLOT="$(get_version_component_range 1)"
KEYWORDS="amd64"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/rack-test dev-ruby/rspec:2 )"
