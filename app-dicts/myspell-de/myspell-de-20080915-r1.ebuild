# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MYSPELL_SPELLING_DICTIONARIES=(
"de,DE,de_DE_frami,German (Germany),de_DE_frami.zip"
"de,AT,de_AT_frami,German (Austria),de_AT_frami.zip"
"de,CH,de_CH_frami,German (Switzerland),de_CH_frami.zip"
)

MYSPELL_HYPHENATION_DICTIONARIES=(
"de,DE,hyph_de_DE,German (Germany),hyph_de_DE.zip"
"de,CH,hyph_de_CH,German (Switzerland),hyph_de_CH.zip"
)

MYSPELL_THESAURUS_DICTIONARIES=(
"de,DE,th_de_DE_v2,German (Germany),thes_de_DE_v2.zip"
"de,CH,th_de_CH_v2,German (Switzerland),thes_de_CH_v2.zip"
)

inherit myspell

DESCRIPTION="German dictionaries for myspell/hunspell"
LICENSE="GPL-2 LGPL-2"
HOMEPAGE="http://lingucomponent.openoffice.org/"

KEYWORDS="amd64"
IUSE=""