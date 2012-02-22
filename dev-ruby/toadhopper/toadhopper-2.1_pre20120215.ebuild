# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A base library for Airbrake error reporting"
HOMEPAGE="http://github.com/toolmantim/toadhopper"
SRC_URI="https://github.com/toolmantim/${PN}/tarball/2066c5f5 -> ${P}.tgz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RUBY_S="toolmantim-${PN}-*"

each_ruby_prepare() {
	sed -i -e 's@OpenSSL::X509::DEFAULT_CERT_FILE@"/etc/ssl/certs/ca-certificates.crt"@g' lib/toadhopper.rb
}
