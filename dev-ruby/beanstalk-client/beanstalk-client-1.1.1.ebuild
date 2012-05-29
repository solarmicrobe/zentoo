# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Ruby client for beanstalkd"
HOMEPAGE="https://github.com/kr/beanstalk-client-ruby"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
