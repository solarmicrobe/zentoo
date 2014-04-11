# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for FORTRAN 77 BLAS implementation"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="|| (
		sci-libs/blas-reference
		>=sci-libs/mkl-9.1.023
		sci-libs/acml
		sci-libs/blas-goto
	)"
DEPEND=""
