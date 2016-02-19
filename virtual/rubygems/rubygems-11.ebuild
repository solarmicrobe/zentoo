# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

inherit ruby-ng

DESCRIPTION="Virtual ebuild for rubygems"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	ruby_targets_rbx? ( dev-lang/rubinius )
	ruby_targets_ruby19? ( >=dev-ruby/rubygems-1.8.10-r1[ruby_targets_ruby19] )
	ruby_targets_ruby20? ( >=dev-ruby/rubygems-2.0.2[ruby_targets_ruby20] )
	ruby_targets_ruby21? ( >=dev-ruby/rubygems-2.0.14[ruby_targets_ruby21] )
	ruby_targets_ruby22? ( >=dev-ruby/rubygems-2.4.2[ruby_targets_ruby22] )
	ruby_targets_ruby23? ( >=dev-ruby/rubygems-2.5.1[ruby_targets_ruby23] )"

pkg_setup() { :; }
src_unpack() { :; }
src_prepare() { :; }
src_compile() { :; }
src_install() { :; }
pkg_preinst() { :; }
pkg_postinst() { :; }
