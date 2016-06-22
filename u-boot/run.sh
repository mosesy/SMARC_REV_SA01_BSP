#!/bin/bash

LOCAL_PATH=`pwd`
ARCH=arm
CROSS_COMPILE=$LOCAL_PATH/../fsl/bin/arm-fsl-linux-gnueabi-

if [ $1 == "distclean" ]; then
	make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE distclean
	exit;
fi

if [ $1 == "sabresd" ]; then
	PLATFORM=mx6qsabresd_defconfig
fi

if [ $1 == "quad-p" ]; then
	PLATFORM=mx6qsmarc_pfuze100_defconfig
fi

if [ $1 == "solo-p" ]; then
	PLATFORM=mx6solosmarc_pfuze100_defconfig
fi

if [ $1 == "dl-p" ]; then
	PLATFORM=mx6dlsmarc_pfuze100_defconfig
fi

if [ $1 == "quad-w" ]; then
	PLATFORM=mx6qsmarc_wm8326_defconfig
fi

if [ $1 == "solo-w" ]; then
	PLATFORM=mx6solosmarc_wm8326_defconfig
fi

if [ $1 == "dl-w" ]; then
	PLATFORM=mx6dlsmarc_wm8326_defconfig
fi

JOBS=$2

make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $PLATFORM
make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $JOBS
