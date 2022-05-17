################################################################################
#
# silex-wlanbt-fs-firmware
#
# WLAN and Bluetooth firmware files for Silex QCA9377.
#
################################################################################

SILEX_WLANBT_FS_FIRMWARE_VERSION = v4.5.25.38-0
SILEX_WLANBT_FS_FIRMWARE_SITE = $(TOPDIR)/package/silex-wlanbt-fs-firmware
SILEX_WLANBT_FS_FIRMWARE_SOURCE = silex-wlanbt-fs-firmware-$(SILEX_WLANBT_FS_FIRMWARE_VERSION).tar.bz2
SILEX_WLANBT_FS_FIRMWARE_SITE_METHOD = file
SILEX_WLANBT_FS_FIRMWARE_LICENSE = Proprietary
#SILEX_WLANBT_FS_FIRMWARE_DEPENDENCIES = silex-wlanbt-fs

# Also add firmware files
SILEX_WLANBT_FS_FIRMWARE_FIRMWARE_FILES = bdwlan30.bin otp30.bin qwlan30.bin \
	utf30.bin utfbd30.bin COPYRIGHT
SILEX_WLANBT_FS_FIRMWARE_FIRMWARE_DIRS = qca wlan

# Subcommand to install single firmware files
define SILEX_WLANBT_FS_FIRMWARE_INSTALL_FIRMWARE_FILES
	cd $(@D)/firmware ; \
	$(TAR) c $(sort $(SILEX_WLANBT_FS_FIRMWARE_FIRMWARE_FILES)) | \
		$(TAR) x -C $(TARGET_DIR)/lib/firmware
endef

# Subcommand to install whole firmware directories; remove previous directories
# to avoid copying the new directories inside of the existing directories
define SILEX_WLANBT_FS_FIRMWARE_INSTALL_FIRMWARE_DIRS
	$(foreach d,$(SILEX_WLANBT_FS_FIRMWARE_FIRMWARE_DIRS), \
		rm -rf $(TARGET_DIR)/lib/firmware/$(d); \
		cp -a $(@D)/firmware/$(d) $(TARGET_DIR)/lib/firmware/$(d)$(sep))
endef

define SILEX_WLANBT_FS_FIRMWARE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware
	$(SILEX_WLANBT_FS_FIRMWARE_INSTALL_FIRMWARE_FILES)
	$(SILEX_WLANBT_FS_FIRMWARE_INSTALL_FIRMWARE_DIRS)
endef

# Install startup script to set up the WLAN MAC address
define SILEX_WLANBT_FS_FIRMWARE_INSTALL_ETC_INITD
	$(INSTALL) -m 0755 -D package/silex-wlanbt-fs-firmware/S02silex \
		$(TARGET_DIR)/etc/init.d/S02silex
	ln -sf /run/Silex-MAC $(TARGET_DIR)/lib/firmware/wlan/wlan_mac.bin
endef

SILEX_WLANBT_FS_FIRMWARE_POST_INSTALL_TARGET_HOOKS += SILEX_WLANBT_FS_FIRMWARE_INSTALL_ETC_INITD

$(eval $(generic-package))
