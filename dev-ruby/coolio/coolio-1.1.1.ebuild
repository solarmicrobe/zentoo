# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_NAME="cool.io"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST=""

RUBY_FAKEGEM_EXTRA_DOC="README.md"

inherit ruby-fakegem eutils

DESCRIPTION="Simple evented I/O for Ruby"
HOMEPAGE="https://github.com/tarcieri/cool.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_bdepend ">=dev-ruby/iobuffer-1.0.0"

each_ruby_configure() {
	${RUBY} -Cext/cool.io extconf.rb || die "Configuration of extension failed."
	${RUBY} -Cext/http11_client extconf.rb || die "Configuration of extension failed."
}

each_ruby_compile() {
	emake -Cext/cool.io
	cp ext/cool.io/cool.io_ext$(get_modname) lib/ || die "Unable to install cool.io library."
	emake -Cext/http11_client
	cp ext/http11_client/http11_client$(get_modname) lib/ || die "Unable to install http11_client library."
}
