# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

inherit ruby-fakegem

DESCRIPTION="vendored copy of libyajl2"
HOMEPAGE="https://github.com/opscode/libyajl2-gem"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-libs/yajl"
RDEPEND="${DEPEND}"
