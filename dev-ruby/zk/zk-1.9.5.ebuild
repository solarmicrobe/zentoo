# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
USE_RUBY="ruby22"

inherit ruby-fakegem

DESCRIPTION="A High-Level wrapper for Apache's Zookeeper"
HOMEPAGE="https://github.com/slyphon/zk"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/logging dev-ruby/zookeeper"
