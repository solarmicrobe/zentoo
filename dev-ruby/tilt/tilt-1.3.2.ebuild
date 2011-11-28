# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

# jruby fails tests
USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md TEMPLATES.md"

inherit ruby-fakegem

DESCRIPTION="A thin interface over a Ruby template engines to make their usage as generic as possible."
HOMEPAGE="http://github.com/rtomayko/tilt"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RUBY_PATCHES=( "${P}-thread_id.patch" )

ruby_add_bdepend "test? ( virtual/ruby-test-unit )"
ruby_add_rdepend ">=dev-ruby/builder-2.0.0"

# Tests fail when markaby is not new enough, but it's optional.
DEPEND="${DEPEND} !!<dev-ruby/markaby-0.6.9-r1"
RDEPEND="${RDEPEND}"
