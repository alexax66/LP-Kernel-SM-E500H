################################################################################
HOW TO BUILD KERNEL FOR SM-E500H_CIS_LL_SER

1. How to Build
	- get Toolchain
	download and install arm-eabi-4.7 toolchain for ARM EABI.
	Extract kernel source and move into the top directory.

	$ ./build_kernel.sh


2. Output files
	- Kernel : Kernel/arch/arm/boot/zImage
	- module : Kernel/drivers/*/*.ko

3. How to Clean	
    $ make clean

4. How to make .tar binary for downloading into target.
	- change current directory to Kernel/arch/arm/boot
	- type following command
	$ tar cvf SM-E500H_CIS_LL_SER.tar zImage
#################################################################################