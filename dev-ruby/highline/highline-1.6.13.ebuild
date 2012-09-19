# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19 jruby ree18"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc TODO"
RUBY_FAKEGEM_DOCDIR="doc/html"

inherit ruby-fakegem

DESCRIPTION="Highline is a high-level command-line IO library for ruby."
HOMEPAGE="http://highline.rubyforge.org/"

IUSE=""
LICENSE="|| ( GPL-2 Ruby )"
SLOT="0"
KEYWORDS="amd64"

all_ruby_prepare() {
	# fix up gemspec file not to call git
	sed -i -e '/git ls-files/d' highline.gemspec || die
}

each_ruby_test() {
	case ${RUBY} in
		*jruby)
			ewarn "Skipping tests since they hang indefinitely."
			;;
		*)
			${RUBY} -S rake test || die
			;;
	esac
}
