################################################################################
#
# imx-vpuwrap
#
################################################################################

IMX_VPUWRAP_VERSION = lf-6.6.52-2.2.2
IMX_VPUWRAP_SITE = $(call github,nxp-imx,imx-vpuwrap,$(IMX_VPUWRAP_VERSION))
IMX_VPUWRAP_INSTALL_STAGING = YES

IMX_VPUWRAP_DEPENDENCIES += host-pkgconf

ifeq ($(BR2_PACKAGE_IMX_VPU),y)
IMX_VPUWRAP_DEPENDENCIES += imx-vpu
endif

ifeq ($(BR2_PACKAGE_IMX_VPU_HANTRO),y)
IMX_VPUWRAP_DEPENDENCIES += imx-vpu-hantro
endif

IMX_VPUWRAP_LICENSE = NXP Semiconductor Software License Agreement
IMX_VPUWRAP_LICENSE_FILES = COPYING
IMX_VPUWRAP_REDISTRIBUTE = NO

IMX_VPUWRAP_AUTORECONF = YES
IMX_VPUWRAP_MAKE_ENV += PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"

$(eval $(autotools-package))
