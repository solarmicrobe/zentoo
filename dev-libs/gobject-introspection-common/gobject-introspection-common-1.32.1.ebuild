# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
GNOME_ORG_MODULE="gobject-introspection"

inherit gnome.org

DESCRIPTION="Build infrastructure for GObject Introspection"
HOMEPAGE="http://live.gnome.org/GObjectIntrospection/"

LICENSE="HPND"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	!<dev-libs/gobject-introspection-1.32.0"
# Before 1.32.0, ${PN} was part of gobject-introspection

src_configure() { :; }

src_compile() { :; }

src_install() {
	dodir /usr/share/aclocal
	insinto /usr/share/aclocal
	doins m4/introspection.m4

	dodir /usr/share/gobject-introspection-1.0
	insinto /usr/share/gobject-introspection-1.0
	doins Makefile.introspection
}
