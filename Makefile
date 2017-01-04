ARCH := arm
CROSS_COMPILE := $(shell pwd)/fsl/bin/arm-fsl-linux-gnueabi-

all: u-boot kernel
u-boot: U-BOOT
kernel: KERNEL
clean: CLEAN
distclean: CLEAN

U-BOOT:
	mkdir -p out

	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ distclean
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ mx6qsmarc_pfuze100_defconfig
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/
	install u-boot/u-boot.imx out/u-boot-6q-pfuze100.imx

	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ distclean
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ mx6solosmarc_pfuze100_defconfig
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/
	install u-boot/u-boot.imx out/u-boot-6solo-pfuze100.imx

	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ distclean
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ mx6dlsmarc_pfuze100_defconfig
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/
	install u-boot/u-boot.imx out/u-boot-6dl-pfuze100.imx

	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ distclean
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ mx6qsmarc_wm8326_defconfig
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/
	install u-boot/u-boot.imx out/u-boot-6q-wm8326.imx

	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ distclean
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ mx6solosmarc_wm8326_defconfig
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/
	install u-boot/u-boot.imx out/u-boot-6solo-wm8326.imx

	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ distclean
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ mx6dlsmarc_wm8326_defconfig
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/
	install u-boot/u-boot.imx out/u-boot-6dl-wm8326.imx

	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ distclean
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ mx6qsmarc_pfuze100_2g_e14s6104g52h_defconfig
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/
	install u-boot/u-boot.imx out/u-boot-6q-pfuze100-2g-e14s6104g52h.imx

	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ distclean
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ mx6qsmarc_pfuze100_2g_e14s6104g58h_defconfig
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/
	install u-boot/u-boot.imx out/u-boot-6q-pfuze100-2g-e14s6104g58h.imx

	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ distclean
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ mx6qsmarc_wm8326_2g_e14s6104g52h_defconfig
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/
	install u-boot/u-boot.imx out/u-boot-6q-wm8326-2g-e14s6104g52h.imx

	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ distclean
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ mx6qsmarc_wm8326_2g_e14s6104g58h_defconfig
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/
	install u-boot/u-boot.imx out/u-boot-6q-wm8326-2g-e14s6104g58h.imx

KERNEL:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C kernel/ imx_v7_defconfig
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C kernel/

	mkdir -p out

	install kernel/arch/arm/boot/zImage                             out/zImage
	install kernel/arch/arm/boot/dts/imx6q-rev-sa01-pfuze100.dtb    out/imx6q-rev-sa01-pfuze100.dtb
	install kernel/arch/arm/boot/dts/imx6q-rev-sa01-wm8326.dtb      out/imx6q-rev-sa01-wm8326.dtb
	install kernel/arch/arm/boot/dts/imx6solo-rev-sa01-pfuze100.dtb out/imx6solo-rev-sa01-pfuze100.dtb
	install kernel/arch/arm/boot/dts/imx6solo-rev-sa01-wm8326.dtb   out/imx6solo-rev-sa01-wm8326.dtb

CLEAN:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C u-boot/ distclean
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C kernel/ distclean

	rm -rf \
		out \
		u-boot/imxcfg.imx \
		kernel/arch/arm/boot/compressed/lib1funcs.S \
		kernel/arch/arm/boot/compressed/piggy.gzip \
		kernel/arch/arm/boot/compressed/vmlinux \
		kernel/arch/arm/boot/compressed/vmlinux.lds \
		kernel/arch/arm/boot/dts/*.dtb \
		kernel/arch/arm/kernel/vmlinux.lds

