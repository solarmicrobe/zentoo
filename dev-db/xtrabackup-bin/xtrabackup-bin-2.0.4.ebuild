# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit multilib eutils

MY_BUILD=484

DESCRIPTION="Percona XtraBackup is an online (non-blocking) backup tool for InnoDB and XtraDB engines"
HOMEPAGE="http://www.percona.com/docs/wiki/percona-xtrabackup:start"

BASE_URI="http://www.percona.com/downloads/XtraBackup/XtraBackup-${PV}/binary/Linux"
SRC_URI="amd64? ( ${BASE_URI}/x86_64/percona-xtrabackup-${PV}-${MY_BUILD}.tar.gz -> ${P}_amd64.tar.gz )"

LICENSE="GPL-2 public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/perl
	dev-libs/libaio
	sys-libs/zlib"

S="${WORKDIR}/percona-xtrabackup-${PV}"

src_install() {
	dobin "${S}"/bin/{innobackupex,xbstream,xtrabackup,xtrabackup_51,xtrabackup_55}
	dosym /usr/bin/innobackupex /usr/bin/innobackupex-1.5.1
}
