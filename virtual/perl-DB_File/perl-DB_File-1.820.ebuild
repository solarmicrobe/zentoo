# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Virtual for DB_File"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="|| ( ~dev-lang/perl-5.12.3[berkdb] ~dev-lang/perl-5.12.2[berkdb] ~dev-lang/perl-5.12.1[berkdb] ~dev-lang/perl-5.10.1[berkdb] ~perl-core/DB_File-${PV} )"
