# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils fdo-mime pax-utils

MY_PV=${PV}-73507
SDK_PV=${MY_PV}
EXTP_PV=${MY_PV}
MY_P=VirtualBox-${MY_PV}-Linux
EXTP_PN=Oracle_VM_VirtualBox_Extension_Pack

DESCRIPTION="Family of powerful x86 virtualization products for enterprise as well as home use"
HOMEPAGE="http://www.virtualbox.org/"
SRC_URI="amd64? ( http://download.virtualbox.org/virtualbox/${PV}/${MY_P}_amd64.run )
	x86? ( http://download.virtualbox.org/virtualbox/${PV}/${MY_P}_x86.run )
	sdk? ( http://download.virtualbox.org/virtualbox/${PV}/VirtualBoxSDK-${SDK_PV}.zip )
	http://download.virtualbox.org/virtualbox/${PV}/${EXTP_PN}-${EXTP_PV}.vbox-extpack -> ${EXTP_PN}-${EXTP_PV}.tar.gz"

LICENSE="GPL-2 PUEL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+additions python sdk vboxwebsrv rdesktop-vrdp"
RESTRICT="mirror"

DEPEND="app-arch/unzip"

RDEPEND="~app-emulation/virtualbox-modules-${PV}
	dev-libs/libxml2
	python? ( || (
			dev-lang/python:2.7
			dev-lang/python:2.6
			dev-lang/python:2.5
			dev-lang/python:2.4
		) )"

S=${WORKDIR}

QA_TEXTRELS_amd64="opt/VirtualBox/VBoxVMM.so"
QA_TEXTRELS_x86="opt/VirtualBox/VBoxGuestPropSvc.so
	opt/VirtualBox/VBoxSDL.so
	opt/VirtualBox/VBoxDbg.so
	opt/VirtualBox/VBoxSharedFolders.so
	opt/VirtualBox/VBoxDD2.so
	opt/VirtualBox/VBoxOGLrenderspu.so
	opt/VirtualBox/VBoxPython.so
	opt/VirtualBox/VBoxPython2_3.so
	opt/VirtualBox/VBoxPython2_4.so
	opt/VirtualBox/VBoxPython2_5.so
	opt/VirtualBox/VBoxPython2_6.so
	opt/VirtualBox/VBoxPython2_7.so
	opt/VirtualBox/VBoxPython3_0.so
	opt/VirtualBox/VBoxPython3_1.so
	opt/VirtualBox/VBoxDD.so
	opt/VirtualBox/VBoxVRDP.so
	opt/VirtualBox/VBoxDDU.so
	opt/VirtualBox/VBoxREM64.so
	opt/VirtualBox/VBoxSharedClipboard.so
	opt/VirtualBox/VBoxHeadless.so
	opt/VirtualBox/VBoxRT.so
	opt/VirtualBox/VRDPAuth.so
	opt/VirtualBox/VBoxREM.so
	opt/VirtualBox/VBoxSettings.so
	opt/VirtualBox/VBoxKeyboard.so
	opt/VirtualBox/VBoxSharedCrOpenGL.so
	opt/VirtualBox/VBoxVMM.so
	opt/VirtualBox/VirtualBox.so
	opt/VirtualBox/VBoxOGLhosterrorspu.so
	opt/VirtualBox/components/VBoxC.so
	opt/VirtualBox/components/VBoxSVCM.so
	opt/VirtualBox/VBoxREM32.so
	opt/VirtualBox/VBoxPython2_5.so
	opt/VirtualBox/VBoxXPCOMC.so
	opt/VirtualBox/VBoxOGLhostcrutil.so
	opt/VirtualBox/VBoxNetDHCP.so
	opt/VirtualBox/VBoxGuestControlSvc.so"
QA_PRESTRIPPED="opt/VirtualBox/VBoxDD.so
	opt/VirtualBox/VBoxDD2.so
	opt/VirtualBox/VBoxDDU.so
	opt/VirtualBox/VBoxDbg.so
	opt/VirtualBox/VBoxGuestControlSvc.so
	opt/VirtualBox/VBoxGuestPropSvc.so
	opt/VirtualBox/VBoxHeadless
	opt/VirtualBox/VBoxHeadless.so
	opt/VirtualBox/VBoxKeyboard.so
	opt/VirtualBox/VBoxManage
	opt/VirtualBox/VBoxNetAdpCtl
	opt/VirtualBox/VBoxNetDHCP
	opt/VirtualBox/VBoxNetDHCP.so
	opt/VirtualBox/VBoxOGLhostcrutil.so
	opt/VirtualBox/VBoxOGLhosterrorspu.so
	opt/VirtualBox/VBoxOGLrenderspu.so
	opt/VirtualBox/VBoxPython.so
	opt/VirtualBox/VBoxPython2_3.so
	opt/VirtualBox/VBoxPython2_4.so
	opt/VirtualBox/VBoxPython2_5.so
	opt/VirtualBox/VBoxPython2_6.so
	opt/VirtualBox/VBoxPython2_7.so
	opt/VirtualBox/VBoxPython3_0.so
	opt/VirtualBox/VBoxPython3_1.so
	opt/VirtualBox/VBoxREM.so
	opt/VirtualBox/VBoxREM32.so
	opt/VirtualBox/VBoxREM64.so
	opt/VirtualBox/VBoxRT.so
	opt/VirtualBox/VBoxSDL
	opt/VirtualBox/VBoxSDL.so
	opt/VirtualBox/VBoxSVC
	opt/VirtualBox/VBoxSettings.so
	opt/VirtualBox/VBoxSharedClipboard.so
	opt/VirtualBox/VBoxSharedCrOpenGL.so
	opt/VirtualBox/VBoxSharedFolders.so
	opt/VirtualBox/VBoxTestOGL
	opt/VirtualBox/VBoxTunctl
	opt/VirtualBox/VBoxVMM.so
	opt/VirtualBox/VBoxVRDP.so
	opt/VirtualBox/VBoxXPCOM.so
	opt/VirtualBox/VBoxXPCOMC.so
	opt/VirtualBox/VBoxXPCOMIPCD
	opt/VirtualBox/VRDPAuth.so
	opt/VirtualBox/VirtualBox
	opt/VirtualBox/VirtualBox.so
	opt/VirtualBox/accessible/libqtaccessiblewidgets.so
	opt/VirtualBox/components/VBoxC.so
	opt/VirtualBox/components/VBoxSVCM.so
	opt/VirtualBox/components/VBoxXPCOMIPCC.so
	opt/VirtualBox/kchmviewer
	opt/VirtualBox/libQtCoreVBox.so.4
	opt/VirtualBox/libQtGuiVBox.so.4
	opt/VirtualBox/libQtNetworkVBox.so.4
	opt/VirtualBox/libQtOpenGLVBox.so.4
	opt/VirtualBox/vboxwebsrv"

src_unpack() {
	unpack_makeself ${MY_P}_${ARCH}.run
	unpack ./VirtualBox.tar.bz2

	mkdir "${S}"/${EXTP_PN} || die
	pushd "${S}"/${EXTP_PN} &>/dev/null || die
	unpack ${EXTP_PN}-${EXTP_PV}.tar.gz
	popd &>/dev/null || die

	if use sdk; then
		unpack VirtualBoxSDK-${SDK_PV}.zip
	fi
}

src_install() {
	# create virtualbox configurations files
	insinto /etc/vbox
	newins "${FILESDIR}/${PN}-config" vbox.cfg

	pushd "${S}"/${EXTP_PN} &>/dev/null || die
	insinto /opt/VirtualBox/ExtensionPacks/${EXTP_PN}
	doins -r linux.${ARCH}
	doins ExtPack* PXE-Intel.rom
	popd &>/dev/null || die
	rm -rf "${S}"/${EXTP_PN}

	insinto /opt/VirtualBox
	dodir /opt/bin

	doins UserManual.pdf

	if use sdk ; then
		doins -r sdk || die
	fi

	if use additions; then
		doins -r additions || die
	fi

	if use vboxwebsrv; then
		doins vboxwebsrv || die
		fowners root:vboxusers /opt/VirtualBox/vboxwebsrv
		fperms 0750 /opt/VirtualBox/vboxwebsrv
		dosym /opt/VirtualBox/VBox.sh /opt/bin/vboxwebsrv
		newinitd "${FILESDIR}"/vboxwebsrv-initd vboxwebsrv
		newconfd "${FILESDIR}"/vboxwebsrv-confd vboxwebsrv
	fi

	if use rdesktop-vrdp; then
		doins rdesktop-vrdp || die
		doins -r rdesktop-vrdp-keymaps || die
		fperms 0750 /opt/VirtualBox/rdesktop-vrdp
		dosym /opt/VirtualBox/rdesktop-vrdp /opt/bin/rdesktop-vrdp
	fi

	if use python; then
		local pyver
		for pyver in 2.4 2.5 2.6 2.7 3.0 3.1 ; do
			if has_version "=dev-lang/python-${pyver}*" && [ -f "${S}/VBoxPython${pyver/./_}.so" ] ; then
				doins VBoxPython${pyver/./_}.so || die
			fi
		done
	fi

	rm -rf src rdesktop* deffiles install* routines.sh runlevel.sh \
		vboxdrv.sh VBox.sh VBox.png vboxnet.sh additions VirtualBox.desktop \
		VirtualBox.tar.bz2 LICENSE VBoxSysInfo.sh rdesktop* vboxwebsrv \
		webtest kchmviewer VirtualBox.chm vbox-create-usb-node.sh \
		90-vbox-usb.fdi uninstall.sh vboxshell.py vboxdrv-pardus.py \
		VBoxPython?_*.so

	rm -rf VBoxSDL VirtualBox VBoxKeyboard.so

	doins -r * || die

	# create symlinks for working around unsupported $ORIGIN/.. in VBoxC.so (setuid)
	dosym /opt/VirtualBox/VBoxVMM.so /opt/VirtualBox/components/VBoxVMM.so
	dosym /opt/VirtualBox/VBoxREM.so /opt/VirtualBox/components/VBoxREM.so
	dosym /opt/VirtualBox/VBoxRT.so /opt/VirtualBox/components/VBoxRT.so
	dosym /opt/VirtualBox/VBoxDDU.so /opt/VirtualBox/components/VBoxDDU.so
	dosym /opt/VirtualBox/VBoxXPCOM.so /opt/VirtualBox/components/VBoxXPCOM.so

	local each
	for each in VBox{Manage,SVC,XPCOMIPCD,Tunctl,NetAdpCtl,NetDHCP,TestOGL,ExtPackHelperApp}; do
		fowners root:vboxusers /opt/VirtualBox/${each}
		fperms 0750 /opt/VirtualBox/${each}
		pax-mark -m "${D}"/opt/VirtualBox/${each}
	done
	# VBoxNetAdpCtl and VBoxNetDHCP binaries need to be suid root in any case..
	fperms 4750 /opt/VirtualBox/VBoxNetAdpCtl
	fperms 4750 /opt/VirtualBox/VBoxNetDHCP

	# Hardened build: Mark selected binaries set-user-ID-on-execution
	fowners root:vboxusers /opt/VirtualBox/VBoxHeadless
	fperms 4510 /opt/VirtualBox/VBoxHeadless
	pax-mark -m "${D}"/opt/VirtualBox/VBoxHeadless

	exeinto /opt/VirtualBox
	newexe "${FILESDIR}/${PN}-3-wrapper" "VBox.sh" || die
	fowners root:vboxusers /opt/VirtualBox/VBox.sh
	fperms 0750 /opt/VirtualBox/VBox.sh

	dosym /opt/VirtualBox/VBox.sh /opt/bin/VBoxManage
	dosym /opt/VirtualBox/VBox.sh /opt/bin/VBoxVRDP
	dosym /opt/VirtualBox/VBox.sh /opt/bin/VBoxHeadless
	dosym /opt/VirtualBox/VBoxTunctl /opt/bin/VBoxTunctl

	# set an env-variable for 3rd party tools
	echo -n "VBOX_APP_HOME=/opt/VirtualBox" > "${T}/90virtualbox"
	doenvd "${T}/90virtualbox"

	insinto /lib/udev/rules.d
	doins "${FILESDIR}"/10-virtualbox.rules
	# move udev scripts into /lib/udev (bug #372491)
	mv "${D}"/opt/VirtualBox/VBoxCreateUSBNode.sh "${D}"/lib/udev
	fperms 0750 /lib/udev/VBoxCreateUSBNode.sh
}

pkg_postinst() {
	fdo-mime_desktop_database_update

	udevadm control --reload-rules && udevadm trigger --subsystem-match=usb

	elog ""
	elog "You must be in the vboxusers group to use VirtualBox."
	elog ""
	elog "For advanced networking setups you should emerge:"
	elog "net-misc/bridge-utils and sys-apps/usermode-utilities"
	if [ -e "${ROOT}/etc/udev/rules.d/10-virtualbox.rules" ] ; then
		elog ""
		elog "Please remove \"${ROOT}/etc/udev/rules.d/10-virtualbox.rules\""
		elog "or else USB in ${PN} won't work."
	fi
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
