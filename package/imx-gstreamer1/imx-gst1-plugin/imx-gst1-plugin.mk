################################################################################
#
# imx-gst1-plugin
#
################################################################################

IMX_GST1_PLUGIN_VERSION = lf-6.6.52-2.2.2
IMX_GST1_PLUGIN_SITE = https://github.com/nxp-imx/imx-gst1.0-plugin.git
IMX_GST1_PLUGIN_SITE_METHOD = git

#IMX_GST1_PLUGIN_CFLAGS = $(TARGET_CFLAGS) -std=gnu17

# Most is LGPLv2+, but some sources are copied from upstream and are
# LGPLv2.1+, which essentially makes it LGPLv2.1+
IMX_GST1_PLUGIN_LICENSE = LGPLv2+, LGPLv2.1+, PROPRIETARY (asf.h)
IMX_GST1_PLUGIN_LICENSE_FILES = LICENSE.txt

IMX_GST1_PLUGIN_INSTALL_STAGING = YES
IMX_GST1_PLUGIN_AUTORECONF = YES

IMX_GST1_PLUGIN_DEPENDENCIES += host-pkgconf imx-parser imx-codec libdrm \
	imx-gstreamer1 imx-gst1-plugins-base imx-gst1-plugins-bad linux-headers
ifeq ($(BR2_PACKAGE_FREESCALE_IMX_HAS_VPU),y)
IMX_GST1_PLUGIN_DEPENDENCIES += imx-vpu imx-vpuwrap
endif

ifeq ($(BR2_arm),y)
IMX_GST1_PLUGIN_DEPENDENCIES += imx-lib
endif

IMX_GST1_PLUGIN_CONF_ENV += PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"

$(eval $(meson-package))
