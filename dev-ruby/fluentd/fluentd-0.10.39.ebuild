# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST=""

RUBY_FAKEGEM_EXTRA_DOC="README.rdoc"

inherit ruby-fakegem eutils

DESCRIPTION="Fluentd data collector, Log Everything in JSON"
HOMEPAGE="http://fluentd.org/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_bdepend "
	>=dev-ruby/coolio-1.1.1
	>=dev-ruby/http_parser-0.5.1
	>=dev-ruby/json-1.4.3
	>=dev-ruby/msgpack-0.5.4
	>=dev-ruby/yajl-ruby-1.0
"
