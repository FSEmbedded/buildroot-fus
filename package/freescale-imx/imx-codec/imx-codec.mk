################################################################################
#
# imx-codec
#
################################################################################

IMX_CODEC_VERSION = 4.7.2
IMX_CODEC_SITE = $(FREESCALE_IMX_SITE)
IMX_CODEC_SOURCE = imx-codec-$(IMX_CODEC_VERSION).bin
IMX_CODEC_INSTALL_STAGING = YES

IMX_CODEC_LICENSE = NXP Semiconductor Software License Agreement, BSD-3-Clause (flac, ogg headers)
IMX_CODEC_LICENSE_FILES = EULA COPYING
IMX_CODEC_REDISTRIBUTE = NO

ifeq ($(BR2_aarch64),y)
IMX_CODEC_CONF_OPTS += --enable-armv8
endif

ifeq ($(BR2_ARM_EABIHF),y)
IMX_CODEC_CONF_OPTS += --enable-fhw
endif

ifeq ($(BR2_PACKAGE_IMX_VPU),y)
IMX_CODEC_CONF_OPTS += --enable-vpu
endif

define IMX_CODEC_EXTRACT_CMDS
	$(call NXP_EXTRACT_HELPER,$(IMX_CODEC_DL_DIR)/$(IMX_CODEC_SOURCE))
endef

# FIXME The Makefile installs both the arm9 and arm11 versions of the
# libraries, but we only need one of them.

# Upstream installs libraries into usr/lib/imx-mm, but the dynamic
# loader only looks in usr/lib, so move the libraries there. However
# keep usr/lib/imx-mm/audio-codec/wrap/*, these files are referenced
# in gstreamer in usr/share/beep_registry*.cf.
define IMX_CODEC_FIXUP_TARGET_PATH
	find $(TARGET_DIR)/usr/lib/imx-mm/audio-codec -maxdepth 1 \
		-not -type d -exec mv {} $(TARGET_DIR)/usr/lib \;
	echo "IMX audio codecs moved to /usr/lib" \
		> $(TARGET_DIR)/usr/lib/imx-mm/audio-codec/README.txt
	find $(TARGET_DIR)/usr/lib/imx-mm/video-codec -maxdepth 1 \
		-not -type d -exec mv {} $(TARGET_DIR)/usr/lib \;
	echo "IMX video codecs moved to /usr/lib" \
		> $(TARGET_DIR)/usr/lib/imx-mm/video-codec/README.txt
endef
define IMX_CODEC_FIXUP_STAGING_PATH
	find $(STAGING_DIR)/usr/lib/imx-mm/audio-codec -maxdepth 1 \
		-not -type d -exec mv {} $(STAGING_DIR)/usr/lib \;
	echo "IMX audio codecs moved to /usr/lib" \
		> $(STAGING_DIR)/usr/lib/imx-mm/audio-codec/README.txt
	find $(STAGING_DIR)/usr/lib/imx-mm/video-codec -maxdepth 1 \
		-not -type d -exec mv {} $(STAGING_DIR)/usr/lib \;
	echo "IMX video codecs moved to /usr/lib" \
		> $(STAGING_DIR)/usr/lib/imx-mm/video-codec/README.txt
endef

IMX_CODEC_POST_INSTALL_TARGET_HOOKS += IMX_CODEC_FIXUP_TARGET_PATH IMX_CODEC_FIXUP_STAGING_PATH

$(eval $(autotools-package))
