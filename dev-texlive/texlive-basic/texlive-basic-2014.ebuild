# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

TEXLIVE_MODULE_CONTENTS="amsfonts bibtex cm dvipdfmx-def enctex etex etex-pkg hyph-utf8 ifluatex ifxetex knuth-lib knuth-local lua-alt-getopt luatex makeindex metafont mflogo mfware pdftex plain tex texlive-common texlive-docindex texlive-en texlive-msg-translations texlive-scripts collection-basic
"
TEXLIVE_MODULE_DOC_CONTENTS="amsfonts.doc bibtex.doc cm.doc enctex.doc etex.doc etex-pkg.doc hyph-utf8.doc ifluatex.doc ifxetex.doc lua-alt-getopt.doc luatex.doc makeindex.doc metafont.doc mflogo.doc mfware.doc pdftex.doc tex.doc texlive-common.doc texlive-docindex.doc texlive-en.doc texlive-scripts.doc "
TEXLIVE_MODULE_SRC_CONTENTS="amsfonts.source hyph-utf8.source ifluatex.source ifxetex.source mflogo.source "
inherit  texlive-module
DESCRIPTION="TeXLive Essential programs and files"

LICENSE=" GPL-1 GPL-2 LPPL-1.3 OFL TeX TeX-other-free "
SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND="!<app-text/texlive-core-2009
!<dev-texlive/texlive-latex-2009
!<dev-texlive/texlive-latexrecommended-2009
!dev-texlive/texlive-documentation-base
"
RDEPEND="${DEPEND} "
PATCHES=( "${FILESDIR}/texmfcnflua2014.patch" )
TEXLIVE_MODULE_BINSCRIPTS="texmf-dist/scripts/simpdftex/simpdftex texmf-dist/scripts/texlive/rungs.tlu"
DEPEND="${DEPEND}
!!<dev-texlive/texlive-langcjk-2011
!!<dev-texlive/texlive-langother-2012
!!<dev-texlive/texlive-langgerman-2013
!!<dev-texlive/texlive-langgreek-2013
"
