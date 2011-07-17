#!/bin/bash

STAGE4_DATE="20110522"
PORTAGE_DATE="20110523"

# die on failure
set -e

eexec() {
	# TODO: this does not work for the chroot scripts somehow ...
	exec 3<&1 4<&2
	exec 2>&1 1>>/tmp/bootstrap.log

	echo -n " > "
	echo "$@"
	"$@"

	exec 1<&3 2<&4
	exec 3<&- 4<&-
}

einfo() {
	echo -ne " \033[32m*\033[0m "
	echo "$@"
}

eask() {
	_ANSWER=
	while [[ -z ${_ANSWER} ]]; do
		echo -ne " \033[32m*\033[0m "
		read -p "$@" _ANSWER
	done
}

eask "Please enter the hostname for this system: "
hostname=${_ANSWER}
eexec hostname ${hostname}

eask "Please enter the domain name for this system: "
domainname=${_ANSWER}

einfo
einfo "disable swap & raid, so we can use all block devices ..."
eexec swapoff -a
for i in /dev/md?*; do
	eexec mdadm -q -S $i
done

einfo "synchronize time with ntp ..."
eexec /etc/init.d/ntp stop
eexec ntpdate time.fu-berlin.de
eexec hwclock --systohc

einfo
einfo "This script will open a shell now. You need to do the following:"
einfo
einfo " - Partition your hard drives:"
einfo
einfo "   cfdisk /dev/sda"
einfo "   sfdisk -q -d /dev/sda | sfdisk -q /dev/sdb"
einfo "   sfdisk -q -d /dev/sda | sfdisk -q /dev/sdc"
einfo "   ..."
einfo
einfo " - Create Software RAID if applicable:"
einfo
einfo "   mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sda1 /dev/sdb1"
einfo "   mdadm --create /dev/md2 --level=1 --raid-devices=2 /dev/sda2 /dev/sdb2"
einfo
einfo "   or"
einfo
einfo "   mdadm --create /dev/md1 --level=1 --raid-devices=3 /dev/sda1 /dev/sdb1 /dev/sdc1"
einfo "   mdadm --create /dev/md2 --level=5 --raid-devices=3 /dev/sda2 /dev/sdb2 /dev/sdc2"
einfo
einfo " - Create a LVM volume group named vg:"
einfo
einfo "   pvcreate /dev/md2"
einfo "   vgcreate vg /dev/md2"
einfo
einfo "When finished, type: exit"
einfo
/bin/bash

eask "Please enter the rootfs device (/dev/sda1, /dev/md1, ...): "
rootfs=${_ANSWER}

einfo "create volumes & file systems ..."
eexec mkfs.ext3 -q -F ${rootfs}

eexec lvcreate -L10G -nusr vg
eexec mkfs.xfs -q -f /dev/vg/usr

eexec lvcreate -L10G -nvar vg
eexec mkfs.xfs -q -f /dev/vg/var

einfo "mount filesystems ..."
eexec mkdir -p /mnt/gentoo
eexec mount -o noatime -t ext3 ${rootfs} /mnt/gentoo
eexec mkdir -p /mnt/gentoo/{usr,var}
eexec mount -o noatime -t xfs /dev/vg/usr /mnt/gentoo/usr
eexec mount -o noatime -t xfs /dev/vg/var /mnt/gentoo/var

einfo "download gentoo-lts stage4 ${STAGE4_DATE} ..."
pushd /mnt/gentoo > /dev/null
eexec wget -q http://bb.xnull.de/projects/gentoo/stage4-x86-64-gentoo-lts-${STAGE4_DATE}.tar.bz2
eexec tar xpf stage4-x86-64-gentoo-lts-${STAGE4_DATE}.tar.bz2
eexec rm stage4-x86-64-gentoo-lts-${STAGE4_DATE}.tar.bz2
popd > /dev/null

einfo "download gentoo-lts portage snapshot ${PORTAGE_DATE} ..."
pushd /mnt/gentoo/usr/ > /dev/null
eexec wget -q http://bb.xnull.de/projects/gentoo/portage-${PORTAGE_DATE}.tar.bz2
eexec tar xf portage-${PORTAGE_DATE}.tar.bz2
eexec rm portage-${PORTAGE_DATE}.tar.bz2
popd > /dev/null

einfo "prepare chroot env ..."
eexec mount -t proc none /mnt/gentoo/proc
eexec mount --bind /dev /mnt/gentoo/dev
eexec cp -L /etc/resolv.conf /mnt/gentoo/etc/resolv.conf

# prepare chroot bootstrap script
cat <<EOF > /mnt/gentoo/tmp/bootstrap1.sh
set -e

# fix env & set timezone
env-update && source /etc/profile
cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# set hostname
echo "127.0.0.1 ${hostname}.${domainname} ${hostname} localhost" > /etc/hosts
sed -i -e "s/^hostname.*/hostname=\"${hostname}\"/" /etc/conf.d/hostname

# sync portage
emerge --sync --quiet

# create default kernel config
emerge vserver-sources

pushd /usr/src/linux > /dev/null
wget -q -O .config http://gist.github.com/raw/510152/config-2.6.35-vs2.3.0.36.32-gentoo-x86_64
make oldconfig &> /dev/null
popd > /dev/null
EOF

einfo "run chroot step 1 ..."
eexec chroot /mnt/gentoo /bin/bash /tmp/bootstrap1.sh
rm -f /tmp/bootstrap1.sh

# start nconfig for local changes
einfo
einfo "This script will open the kernel config screen now"
einfo
einfo "Please make sure the following device drivers are selected correctly:"
einfo
einfo "  - SATA/RAID controller"
einfo "  - Network interfaces"
einfo "  - USB HCD"
einfo
echo

read -p "Press ENTER to continue ..."
chroot /mnt/gentoo /bin/bash -c 'cd /usr/src/linux && make nconfig'

cat <<EOF > /mnt/gentoo/tmp/bootstrap2.sh
set -e

export LANG=C

# compile and install kernel
pushd /usr/src/linux > /dev/null
make -j4
make install
make modules_install
popd > /dev/null

# create symlinks in /boot
pushd /boot > /dev/null
ln -s System.map-* System.map
ln -s config-* config
ln -s vmlinuz-* vmlinuz
popd

# install boot loader and system packages
emerge -nu mdadm lvm2 xfsprogs syslinux

# configure boot loader
mkdir /boot/syslinux

cat <<EOB > /boot/syslinux/syslinux.cfg
DEFAULT linux
LABEL linux
  KERNEL /boot/vmlinuz
  APPEND root=${rootfs}
EOB

extlinux -i /boot/syslinux

# enable required services
rc-update add lvm boot
rc-update del net.lo boot
rc-update add network boot
rc-update add sshd default
EOF

einfo "run chroot step 2"
eexec chroot /mnt/gentoo /bin/bash /tmp/bootstrap2.sh
rm -f /tmp/bootstrap2.sh

einfo "Please set the initial root password"
chroot /mnt/gentoo /bin/bash -c 'passwd root'

einfo "create initial fstab"
cat <<EOF > /mnt/gentoo/etc/fstab
# /etc/fstab: static file system information.
#
# noatime turns off atimes for increased performance (atimes normally aren't 
# needed); notail increases performance of ReiserFS (at the expense of storage 
# efficiency).  It's safe to drop the noatime options if you want and to 
# switch between notail / tail freely.
#
# The root filesystem should have a pass number of either 0 or 1.
# All other filesystems should have a pass number of 0 or greater than 1.
#
# See the manpage fstab(5) for more information.
#

# <fs>                  <mountpoint>    <type>          <opts>          <dump/pass>
${rootfs}               /               ext3            noatime         0 0
/dev/vg/usr             /usr            xfs             noatime         0 0
/dev/vg/var             /var            xfs             noatime         0 0
EOF

einfo
einfo "This script will open an editor for /etc/ifup.eth0 now"
einfo "Please add the commands necessary to configure your network:"
einfo
einfo "  ip link set eth0 up"
einfo "  ip addr add 1.2.3.4 peer 1.2.3.1 dev eth0"
einfo "  ip route add default via 1.2.3.1"
einfo
read -p "Press ENTER to continue ... "

(
echo "ip link set eth0 up"
ip addr show dev eth0|grep 'inet .*global'|awk '{print "ip addr add " $2 " dev eth0" }'
ip route list | grep default.*eth0 | awk '{print "ip route add default via " $3 }'
) > /mnt/gentoo/etc/ifup.eth0

vim /mnt/gentoo/etc/ifup.eth0

einfo "install MBR"

DISKS=$(fdisk -l 2>&1 | grep "^Disk /" | grep -v "dev/md" | grep -v "dev/dm" | sed 's/^Disk \([^ ]\+\):.*/\1/')

for disk in ${DISKS}; do
	eexec dd if=/mnt/gentoo/usr/share/syslinux/mbr.bin of=${disk}
done

einfo "unmount chroot"
eexec umount /mnt/gentoo/{usr,var,proc,dev}
eexec umount /mnt/gentoo
