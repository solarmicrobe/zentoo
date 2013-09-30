# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST=""

RUBY_FAKEGEM_EXTRA_DOC="README.md"

inherit ruby-fakegem eutils

DESCRIPTION="Hadoop WebHDFS plugin for Fluentd event collector"
HOMEPAGE="https://github.com/fluent/fluent-plugin-webhdfs/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_bdepend "
	dev-ruby/fluentd
	>=dev-ruby/fluent-mixin-plaintextformatter-0.2.1
	>=dev-ruby/fluent-mixin-config-placeholders-0.2.0
	>=dev-ruby/webhdfs-0.5.3
"
