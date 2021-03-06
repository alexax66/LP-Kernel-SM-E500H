#!/bin/bash

case "$1" in
         H)
            VARIANT="e53g"
            ;;

         F)
            VARIANT="e5"
            ;;

         *)
            VARIANT="e53g"
esac

rm -rf $(pwd)/output/arch/arm/boot/dts/*
rm -f $(pwd)/output/arch/arm/boot/dt.img

export ARCH=arm
export CROSS_COMPILE=/opt/toolchains/arm-cortex_a15-linux-gnueabihf-linaro_4.7.4-2014.06/bin/arm-eabi-
mkdir output

make -C $(pwd) O=output VARIANT_DEFCONFIG=msm8916_sec_$VARIANT"_eur_defconfig" msm8916_sec_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -j5 -C $(pwd) O=output

$(pwd)/dtbTool -2 -o $(pwd)/output/arch/arm/boot/dt.img -s 2048 -p $(pwd)/output/scripts/dtc/ $(pwd)/output/arch/arm/boot/dts/ -v
cp output/arch/arm/boot/zImage $(pwd)/arch/arm/boot/zImage