#!/bin/sh

mv ${1}/sbin/* ${1}/usr/bin/* ${1}/usr/sbin/* ${1}/bin/
rm -rf ${1}/{etc,sbin,usr,var,lib,linuxrc}

cat << EOF > ${1}/init
#!/bin/sh
echo "Booted"

mount -t sysfs none /sys
ubiattach -m 1
mount -t ubifs ubi0:rootfs /newroot
umount /sys
exec switch_root /newroot/ /init
EOF

