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

linux-image_pkg_postinst() {
	ebegin "Updating module dependencies for ${KV_FULL}"
	depmod -a -b "${ROOT}" ${KV_FULL}
	eend $?
}

linux-image_pkg_config() {
	# use UUID for rootfs in fstab
	root_device=$(grep ' / ' /proc/mounts | grep -v ^rootfs | grep -v ^aufs | grep -v ^/dev/root | grep -v tmpfs | awk '{ print $1 }')
	root_uuid=$(blkid -s UUID -o value ${root_device})

	# sometimes blkid does not work :-(
	if [[ -z ${root_uuid} ]]; then
		root_uuid=$(blkid -s UUID -o value ${root_device})
	fi

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
	if mdadm --detail $root_device &>/dev/null; then
		cmdline="${cmdline} rd.md=1"
	fi

	if [[ "$(lvs)" != "" ]]; then
		cmdline="${cmdline} rd.lvm=1 rd.lvm.vg=vg"
	fi

	cmdline="${cmdline} rd.auto=1 net.ifnames=0 init=/usr/lib/systemd/systemd"

	# figure out the physical boot device
	if mdadm --detail $root_device &>/dev/null; then
		boot_devices=$(mdadm --detail $root_device | grep 'active sync' | awk '{ print $7 }' | grep -o '/dev/sd.')
	else
		boot_devices=$(echo $root_device | grep -o '/dev/sd.')
	fi

	# support old MBR systems too :-(
	#if partx -s -o SCHEME $(echo ${boot_devices} | awk '{print $1}') | grep -q gpt; then
	einfo "`echo ${boot_devices}`"
	if fdisk -l `echo ${boot_devices} | awk '{print $1}'` 2>&1 | tail -1 | grep -iq gpt; then
		einfo "Using grub-2 with GPT partition map"

		emerge --nospinner -q -n sys-boot/grub:2

		sed -i -e "/GRUB_CMDLINE_LINUX=/s:.*:GRUB_CMDLINE_LINUX=\"${cmdline}\":" /etc/default/grub
		mkdir -p /boot/grub
		grub-mkconfig -o /boot/grub/grub.cfg

		for device in ${boot_devices}; do
			einfo "Installing boot loader to ${device}"
			grub-install ${device}
		done
	else
		einfo "Using legacy grub-1 with MBR partition map"

		# use latest kernel according to mtime
		emerge --nospinner -q -n sys-boot/grub:0

		echo "default 0" > /boot/grub/grub.conf
		echo "timeout 10" >> /boot/grub/grub.conf

		echo quit | /sbin/grub --batch --no-floppy --device-map=/boot/grub/device.map >/dev/null 2>&1

		for device in ${boot_devices}; do
			einfo "Installing boot loader to ${device}"

			grub_device=$(grep "${device}\$" /boot/grub/device.map | awk '{ print $1; }' | sed -e 's:[()]::g')

			if [ -z "${grub_device}" ]; then
				die "could not map boot device ${device} to grub device"
			fi

			echo -e "\ntitle Gentoo Linux on ${device}" >> /boot/grub/grub.conf
			echo "root (${grub_device},0)" >> /boot/grub/grub.conf
			echo "kernel /boot/kernel-${KV_FULL} root=UUID=${root_uuid} ro ${cmdline}" >> /boot/grub/grub.conf
			echo "initrd /boot/initramfs-${KV_FULL}.img" >> /boot/grub/grub.conf

			echo -e "root (${grub_device},0)\nsetup (${grub_device})\nquit" | /sbin/grub --batch --no-floppy
		done
	fi
}

EXPORT_FUNCTIONS src_install pkg_config
