#!/bin/bash

PATH=/home/zbit/.local/bin:/home/zbit/toolchain/gcc-arm-none-eabi-5_4-2016q3/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
export PATH

####
# arm toolchain gcc5
# https://launchpad.net/gcc-arm-embedded/+download
#

CROSS_COMPILE=arm-none-eabi-
export CROSS_COMPILE
ARCH=arm
export ARCH

####
# git repository
# https://github.com/afaerber/linux/tree/stm32
#

# make stm32_defconfig
make
