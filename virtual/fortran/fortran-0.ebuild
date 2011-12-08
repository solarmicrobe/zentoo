# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Virtual for Fortran Compiler"
HOMEPAGE=""
SRC_URI=""

SLOT="0"
KEYWORDS="amd64"
LICENSE=""
IUSE="openmp"

RDEPEND="
	|| ( sys-devel/gcc[fortran] sys-devel/gcc-apple[fortran]
	dev-lang/ekopath dev-lang/path64 dev-lang/ifc )
	openmp? (
		|| ( sys-devel/gcc[fortran,openmp?] sys-devel/gcc-apple[fortran,openmp?]
		dev-lang/ekopath dev-lang/path64[openmp?] dev-lang/ifc ) )"
DEPEND="${RDEPEND}"
