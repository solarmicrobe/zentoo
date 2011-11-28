# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit versionator

MY_PN="gtk-doc"
MY_P=${MY_PN}-${PV}
MAJ_PV=$(get_version_component_range 1-2)

DESCRIPTION="Automake files from gtk-doc"
HOMEPAGE="http://www.gtk.org/gtk-doc/"
SRC_URI="mirror://gnome/sources/${MY_PN}/${PV}/${MY_P}.tar.bz2"

LICENSE="GPL-2 FDL-1.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=dev-lang/perl-5.6"

DEPEND="${RDEPEND}
	!<dev-util/gtk-doc-${MAJ_PV}
	app-text/docbook-xml-dtd:4.3
	app-text/docbook-xsl-stylesheets
	dev-libs/libxslt
	>=dev-util/pkgconfig-0.19"

# This ebuild doesn't even compile anything, causing tests to fail when updating (bug #316071)
RESTRICT="test"

S=${WORKDIR}/${MY_P}

DOCS="AUTHORS ChangeLog MAINTAINERS NEWS README TODO"

src_configure() {
	econf --with-xml-catalog="${EPREFIX}"/etc/xml/catalog
}

src_compile() {
	:
}

src_install() {
	exeinto /usr/bin/
	doexe gtkdoc-rebase || die "doexe failed"

	insinto /usr/share/aclocal
	doins gtk-doc.m4 || die "doins failed"
}
