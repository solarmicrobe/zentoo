# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST=""

RUBY_FAKEGEM_EXTRA_DOC="README.md"

inherit ruby-fakegem eutils

DESCRIPTION="A Parser / Dumper for LTSV"
HOMEPAGE="https://github.com/condor/ltsv"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
