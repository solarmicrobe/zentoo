# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit multilib eutils

DESCRIPTION="Percona XtraBackup is an online (non-blocking) backup tool for InnoDB and XtraDB engines"
HOMEPAGE="http://www.percona.com/docs/wiki/percona-xtrabackup:start"

BASE_URI="http://www.percona.com/downloads/XtraBackup/xtrabackup-${PV}/Linux/binary"
SRC_URI="amd64? ( ${BASE_URI}/x86_64/xtrabackup-${PV}.tar.gz -> ${P}_amd64.tar.gz )
	x86? ( ${BASE_URI}/i686/xtrabackup-${PV}.tar.gz -> ${P}_x86.tar.gz )"

LICENSE="GPL-2 public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/perl
	dev-libs/libaio
	sys-libs/zlib"

S="${WORKDIR}"

src_install() {
	dobin "${S}"/bin/{innobackupex,xtrabackup_55,xtrabackup}
	dosym /usr/bin/innobackupex /usr/bin/innobackupex-1.5.1
}
