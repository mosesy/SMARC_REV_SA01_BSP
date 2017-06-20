#!/bin/bash

ARCH=arm
CROSS_COMPILE=../fsl/bin/arm-fsl-linux-gnueabi-

case "$1" in

    "clean")
        make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE clean
        rm -f u-boot.bin
        rm -f u-boot.imx
        exit 0
        ;;

    "distclean")
        make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE distclean
        exit 0
        ;;

    "q-p-1g")
        CONFIG_FILE=mx6qsmarc_pfuze100_defconfig
        INSTALL_NAME=u-boot-6q-pfuze100.imx
        ;;

    "s-p-1g")
        CONFIG_FILE=mx6solosmarc_pfuze100_defconfig
        INSTALL_NAME=u-boot-6solo-pfuze100.imx
        ;;

    "dl-p-1g")
        CONFIG_FILE=mx6dlsmarc_pfuze100_defconfig
        INSTALL_NAME=u-boot-6dl-pfuze100.imx
        ;;

    "q-w-1g")
        CONFIG_FILE=mx6qsmarc_wm8326_defconfig
        INSTALL_NAME=u-boot-6q-wm8326.imx
        ;;

    "s-w-1g")
        CONFIG_FILE=mx6solosmarc_wm8326_defconfig
        INSTALL_NAME=u-boot-6solo-wm8326.imx
        ;;

    "dl-w-1g")
        CONFIG_FILE=mx6dlsmarc_wm8326_defconfig
        INSTALL_NAME=u-boot-6dl-wm8326.imx
        ;;

    "q-p-2g-52")
        CONFIG_FILE=mx6qsmarc_pfuze100_2g_e14s6104g52h_defconfig
        INSTALL_NAME=u-boot-6q-pfuze100-2g-e14s6104g52h.imx
        ;;

    "q-p-2g-58")
        CONFIG_FILE=mx6qsmarc_pfuze100_2g_e14s6104g58h_defconfig
        INSTALL_NAME=u-boot-6q-pfuze100-2g-e14s6104g58h.imx
        ;;

    "q-w-2g-52")
        CONFIG_FILE=mx6qsmarc_wm8326_2g_e14s6104g52h_defconfig
        INSTALL_NAME=u-boot-6q-wm8326-2g-e14s6104g52h.imx
        ;;

    "q-w-2g-58")
        CONFIG_FILE=mx6qsmarc_wm8326_2g_e14s6104g58h_defconfig
        INSTALL_NAME=u-boot-6q-wm8326-2g-e14s6104g58h.imx
        ;;

	"d-p-1g-e14s6102g51h")
		CONFIG_FILE=mx6dsmarc_pfuze100_1g_e14s6102g51h_defconfig
		INSTALL_NAME=u-boot-6d-pfuze100-1g-e14s6102g51h.imx
		;;

	*)
        echo 'Input argument error!'
        exit 255
        ;;

esac

make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $CONFIG_FILE
make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $2

if [ $? -eq 0 ]; then
    if [ ! -d ../out ]; then
        mkdir ../out
    fi

    cp ./u-boot.imx ../out/$INSTALL_NAME
fi
