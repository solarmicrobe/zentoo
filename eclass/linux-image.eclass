# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: linux-image.eclass
# @MAINTAINER: hollow@gentoo.org
# @BLURB: eclass used for installing prebuilt linux kernel images

IUSE=""
SLOT="${PV}"

DEPEND=""
RDEPEND="sys-apps/util-linux"

RESTRICT="binchecks strip"

S=${WORKDIR}

linux-image_src_install() {
	mv "${S}"/* "${D}"/ || die
}

linux-image_pkg_config() {
	# use UUID for rootfs in fstab
	root_device=$(grep ' / ' /proc/mounts | grep -v ^rootfs | awk '{ print $1 }')
	root_uuid=$(blkid -s UUID -o value ${root_device})

	if [[ -z ${root_uuid} ]]; then
		die "could not lookup rootfs UUID"
	fi

	einfo "Installing grub using rootfs ${root_uuid}"

	# convert fstab entries to UUID
	ebegin "Converting fstab entries to UUID"
	grep -v ^# /etc/fstab | grep -v '^$' | {
		while read fs mp type opts dump pass; do
			if [[ $fs == UUID* ]]; then
				echo $fs $mp $type $opts $dump $pass
			else
				echo UUID=$(blkid -s UUID -o value $fs) $mp $type $opts $dump $pass
			fi
		done
	} > /etc/fstab.uuid
	mv /etc/fstab.uuid /etc/fstab
	eend $?

	# kernel command line
	cmdline="rd.md=1 rd.lvm=1 rd.lvm.vg=vg"

	# systemd support
	# TODO: eventually systemd should be /sbin/init
	if [[ $(</proc/1/cmdline) == /usr/bin/systemd ]]; then
		cmdline+=" init=/usr/bin/systemd"
	fi

	# on MBR systems use grub-1, on GPT/EFI use grub-2
	# the heuristic may not be the best but works in the general case
	if partx -s -o SCHEME /dev/sda | grep -q gpt; then
		einfo "Using grub-2 with GPT partition map"

		emerge --nospinner -q -n sys-boot/grub:2

		sed -i -e "/^GRUB_CMDLINE_LINUX=/s:=.*:=\"${cmdline}\":" /etc/default/grub
		mkdir -p /boot/grub2
		grub2-mkconfig -o /boot/grub2/grub.cfg

		for device in /dev/sd?; do
			grub2-install ${device}
		done
	else
		einfo "Using legacy grub-1 with MBR partition map"

		# use latest kernel according to mtime
		local KV=$(ls --sort=time /boot/kernel-* | head -n1 | sed 's:/boot/kernel-::')

		emerge --nospinner -q -n sys-boot/grub:0

		echo "default 0" > /boot/grub/grub.conf
		echo "timeout 10" >> /boot/grub/grub.conf

		echo quit | /sbin/grub --batch --no-floppy --device-map=/boot/grub/device.map >/dev/null 2>&1

		for device in /dev/sd?; do
			grub_device=$(grep "${device}\$" /boot/grub/device.map | awk '{ print $1; }' | sed -e 's:[()]::g')

			if [ -z "${grub_device}" ]; then
				die "could not map boot device ${device} to grub device"
			fi

			echo -e "\ntitle Gentoo Linux on ${device}" >> /boot/grub/grub.conf
			echo "root (${grub_device},0)" >> /boot/grub/grub.conf
			echo "kernel /boot/kernel-${KV} root=UUID=${root_uuid} ro ${cmdline}" >> /boot/grub/grub.conf
			echo "initrd /boot/initramfs-${KV}.img" >> /boot/grub/grub.conf

			echo -e "root (${grub_device},0)\nsetup (${grub_device})\nquit" | /sbin/grub --batch --no-floppy
		done
	fi
}

EXPORT_FUNCTIONS src_install pkg_config
