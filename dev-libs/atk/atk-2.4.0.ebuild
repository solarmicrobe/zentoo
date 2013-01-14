# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit gnome2

DESCRIPTION="GTK+ & GNOME Accessibility Toolkit"
HOMEPAGE="http://projects.gnome.org/accessibility/"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="amd64"
IUSE="+introspection nls"

RDEPEND=">=dev-libs/glib-2.31.2:2
	introspection? ( >=dev-libs/gobject-introspection-0.6.7 )"
DEPEND="${RDEPEND}
	>=dev-lang/perl-5
	dev-util/gtk-doc-am
	virtual/pkgconfig
	nls? ( sys-devel/gettext )"

src_prepare() {
	G2CONF="${G2CONF} $(use_enable introspection)"
	DOCS="AUTHORS ChangeLog NEWS README"

	gnome2_src_prepare

	if ! use test; then
		# don't waste time building tests (bug #226353)
		sed 's/^\(SUBDIRS =.*\)tests\(.*\)$/\1\2/' -i Makefile.am Makefile.in \
			|| die "sed failed"
	fi
}