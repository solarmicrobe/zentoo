# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="A virtual to choose between different icon themes"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="|| ( x11-themes/gnome-icon-theme
	x11-themes/faenza-icon-theme
	lxde-base/lxde-icon-theme
	x11-themes/tango-icon-theme
	kde-base/oxygen-icons )"
