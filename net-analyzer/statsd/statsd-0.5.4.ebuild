# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A network daemon for aggregating statistics and sending them to graphite"
HOMEPAGE="https://github.com/quasor/statsd"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

ruby_add_bdepend "
	dev-ruby/eventmachine
	dev-ruby/erubis
"

all_ruby_prepare() {
	epatch "${FILESDIR}"/0001-Explicitly-require-socket-for-client.patch
	epatch "${FILESDIR}"/0002-Ruby-1.8.7-compatibily-round-n-doesn-t-exist.patch
}

all_ruby_install() {
	all_fakegem_install

	insinto /etc/statsd
	doins config.yml
}
