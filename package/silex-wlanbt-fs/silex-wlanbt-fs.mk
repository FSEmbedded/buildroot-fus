################################################################################
#
# silex-wlanbt-fs
#
# WLAN kernel module for Silex QCA9377, also needed for Bluetooth.
#
################################################################################

SILEX_WLANBT_FS_VERSION = v4.5.25.38
SILEX_WLANBT_FS_SITE = http://source.codeaurora.org/external/wlan/qcacld-2.0/snapshot
SILEX_WLANBT_FS_SOURCE = $(SILEX_WLANBT_FS_VERSION).tar.gz
#SILEX_WLANBT_FS_SITE_METHOD = wget
SILEX_WLANBT_FS_LICENSE = GPL-2.0 or BSD

# Options (taken from Silex driver LEA.3.0 4.5.25.38 sxa 1.0.0.019)
# necessary for selecting the correct defines in Kbuild.
#
# Attention: These settings will override any assignments for these variables
# done in qcacld-2.0/Kbuild; if a variable is set here in one way, but
# to a different value in Kbuild, the assignment in Kbuild is ignored.
# So make sure that you do not set values that contradict Kbuild
SILEX_WLANBT_FS_MODULE_MAKE_OPTS = KERNEL_SRC=$(LINUX_DIR)
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += WLAN_ROOT=$(@D)
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += MODNAME=wlan
# Options taken from build/scripts/imx6sx/config.imx6sx
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_LINUX_QCMBR=y
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_NON_QC_PLATFORM=y
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_WLAN_THERMAL_SHUTDOWN=0
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_CLD_HL_SDIO_CORE=y
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_PER_VDEV_TX_DESC_POOL=1
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += SAP_AUTH_OFFLOAD=1
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_QCA_LL_TX_FLOW_CT=1
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_WLAN_FEATURE_FILS=y
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_FEATURE_COEX_PTA_CONFIG_ENABLE=y
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_QCA_SUPPORT_TXRX_DRIVER_TCP_DEL_ACK=y
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_WLAN_WAPI_MODE_11AC_DISABLE=y
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_WLAN_WOW_PULSE=y
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_WLAN_FEATURE_11W=y
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_TXRX_PERF=y
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_PMF_SUPPORT=y
# Options taken from qcacld-2.0/Makefile
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_QCA_CLD_WLAN=m
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_QCA_WIFI_ISOC=0
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += CONFIG_QCA_WIFI_2_0=1
SILEX_WLANBT_FS_MODULE_MAKE_OPTS += WLAN_OPEN_SOURCE=1

$(eval $(kernel-module))

# Install startup script to set up the WLAN MAC address
define SILEX_WLANBT_FS_INSTALL_ETC_INITD
	$(INSTALL) -m 0755 -D package/silex-wlanbt-fs/S02silex \
		$(TARGET_DIR)/etc/init.d/S02silex
	ln -sf /run/Silex-MAC $(TARGET_DIR)/lib/firmware/wlan/wlan_mac.bin
endef

SILEX_WLANBT_FS_POST_INSTALL_TARGET_HOOKS += SILEX_WLANBT_FS_INSTALL_ETC_INITD

$(eval $(generic-package))
