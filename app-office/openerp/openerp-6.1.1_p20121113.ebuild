# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
PYTHON_DEPEND="2"

inherit eutils distutils user

DESCRIPTION="Open Source ERP & CRM"
HOMEPAGE="http://www.openerp.com/"
FNAME="${PN}-6.1-20121113-003313"
SRC_URI="http://nightly.openerp.com/6.1/nightly/src/${FNAME}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="+postgres ldap ssl"

CDEPEND="postgres? ( dev-db/postgresql-server )
	ssl? ( dev-python/pyopenssl )
	ldap? ( dev-python/python-ldap )
	dev-python/python-dateutil
	dev-python/feedparser
	dev-python/gdata
	dev-python/lxml
	dev-python/mako
	dev-python/python-openid
	dev-python/psycopg:2
	dev-python/Babel
	dev-python/pychart
	media-gfx/pydot
	dev-python/reportlab
	dev-python/simplejson
	dev-python/vatnumber
	dev-python/vobject
	dev-python/pytz
	dev-python/pywebdav
	dev-python/werkzeug
	dev-python/pyyaml
	dev-python/xlwt
	dev-python/zsi"

RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}"

OPENERP_USER="openerp"
OPENERP_GROUP="openerp"

S="${WORKDIR}/${FNAME}"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	epatch "${FILESDIR}/${PN}-6.1-setup.py.patch"
}

src_install() {
	distutils_src_install

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

	fowners ${OPENERP_USER}:${OPENERP_GROUP} /var/run/openerp
	fowners ${OPENERP_USER}:${OPENERP_GROUP} /var/log/openerp
	fowners -R ${OPENERP_USER}:${OPENERP_GROUP} "$(python_get_sitedir)/${PN}/addons/"
}

pkg_postinst() {
	chown ${OPENERP_USER}:${OPENERP_GROUP} /var/run/openerp
	chown ${OPENERP_USER}:${OPENERP_GROUP} /var/log/openerp
	chown -R ${OPENERP_USER}:${OPENERP_GROUP} "$(python_get_sitedir)/${PN}/addons/"
}
