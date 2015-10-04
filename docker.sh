echo "downloading zentoo base image"
wget -q -c http://mirror.zenops.net/zentoo/amd64/zentoo-amd64-base.tar.bz2

mkdir newroot
cd newroot
tar -xpf /zentoo-amd64-base.tar.bz2

wget -q -O /busybox "http://www.busybox.net/downloads/binaries/latest/busybox-x86_64"
chmod +x /busybox

/busybox rm -rf /lib* /usr /var /bin /sbin /opt /mnt /media /root /home /run /tmp
/busybox cp -fRap lib* /
/busybox cp -fRap bin boot home media mnt opt root run sbin tmp usr var /
/busybox cp -fRap etc/* /etc/
cd /

/busybox rm -rf newroot /busybox /build.sh /linuxrc
rm -f /Dockerfile /build.sh /zentoo-amd64-base.tar.bz2

ls --color -lah
