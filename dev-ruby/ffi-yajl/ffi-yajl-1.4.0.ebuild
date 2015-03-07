# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby FFI wrapper around YAJL 2.x"
HOMEPAGE="http://github.com/opscode/ffi-yajl"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-libs/yajl"
RDEPEND="${DEPEND}"

ruby_add_rdepend "dev-ruby/ffi dev-ruby/libyajl2"

each_ruby_prepare() {
	ruby_fakegem_metadata_gemspec ../metadata ${RUBY_FAKEGEM_GEMSPEC}
	sed -i -e '/libyajl2/d' ${RUBY_FAKEGEM_GEMSPEC} || die "Unable to fix up dependencies."
}

each_ruby_configure() {
	${RUBY} -Cext/ffi_yajl/ext/encoder extconf.rb || die
	${RUBY} -Cext/ffi_yajl/ext/parser extconf.rb || die
}

each_ruby_compile() {
	emake -Cext/ffi_yajl/ext/encoder V=1
	emake -Cext/ffi_yajl/ext/parser V=1
	cp ext/ffi_yajl/ext/encoder/*.so lib/ffi_yajl/ext/ || die
	cp ext/ffi_yajl/ext/parser/*.so lib/ffi_yajl/ext/ || die
}
