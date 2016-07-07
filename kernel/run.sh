#!/bin/bash

ARCH=arm
CROSS_COMPILE=../fsl/bin/arm-fsl-linux-gnueabi-
JOBS=$1

if [ $1 == "distclean" ]; then
    make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE distclean
    exit;
fi

if [ $1 == "clean" ]; then
    make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE clean
    exit;
fi

if [ $1 == "menuconfig" ]; then
    make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $1
    exit;
fi

if [ $1 == "xconfig" ]; then
    make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $1
    exit;
fi

make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE imx_v7_defconfig
make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $1

if [ ! -d ../out ]; then
    mkdir ../out
fi

install arch/arm/boot/zImage                                ../out/zImage
install arch/arm/boot/dts/imx6q-rev-sa01-pfuze100.dtb       ../out/imx6q-rev-sa01-pfuze100.dtb
install arch/arm/boot/dts/imx6solo-rev-sa01-pfuze100.dtb    ../out/imx6solo-rev-sa01-pfuze100.dtb
install arch/arm/boot/dts/imx6q-rev-sa01-wm8326.dtb         ../out/imx6q-rev-sa01-wm8326.dtb
install arch/arm/boot/dts/imx6solo-rev-sa01-wm8326.dtb      ../out/imx6solo-rev-sa01-wm8326.dtb

