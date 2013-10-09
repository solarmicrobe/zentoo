# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils user versionator

MY_PV=$(get_version_component_range 1-2)
MY_DATE=$(get_version_component_range 3)
MY_DATE=${MY_DATE/p}
MY_TIME=002355
MY_PF="${PN}-${MY_PV}-${MY_DATE}-${MY_TIME}"

DESCRIPTION="Open Source ERP & CRM"
HOMEPAGE="http://www.openerp.com/"
SRC_URI="http://nightly.openerp.com/${MY_PV}/nightly/src/${MY_PF}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="+postgres ldap +ssl"

RDEPEND="${PYTHON_DEPS}
	postgres? ( dev-db/postgresql-server )
	ssl? ( dev-python/pyopenssl[${PYTHON_USEDEP}] )
	ldap? ( dev-python/python-ldap[${PYTHON_USEDEP}] )
	dev-python/Babel[${PYTHON_USEDEP}]
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/feedparser[${PYTHON_USEDEP}]
	dev-python/gdata[${PYTHON_USEDEP}]
	virtual/python-imaging[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/mako[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/psycopg:2[${PYTHON_USEDEP}]
	dev-python/pychart[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/python-openid[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/pywebdav[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/reportlab[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
	dev-python/unittest2[${PYTHON_USEDEP}]
	dev-python/vatnumber[${PYTHON_USEDEP}]
	dev-python/vobject[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	dev-python/xlwt[${PYTHON_USEDEP}]
	media-gfx/pydot[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

OPENERP_USER="openerp"
OPENERP_GROUP="openerp"

S="${WORKDIR}/${MY_PF}"

PATCHES=( "${FILESDIR}"/openerp-7.0-setup.py.patch )

python_install_all() {
	newinitd "${FILESDIR}/${PN}.initd" ${PN}
	newconfd "${FILESDIR}/${PN}.confd" ${PN}
	keepdir /var/log/openerp

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/openerp.logrotate openerp

	insinto /etc/openerp
	newins "${FILESDIR}"/openerp.cfg openerp.cfg
}

pkg_preinst() {
	enewgroup ${OPENERP_GROUP}
	enewuser ${OPENERP_USER} -1 -1 -1 ${OPENERP_GROUP}
}
