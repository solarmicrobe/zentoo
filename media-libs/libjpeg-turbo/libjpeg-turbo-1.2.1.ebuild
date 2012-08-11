# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

JPEG_ABI=8

if [[ ${PV} == *_p20* ]]; then
	SRC_URI="mirror://gentoo/${P}.tar.xz"
	inherit autotools
elif [[ ${PV} != "9999" ]]; then
	SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
fi

inherit eutils java-pkg-opt-2 libtool toolchain-funcs

DESCRIPTION="MMX, SSE, and SSE2 SIMD accelerated JPEG library"
HOMEPAGE="http://libjpeg-turbo.virtualgl.org/ http://sourceforge.net/projects/libjpeg-turbo/"
SRC_URI="${SRC_URI}
	mirror://debian/pool/main/libj/libjpeg${JPEG_ABI}/libjpeg${JPEG_ABI}_${JPEG_ABI}d-1.debian.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="java static-libs"

ASM_DEPEND="|| ( dev-lang/nasm dev-lang/yasm )"
COMMON_DEPEND="!media-libs/jpeg:0"
RDEPEND="${COMMON_DEPEND}
	java? ( >=virtual/jre-1.5 )"
DEPEND="${COMMON_DEPEND}
	amd64? ( ${ASM_DEPEND} )
	java? ( >=virtual/jdk-1.5 )"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.2.0-x32.patch #420239

	if [[ -x ./configure ]]; then
		elibtoolize
	else
		eautoreconf
	fi

	epunt_cxx #424689

	java-pkg-opt-2_src_prepare
}

src_configure() {
	if use java; then
		export JAVACFLAGS="$(java-pkg_javac-args)"
		export JNI_CFLAGS="$(java-pkg_get-jni-cflags)"
	fi
	local myconf=()
	[[ ${ABI} == "x32" ]] && myconf+=( --without-simd ) #420239

	econf \
		$(use_enable static-libs static) \
		--with-jpeg${JPEG_ABI} \
		$(use_with java) \
		"${myconf[@]}"
}

src_compile() {
	local _java_makeopts
	use java && _java_makeopts="-j1"
	emake ${_java_makeopts}

	ebegin "Building exifautotran and jpegexiforient extra tools"
	pushd ../debian/extra >/dev/null
	emake CC="$(tc-getCC)" CFLAGS="${LDFLAGS} ${CFLAGS}"
	popd >/dev/null
	eend $?
}

src_test() {
	emake test
}

src_install() {
	emake \
		DESTDIR="${D}" \
		docdir="${EPREFIX}"/usr/share/doc/${PF} \
		exampledir="${EPREFIX}"/usr/share/doc/${PF} \
		install

	prune_libtool_files

	insinto /usr/share/doc/${PF}/html
	doins -r doc/html/*

	if use java; then
		insinto /usr/share/doc/${PF}/html/java
		doins -r java/doc/*
		newdoc java/README README.java

		rm -rf "${ED}"usr/classes
		java-pkg_dojar java/turbojpeg.jar
	fi

	ebegin "Installing exifautotran and jpegexiforient extra tools"
	pushd ../debian/extra >/dev/null
	newdoc ../changelog changelog.debian

	emake \
		DESTDIR="${D}" prefix="${EPREFIX}"/usr \
		INSTALL="install -m755" INSTALLDIR="install -d -m755" \
		install
	popd >/dev/null
	eend $?
}