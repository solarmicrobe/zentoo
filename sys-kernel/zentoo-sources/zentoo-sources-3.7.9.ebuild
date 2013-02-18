# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ETYPE="sources"
VSPV="2.3.5.6"
VSKV="3.7.7"

inherit kernel-2 versionator
detect_version

KEYWORDS="amd64"
IUSE=""

DESCRIPTION="Kernel sources with Linux-VServer and Zentoo patches."
HOMEPAGE="http://www.zentoo.org"
SRC_URI="${KERNEL_URI} ${ARCH_URI}
	http://vserver.13thfloor.at/Experimental/patch-${VSKV}-vs${VSPV}.diff"

UNIPATCH_LIST="${DISTDIR}/patch-${VSKV}-vs${VSPV}.diff"
UNIPATCH_STRICTORDER=1

src_unpack() {
	local version=$(get_version_component_range 1)
	local patchlevel=$(get_version_component_range 2)
	local sublevel=$(get_version_component_range 3)

	sed -i \
		-e "s/^ VERSION = .*/ VERSION = ${version}/" \
		-e "s/^ PATCHLEVEL = .*/ PATCHLEVEL = ${patchlevel}/" \
		-e "s/^ SUBLEVEL = .*/ SUBLEVEL = ${sublevel}/" \
		${UNIPATCH_LIST}

	kernel-2_src_unpack
}
