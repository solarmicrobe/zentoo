# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A library to instrument ruby code"
HOMEPAGE="https://github.com/eric/metriks"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/atomic
	dev-ruby/avl_tree
	dev-ruby/hitimes
"
