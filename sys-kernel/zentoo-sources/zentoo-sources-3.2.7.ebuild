# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ETYPE="sources"
VSPV="2.3.2.7"

#K_USEPV=1
#K_NOSETEXTRAVERSION=1

inherit kernel-2
detect_version

KEYWORDS="amd64"
IUSE=""

DESCRIPTION="Kernel sources with Linux-VServer and Zentoo patches."
HOMEPAGE="http://www.zentoo.org"
SRC_URI="${KERNEL_URI} ${ARCH_URI}
	http://vserver.13thfloor.at/Experimental/patch-${CKV}-vs${VSPV}.diff"

UNIPATCH_LIST="${DISTDIR}/patch-${CKV}-vs${VSPV}.diff"
UNIPATCH_STRICTORDER=1
