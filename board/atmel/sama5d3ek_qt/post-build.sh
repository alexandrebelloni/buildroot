#!/bin/bash

echo "/root/homeauto.sh &" > ${1}/etc/init.d/S01demo
chmod +x ${1}/etc/init.d/S01demo

cat << EOF > ${1}/root/homeauto.sh
export TSLIB_TSDEVICE=/dev/input/event0
#ts_calibrate
export QWS_MOUSE_PROTO=Tslib:/dev/input/event0
cd /opt/HomeAutomation/
./HomeAutomation -qws
EOF

chmod +x ${1}/root/homeauto.sh

echo "212 55979 -2326156 -37614 0 33971676 65536 800 480" > ${1}/etc/pointercal

cat << EOF > ${1}/init
#!/bin/sh

mount -t devtmpfs none /dev
exec /linuxrc
EOF
chmod +x ${1}/init

