# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit base eutils
MY_PN="liblinear-weights"
MY_P="${MY_PN}-${PV}"

PYTHON_COMPAT=( python{2_6,2_7} )

DESCRIPTION="LIBLINEAR is a linear classifier for data with millions of instances and features."
HOMEPAGE="http://www.csie.ntu.edu.tw/~cjlin/liblinear/"
SRC_URI="http://www.csie.ntu.edu.tw/~cjlin/libsvmtools/weights/liblinear-weights-1.94.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/mysql-python
		sci-libs/scikits_learn
		dev-python/pandas
"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${MY_P}"
INSTALL_DIR=/opt/${MY_PN}

src_unpack() {
	unpack ${A}
}

src_compile() {
	pushd "${S}"
	make || die "make failed"
	popd
}

src_install() {
	dodir "${INSTALL_DIR}" || die "can't create ${INSTALL_DIR}"
	dodir "${INSTALL_DIR}"/bin || die "can't create ${INSTALL_DIR}/bin"
	insinto "${INSTALL_DIR}/bin" || die "install failed"
	doins "${S}"/train || die "install failed"
	doins "${S}"/predict || die "install failed"
	fperms +x "${INSTALL_DIR}/bin/train" || die
	fperms +x "${INSTALL_DIR}/bin/predict" || die

	cat > 99${MY_PN} <<-EOF
		PATH=${INSTALL_DIR}/bin
		ROOTPATH=${INSTALL_DIR}/bin
	EOF
	doenvd 99${MY_PN} || die "doenvd failed"
}
