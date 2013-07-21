# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

if [[ ${PV} = 9999* ]]; then
	inherit git-2
else
	MY_P=${P/headers/driver}
	SRC_URI="mirror://alsaproject/driver/${MY_P}.tar.bz2"
	S=${WORKDIR}/${MY_P}
	KEYWORDS="amd64"
fi

inherit eutils

DESCRIPTION="Header files for Advanced Linux Sound Architecture kernel modules"
HOMEPAGE="http://www.alsa-project.org/"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
IUSE=""

RESTRICT="binchecks strip"

RDEPEND="!sys-kernel/linux-headers"
DEPEND="${RDEPEND}"

EGIT_REPO_URI="git://git.alsa-project.org/alsa-kmirror.git
	http://git.alsa-project.org/http/alsa-kmirror.git"

pkg_setup() {
	local obsolete_symlink="${ROOT}"/usr/include/sound
	if [[ -L ${obsolete_symlink} ]]; then
		ebegin "Removing obsolete symlink ${obsolete_symlink}"
		rm "${obsolete_symlink}"
		eend $?
	fi
}

src_prepare() {
	[[ ${PV} = 9999* ]] || epatch "${FILESDIR}"/${PN}-1.0.6a-user.patch
}

src_configure() { :; }
src_compile() { :; }

src_install() {
	[[ ${PV} = 9999* ]] || cd alsa-kernel
	insinto /usr/include/sound
	doins include/*.h
}
