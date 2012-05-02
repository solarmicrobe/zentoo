# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rst"

inherit ruby-fakegem

DESCRIPTION="Livestatus is a simple Ruby library to control Nagios via MK Livestatus."
HOMEPAGE="https://github.com/zenops/livestatus"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3
	dev-ruby/i18n
	dev-ruby/patron
	dev-ruby/yajl-ruby
	dev-ruby/sinatra
	www-servers/thin
"

all_ruby_install() {
	all_fakegem_install

	insinto /etc/nagios
	newins config.ru live.ru

	newinitd "${FILESDIR}"/livestatusd.initd livestatusd
}
