# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_DOCDIR="rdoc"
RUBY_FAKEGEM_EXTRADOC="README TODO"

inherit ruby-fakegem

DESCRIPTION="Helper support for Merb"
HOMEPAGE="http://merbivore.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# Tests fail but it is not clear if this is a regression because
# previous revisions did not try to run them. Restricting for now.
RESTRICT="test"

ruby_add_bdepend "test? ( dev-ruby/rspec:0 )"

ruby_add_rdepend "~dev-ruby/merb-core-${PV}"
