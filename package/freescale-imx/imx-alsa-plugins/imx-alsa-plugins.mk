################################################################################
#
# imx-alsa-plugins
#
################################################################################

IMX_ALSA_PLUGINS_VERSION = lf-6.6.52-2.2.2
IMX_ALSA_PLUGINS_SITE = $(call github,nxp-imx,imx-alsa-plugins,$(IMX_ALSA_PLUGINS_VERSION))
IMX_ALSA_PLUGINS_LICENSE = GPL-2.0+
IMX_ALSA_PLUGINS_LICENSE_FILES = LICENSE
IMX_ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib

# git, no configure
IMX_ALSA_PLUGINS_AUTORECONF = YES

# needs access to imx-specific kernel headers
IMX_ALSA_PLUGINS_DEPENDENCIES += linux
IMX_ALSA_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(BUILD_DIR)/linux-headers-custom/include/uapi -I$(@D)/include"

define IMX_ALSA_PLUGINS_FIX_HEADERS
	mkdir -p $(@D)/include/imx
	ln -sf $(BUILD_DIR)/linux-headers-custom/include/uapi/linux \
	       $(@D)/include/imx/linux
endef

IMX_ALSA_PLUGINS_PRE_CONFIGURE_HOOKS += IMX_ALSA_PLUGINS_FIX_HEADERS

$(eval $(autotools-package))
