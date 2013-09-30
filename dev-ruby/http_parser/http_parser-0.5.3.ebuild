# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_NAME="http_parser.rb"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST=""

RUBY_FAKEGEM_EXTRA_DOC="README.md"

inherit ruby-fakegem eutils

DESCRIPTION="simple callback-based HTTP request/response parser"
HOMEPAGE="https://github.com/tmm1/http_parser.rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext/ruby_http_parser extconf.rb || die "Configuration of extension failed."
}

each_ruby_compile() {
	emake -Cext/ruby_http_parser
	cp ext/ruby_http_parser/ruby_http_parser$(get_modname) lib/ || die "Unable to install iobuffer library."
}
