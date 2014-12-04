# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
AUTOTOOLS_AUTORECONF="1"

inherit flag-o-matic linux-info linux-mod autotools-utils

if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/zfsonlinux/${PN}.git"
else
	inherit eutils versionator
	MY_PV=$(replace_version_separator 3 '-')
	SRC_URI="https://github.com/zfsonlinux/${PN}/archive/${PN}-${MY_PV}.tar.gz"
	S="${WORKDIR}/${PN}-${PN}-${MY_PV}"
	KEYWORDS="amd64"
fi

DESCRIPTION="The Solaris Porting Layer is a Linux kernel module which provides many of the Solaris kernel APIs"
HOMEPAGE="http://zfsonlinux.org/"

LICENSE="GPL-2"
SLOT="0"
IUSE="custom-cflags debug debug-log"
RESTRICT="debug? ( strip ) test"

COMMON_DEPEND="dev-lang/perl
	virtual/awk"

DEPEND="${COMMON_DEPEND}"

RDEPEND="${COMMON_DEPEND}
	!sys-devel/spl"

AT_M4DIR="config"
AUTOTOOLS_IN_SOURCE_BUILD="1"

src_prepare() {
	# Workaround for hard coded path
	sed -i "s|/sbin/lsmod|/bin/lsmod|" "${S}/scripts/check.sh" || \
		die "Cannot patch check.sh"

	# splat is unnecessary unless we are debugging
	use debug || sed -e 's/^subdir-m += splat$//' -i "${S}/module/Makefile.in"

	# Set module revision number
	[ ${PV} != "9999" ] && \
		{ sed -i "s/\(Release:\)\(.*\)1/\1\2${PR}-gentoo/" "${S}/META" || die "Could not set Gentoo release"; }

	autotools-utils_src_prepare
}

src_configure() {
	use custom-cflags || strip-flags
	filter-ldflags -Wl,*

	set_arch_to_kernel
	local myeconfargs=(
		--bindir="${EPREFIX}/bin"
		--sbindir="${EPREFIX}/sbin"
		--with-config=all
		--with-linux="${KV_DIR}"
		--with-linux-obj="${KV_OUT_DIR}"
		$(use_enable debug)
		$(use_enable debug-log)
	)
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install INSTALL_MOD_PATH=${INSTALL_MOD_PATH:-$EROOT}
	dodoc AUTHORS DISCLAIMER README.markdown
}

pkg_postinst() {
	linux-mod_pkg_postinst

	# Remove old modules
	if [ -d "${EROOT}lib/modules/${KV_FULL}/addon/spl" ]
	then
		ewarn "${PN} now installs modules in ${EROOT}lib/modules/${KV_FULL}/extra/spl"
		ewarn "Old modules were detected in ${EROOT}lib/modules/${KV_FULL}/addon/spl"
		ewarn "Automatically removing old modules to avoid problems."
		rm -r "${EROOT}lib/modules/${KV_FULL}/addon/spl" || die "Cannot remove modules"
		rmdir --ignore-fail-on-non-empty "${EROOT}lib/modules/${KV_FULL}/addon"
	fi
}
