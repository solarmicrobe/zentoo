# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="An atomic reference implementation for JRuby, Rubinius, and MRI"
HOMEPAGE="http://github.com/headius/ruby-atomic"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext extconf.rb || die "Configuration of extension failed."
}

each_ruby_compile() {
	emake -Cext || die

	mkdir -p lib || die "Unable to make lib directory."
	cp ext/atomic_reference.so lib/ || die "Unable to install library."
}

