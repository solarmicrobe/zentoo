# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

TEXLIVE_MODULE_CONTENTS="avantgar bookman charter cm-super cmextra courier ec euro euro-ce eurosym fpl helvetic lm lm-math marvosym mathpazo ncntrsbk palatino pxfonts rsfs symbol tex-gyre tex-gyre-math times tipa txfonts utopia wasy wasysym zapfchan zapfding collection-fontsrecommended
"
TEXLIVE_MODULE_DOC_CONTENTS="charter.doc cm-super.doc ec.doc euro.doc euro-ce.doc eurosym.doc fpl.doc lm.doc lm-math.doc marvosym.doc mathpazo.doc pxfonts.doc rsfs.doc tex-gyre.doc tex-gyre-math.doc tipa.doc txfonts.doc utopia.doc wasy.doc wasysym.doc "
TEXLIVE_MODULE_SRC_CONTENTS="euro.source fpl.source lm.source marvosym.source mathpazo.source wasysym.source "
inherit  texlive-module
DESCRIPTION="TeXLive Recommended fonts"

LICENSE=" BSD GPL-1 GPL-2 LPPL-1.3 OFL TeX-other-free"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND=">=dev-texlive/texlive-basic-2014
!=dev-texlive/texlive-basic-2007*
!<dev-texlive/texlive-fontsextra-2010
!<dev-texlive/texlive-latexrecommended-2014
"
RDEPEND="${DEPEND} "
