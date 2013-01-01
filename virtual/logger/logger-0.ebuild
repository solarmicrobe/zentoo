# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for system loggers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="|| ( app-admin/metalog
	app-admin/rsyslog
	app-admin/socklog
	app-admin/sysklogd
	app-admin/syslog-ng
	app-admin/syslogread
	app-admin/busybox-sysklogd
	sys-freebsd/freebsd-usbin
)"
