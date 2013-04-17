# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Advanced logging classes with buffer backend, transactions, multi logger, etc"
HOMEPAGE="https://github.com/madvertise/logging"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="syslog"

ruby_add_rdepend "syslog? ( dev-ruby/syslogger )"
