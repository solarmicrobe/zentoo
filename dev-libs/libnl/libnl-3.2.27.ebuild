# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_{3,4} )
DISTUTILS_OPTIONAL=1
inherit distutils-r1 eutils libtool multilib multilib-minimal

LIBNL_P=${P/_/-}
LIBNL_DIR=${PV/_/}
LIBNL_DIR=${LIBNL_DIR//./_}

DESCRIPTION="A collection of libraries providing APIs to netlink protocol based Linux kernel interfaces"
HOMEPAGE="http://www.infradead.org/~tgr/libnl/ https://github.com/thom311/libnl"
SRC_URI="
	https://github.com/thom311/${PN}/releases/download/${PN}${LIBNL_DIR}/${P/_rc/-rc}.tar.gz
"
LICENSE="LGPL-2.1 utils? ( GPL-2 )"
SLOT="3"
KEYWORDS="amd64"
IUSE="static-libs python utils"

RDEPEND="python? ( ${PYTHON_DEPS} )
	abi_x86_32? (
		!<=app-emulation/emul-linux-x86-baselibs-20140508-r5
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32(-)]
	)"
DEPEND="${RDEPEND}
	python? ( dev-lang/swig )
	sys-devel/flex
	sys-devel/bison
"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DOCS=( ChangeLog )

S=${WORKDIR}/${LIBNL_P}

MULTILIB_WRAPPED_HEADERS=(
	# we do not install CLI stuff for non-native
	/usr/include/libnl3/netlink/cli/addr.h
	/usr/include/libnl3/netlink/cli/class.h
	/usr/include/libnl3/netlink/cli/cls.h
	/usr/include/libnl3/netlink/cli/ct.h
	/usr/include/libnl3/netlink/cli/exp.h
	/usr/include/libnl3/netlink/cli/link.h
	/usr/include/libnl3/netlink/cli/neigh.h
	/usr/include/libnl3/netlink/cli/qdisc.h
	/usr/include/libnl3/netlink/cli/route.h
	/usr/include/libnl3/netlink/cli/rule.h
	/usr/include/libnl3/netlink/cli/tc.h
	/usr/include/libnl3/netlink/cli/utils.h
)

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.1-vlan-header.patch
	epatch "${FILESDIR}"/${PN}-3.2.20-rtnl_tc_get_ops.patch
	epatch "${FILESDIR}"/${PN}-3.2.20-cache-api.patch

	elibtoolize

	if use python; then
		cd "${S}"/python || die
		distutils-r1_src_prepare
	fi

	# out-of-source build broken
	# https://github.com/thom311/libnl/pull/58
	multilib_copy_sources
}

multilib_src_configure() {
	econf \
		--disable-silent-rules \
		$(use_enable static-libs static) \
		$(multilib_native_use_enable utils cli)
}

multilib_src_compile() {
	default

	if multilib_is_native_abi && use python; then
		cd python || die
		distutils-r1_src_compile
	fi
}

multilib_src_install() {
	emake DESTDIR="${D}" install

	if multilib_is_native_abi && use python; then
		# Unset DOCS= since distutils-r1.eclass interferes
		local DOCS=()
		cd python || die
		distutils-r1_src_install
	fi
}

multilib_src_install_all() {
	einstalldocs
	prune_libtool_files --modules
}