#!/bin/bash

ARCH=arm
CROSS_COMPILE=../fsl/bin/arm-fsl-linux-gnueabi-

if [ $1 == "distclean" ]; then
    make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE distclean
    exit;
fi

if [ $1 == "clean" ]; then
    make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE clean
    exit;
fi

if [ $1 == "quad-p" ]; then
    PLATFORM=mx6qsmarc_pfuze100_defconfig
    INSTALL_NAME=u-boot-6q-pfuze100.imx
fi

if [ $1 == "solo-p" ]; then
    PLATFORM=mx6solosmarc_pfuze100_defconfig
    INSTALL_NAME=u-boot-6solo-pfuze100.imx
fi

if [ $1 == "dl-p" ]; then
    PLATFORM=mx6dlsmarc_pfuze100_defconfig
    INSTALL_NAME=u-boot-6dl-pfuze100.imx
fi

if [ $1 == "quad-w" ]; then
    PLATFORM=mx6qsmarc_wm8326_defconfig
    INSTALL_NAME=u-boot-6q-wm8326.imx
fi

if [ $1 == "solo-w" ]; then
    PLATFORM=mx6solosmarc_wm8326_defconfig
    INSTALL_NAME=u-boot-6solo-wm8326.imx
fi

if [ $1 == "dl-w" ]; then
    PLATFORM=mx6dlsmarc_wm8326_defconfig
    INSTALL_NAME=u-boot-6dl-wm8326.imx
fi

if [ $1 == "quad-p-2g" ]; then
    PLATFORM=mx6qsmarc_pfuze100_2g_defconfig
    INSTALL_NAME=u-boot-6q-pfuze100-2g.imx
fi

if [ $1 == "quad-w-2g" ]; then
    PLATFORM=mx6qsmarc_wm8326_2g_defconfig
    INSTALL_NAME=u-boot-6q-wm8326-2g.imx
fi

JOBS=$2

make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $PLATFORM
make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $JOBS

if [ ! -d ../out ]; then
    mkdir ../out
fi

cp ./u-boot.imx ../out/$INSTALL_NAME

