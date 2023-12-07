################################################################################
#
# imx-lib
#
################################################################################

IMX_LIB_VERSION = 87ddd80953835eb29027d1d5a12044a08e809e40
IMX_LIB_SITE = https://github.com/nxp-imx/imx-lib.git
IMX_LIB_SITE_METHOD = git
IMX_LIB_LICENSE = LGPL-2.1+
IMX_LIB_LICENSE_FILES = COPYING-LGPL-2.1

IMX_LIB_INSTALL_STAGING = YES

# imx-lib needs access to imx-specific kernel headers
IMX_LIB_DEPENDENCIES += linux
IMX_LIB_INCLUDE = \
	-I $(LINUX_DIR)/usr/include/

IMX_LIB_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	$(TARGET_CONFIGURE_OPTS) \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) \
	INCLUDE="$(IMX_LIB_INCLUDE)"

define IMX_LIB_BUILD_CMDS
	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)
endef

define IMX_LIB_INSTALL_STAGING_CMDS
	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(STAGING_DIR) install
endef

define IMX_LIB_INSTALL_TARGET_CMDS
	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))
