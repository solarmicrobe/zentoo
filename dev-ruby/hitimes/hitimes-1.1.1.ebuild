# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Hitimes is a fast, high resolution timer library for recording performance metrics."
HOMEPAGE="https://rubygems.org/gems/hitimes"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext/hitimes extconf.rb || die "Configuration of extension failed."
}

each_ruby_compile() {
	emake -Cext/hitimes || die

	mkdir -p lib/hitimes/$(${RUBY} -e 'puts RUBY_VERSION[0..2]') || die "Unable to make lib directory."
	cp ext/hitimes/hitimes_ext.so lib/hitimes/$(${RUBY} -e 'puts RUBY_VERSION[0..2]')/ || die "Unable to install library."
}

