# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org SM library"

KEYWORDS="amd64"
IUSE="doc ipv6 +uuid"

RDEPEND=">=x11-libs/libICE-1.0.5
	x11-libs/xtrans
	x11-proto/xproto
	!elibc_FreeBSD? ( !elibc_SunOS? (
		uuid? ( >=sys-apps/util-linux-2.16 )
	) )"
DEPEND="${RDEPEND}
	doc? ( app-text/xmlto )"

pkg_setup() {
	local withuuid=$(use_with uuid libuuid)
	xorg-2_pkg_setup

	# do not use uuid even if available in libc (like on FreeBSD)
	use uuid || export ac_cv_func_uuid_create=no

	if use uuid ; then
		case ${CHOST} in
			*-solaris*|*-darwin*)
				if [[ ! -d ${EROOT}usr/include/uuid ]] &&
					[[ -d ${ROOT}usr/include/uuid ]]
				then
					# Solaris and Darwin have uuid provided by the host
					# system.  Since util-linux's version is based on this
					# version, and on Darwin actually breaks host headers when
					# installed, we can "pretend" for libSM we have libuuid
					# installed, while in fact we don't
					withuuid="--without-libuuid"
					export HAVE_LIBUUID=yes
					export LIBUUID_CFLAGS="-I${ROOT}usr/include/uuid"
					# Darwin has uuid in libSystem
					[[ ${CHOST} == *-solaris* ]] &&	export LIBUUID_LIBS="-luuid"
				fi
				;;
		esac
	fi
	CONFIGURE_OPTIONS="$(use_enable ipv6)
		$(use_enable doc docs)
		$(use_with doc xmlto)
		${withuuid}
		--without-fop"
}
