#!/usr/bin/env bash

export CC="armv7a-cros-linux-gnueabi-gcc"
export CFLAGS="--sysroot=$MARVELL_ROOTFS -marm -mfpu=neon -mfloat-abi=hard"
