# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

USE_RUBY="ruby18 ruby19 jruby ree18"

RUBY_FAKEGEM_TASK_DOC="doc"
RUBY_FAKEGEM_TASK_TEST="spec:normal"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README"

inherit ruby-fakegem

DESCRIPTION="Simple library to generate UUIDs"
HOMEPAGE="http://uuidtools.rubyforge.org/"
SRC_URI="mirror://rubyforge/${PN}/${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# Rakefile does not work without rspec (and is quite difficult to work
# it around).
ruby_add_bdepend "
	doc? ( >=dev-ruby/rspec-1.0.8:0 )
	test? ( >=dev-ruby/rspec-1.0.8:0 )"
