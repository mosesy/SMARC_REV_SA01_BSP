#!/bin/bash

LOCAL_PATH=`pwd`
ARCH=arm
CROSS_COMPILE=$LOCAL_PATH/../fsl/bin/arm-fsl-linux-gnueabi-

if [ $1 == "distclean" ]; then
	make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE distclean
	#rm -f imxcfg.imx
	#rm -f u-boot-6*
	exit;
fi

if [ $1 == "sabresd" ]; then
	PLATFORM=mx6qsabresd_defconfig
fi

if [ $1 == "quad-p" ]; then
	PLATFORM=mx6qsmarc_defconfig
fi

if [ $1 == "quad" ]; then
    PLATFORM=mx6qsmarc_defconfig
fi

if [ $1 == "solo-p" ]; then
	PLATFORM=mx6solosmarc_defconfig
fi

if [ $1 == "solo" ]; then
    PLATFORM=mx6solosmarc_defconfig
fi

if [ $1 == "dl-p" ]; then
    PLATFORM=mx6dlsmarc_defconfig
fi

if [ $1 == "dl" ]; then
    PLATFORM=mx6dlsmarc_defconfig
fi

JOBS=$2

make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $PLATFORM
make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $JOBS

