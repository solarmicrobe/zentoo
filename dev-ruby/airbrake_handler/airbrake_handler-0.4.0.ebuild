# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Chef handler for sending exceptions to Airbrake"
HOMEPAGE="http://github.com/morgoth/airbrake_handler"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_rdepend "
	>=app-admin/chef-0.9.0
	>=dev-ruby/toadhopper-2.0
"
