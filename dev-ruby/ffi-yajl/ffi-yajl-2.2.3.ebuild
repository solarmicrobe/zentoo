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

ruby_add_rdepend "dev-ruby/libyajl2"

each_ruby_prepare() {
	ruby_fakegem_metadata_gemspec ../metadata ${RUBY_FAKEGEM_GEMSPEC}
	sed -i -e '/libyajl2/d' ${RUBY_FAKEGEM_GEMSPEC} || die "Unable to fix up dependencies."
}

each_ruby_configure() {
	for i in encoder parser dlopen; do
		${RUBY} -Cext/ffi_yajl/ext/${i} extconf.rb || die
	done
}

each_ruby_compile() {
	for i in encoder parser dlopen; do
		emake -Cext/ffi_yajl/ext/${i} V=1
		cp ext/ffi_yajl/ext/${i}/*.so lib/ffi_yajl/ext/ || die
	done
}
