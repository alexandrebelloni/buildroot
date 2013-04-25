#!/bin/sh

mv ${1}/sbin/* ${1}/usr/bin/* ${1}/usr/sbin/* ${1}/bin/
rm -rf ${1}/{etc,sbin,usr,var,lib,linuxrc}

cp board/atmel/sama5d3ek_initramfs/fb0.fb ${1}

cat << EOF > ${1}/init
#!/bin/sh
dd if=/fb0.fb of=/dev/fb0

mount -t sysfs none /sys
ubiattach -m 6
mount -t ubifs ubi0:rootfs /newroot
umount /sys
exec switch_root /newroot/ /init
EOF

