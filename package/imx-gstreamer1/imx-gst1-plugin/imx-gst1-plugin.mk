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

IMX_GST1_PLUGIN_DEPENDENCIES += host-pkgconf imx-parser imx-codec \
	imx-gstreamer1 imx-gst1-plugins-base imx-gst1-plugins-bad libdrm
ifeq ($(BR2_PACKAGE_FREESCALE_IMX_HAS_VPU),y)
IMX_GST1_PLUGIN_DEPENDENCIES += imx-vpu imx-vpuwrap
endif

ifeq ($(BR2_arm),y)
IMX_GST1_PLUGIN_DEPENDENCIES += imx-lib
endif

#IMX_GST1_PLUGIN_CONF_ENV = \
#	PLATFORM=$(BR2_PACKAGE_IMX_GST1_PLUGIN_PLATFORM) \
#	CROSS_ROOT="$(STAGING_DIR)"

IMX_GST1_PLUGINS_BAD_CONF_OPTS = \
		-Dplatform=${BR2_PACKAGE_IMX_GST1_PLUGIN_PLATFORM} \
        -Dc_args="${CFLAGS} -I$(@D)/libs/ -idirafter $(STAGING_DIR)/usr/include -L$(STAGING_DIR)/usr/lib" \

# needs access to imx-specific kernel headers
IMX_GST1_PLUGIN_DEPENDENCIES += linux
#IMX_GST1_PLUGIN_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(STAGING_DIR)/usr/include/linux"

#IMX_GST1_PLUGIN_CONF_OPTS = --disable-mp3enc
#ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
#IMX_GST1_PLUGIN_DEPENDENCIES += xlib_libX11
#IMX_GST1_PLUGIN_CONF_OPTS += --enable-x11
#else
#IMX_GST1_PLUGIN_CONF_OPTS += --disable-x11
#endif

# Autoreconf requires an m4 directory to exist
define IMX_GST1_PLUGIN_PATCH_M4
	mkdir -p $(@D)/m4
endef


define IMX_GST1_PLUGIN_IMX_HEADERS
	mkdir -p $(@D)/libs/linux
	mkdir -p $(@D)/libs/asm
	# We need the newest videodev2.h, which in turn needs compiler.h
	cp $(BUILD_DIR)/linux-headers-custom/usr/include/linux/videodev2.h $(@D)/libs/linux
	cp $(BUILD_DIR)/linux-headers-custom/usr/include/linux/ipu.h $(@D)/libs/linux
	cp $(BUILD_DIR)/linux-headers-custom/usr/include/linux/mxcfb.h $(@D)/libs/linux
	cp $(BUILD_DIR)/linux-headers-custom/usr/include/linux/pxp_device.h $(@D)/libs/linux
	cp $(BUILD_DIR)/linux-headers-custom/usr/include/linux/pxp_dma.h $(@D)/libs/linux
	# We need the imx version of dma-buf.h for DMA_BUF_IOCTL_PHYS
	cp $(BUILD_DIR)/linux-headers-custom/usr/include/linux/dma-buf.h $(@D)/libs/linux
	cp $(BUILD_DIR)/linux-headers-custom/usr/include/linux/mxc_v4l2.h $(@D)/libs/linux


endef

IMX_GST1_PLUGIN_POST_PATCH_HOOKS += IMX_GST1_PLUGIN_PATCH_M4 IMX_GST1_PLUGIN_IMX_HEADERS

IMX_GST1_PLUGIN_CONF_ENV += PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"

#$(eval $(autotools-package))
$(eval $(meson-package))
