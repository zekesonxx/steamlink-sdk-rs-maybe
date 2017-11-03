#!/usr/bin/env bash

if [ ! -f "armv7a-cros-linux-gnueabi.json.in" ]; then
    echo "Make sure 'armv7a-cros-linux-gnueabi.json.in' exists." >&2
    exit 2
fi

sed "s#\$MARVELL_ROOTFS#$MARVELL_ROOTFS#" armv7a-cros-linux-gnueabi.json.in > armv7a-cros-linux-gnueabi.json
