ifeq ($(BR2_PACKAGE_WESTON_V10),y)
include $(sort $(wildcard package/weston/weston-10.mk))
endif

ifeq ($(BR2_PACKAGE_WESTON_CURRENT),y)
include $(sort $(wildcard package/weston/weston-current.mk))
endif

$(eval $(meson-package))
