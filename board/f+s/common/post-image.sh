#!/usr/bin/env bash

#
# dtb_list extracts the list of DTB files from BR2_LINUX_KERNEL_INTREE_DTS_NAME
# in ${BR_CONFIG}, then prints the corresponding list of file names for the
# genimage configuration file
#
dtb_list()
{
	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([A-Z \+ | \/a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"

	for dt in $DTB_LIST; do
		echo -n "\"`basename $dt`.dtb\", "
	done
}

#
# linux_image extracts the Linux image format from BR2_LINUX_KERNEL_UIMAGE in
# ${BR_CONFIG}, then prints the corresponding file name for the genimage
# configuration file
#
linux_image()
{
	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
		echo "\"uImage\""
	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
		echo "\"Image\""
	else
		echo "\"zImage\""
	fi
}

genimage_type()
{
	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
		echo "genimage.cfg.template_imx8"
	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
		if grep -Eq "^BR2_PACKAGE_FS_UPDATE_CLI=y$" ${BR2_CONFIG}; then
			echo "genimage.cfg.template.imx8mm.update"
		else
			echo "genimage.cfg.template.imx8mm.std"
		fi
	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" ${BR2_CONFIG}; then
		echo "genimage.cfg.template_imx8"
	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" ${BR2_CONFIG}; then
		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
		    echo "genimage.cfg.template_no_boot_part_spl"
		fi
	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
		echo "genimage.cfg.template_spl"
	else
		echo "genimage.cfg.template"
	fi
}

gen_data_ext4()
{
	local root_dir=$(du -sb ${BINARIES_DIR}/app_dir | cut -f1)
	rm "${BINARIES_DIR}/data.ext4"
	${HOST_DIR}/sbin/mke2fs \
	  -L '' \
	  -N 0 \
	  -O ^64bit \
	  -d "${BINARIES_DIR}/app_dir" \
	  -m 5 \
	  -j \
	  -r 1 \
	  -t ext2 \
	  "${BINARIES_DIR}/data.ext4" \
	  ${root_dir} \
	;
}


gen_data_ubifs()
{
	local root_dir=$(du -sb ${BINARIES_DIR}/app_dir | cut -f1)
	rm "${BINARIES_DIR}/data.ubifs"
	
	${HOST_DIR}/sbin/mkfs.ubifs \
	  -r "${BINARIES_DIR}/app_dir" \
	  -m "0x800" \
	  -e "0x1f000" \
	  -c "2048" \
	  -o "${BINARIES_DIR}/data.ubifs" \
	;
}

main()
{
	local FILES="$(dtb_list) $(linux_image)"
	local UBOOTBIN="u-boot-dtb.img"
	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

	if grep -Eq "^BR2_PACKAGE_FS_UPDATE_LIB=y$" ${BR2_CONFIG}; then
		gen_data_ext4
		gen_data_ubifs
	fi;

	sed -e "s/%FILES%/${FILES}/" \
		-e "s/%UBOOTBIN%/${UBOOTBIN}/" \
		board/f+s/$5/$(genimage_type) > ${GENIMAGE_CFG}

	rm -rf "${GENIMAGE_TMP}"

	genimage \
		--rootpath "${TARGET_DIR}" \
		--tmppath "${GENIMAGE_TMP}" \
		--inputpath "${BINARIES_DIR}" \
		--outputpath "${BINARIES_DIR}" \
		--config "${GENIMAGE_CFG}"

	if grep -Eq "^BR2_PACKAGE_FS_UPDATE_LIB=y$" ${BR2_CONFIG}; then

		# Generate RAUC Update
		export RAUC_TEMPLATE_MMC=${PWD}"/board/f+s/common/rauc/rauc_mmc_template"
		export RAUC_TEMPLATE_NAND=${PWD}"/board/f+s/common/rauc/rauc_nand_template"

		export RAUC_BINARY=${HOST_DIR}/usr/bin/rauc
		export RAUC_PATH_TO_OUTPUT=${BINARIES_DIR}

		export RAUC_CERT=${PWD}"/board/f+s/common/rauc/rauc.cert.pem"
		export RAUC_KEY=${PWD}"/board/f+s/common/rauc/rauc.key.pem"

		export DEPLOY_DIR_IMAGE=${BINARIES_DIR}
        export PYTHONPATH=${HOST_DIR}/

		/usr/bin/python3 ${PWD}/board/f+s/common/rauc_create_update.py
	fi;

	exit $?
}
main $@
