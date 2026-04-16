################################################################################
#
# psplash
#
################################################################################

PSPLASH_VERSION = 44afb7506d43cca15582b4c5b90ba5580344d75d
PSPLASH_SITE = https://git.yoctoproject.org/psplash
PSPLASH_SITE_METHOD = git
PSPLASH_LICENSE = GPL-2.0+
PSPLASH_LICENSE_FILES = COPYING
PSPLASH_AUTORECONF = YES
PSPLASH_DEPENDENCIES = host-gdk-pixbuf host-pkgconf

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
PSPLASH_DEPENDENCIES += systemd
PSPLASH_CONF_OPTS += --with-systemd
else
PSPLASH_CONF_OPTS += --without-systemd
endif

ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR),y)
PSPLASH_CONF_OPTS += --enable-progress-bar
else
PSPLASH_CONF_OPTS += --disable-progress-bar
endif

ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG),y)
PSPLASH_CONF_OPTS += --enable-startup-msg
else
PSPLASH_CONF_OPTS += --disable-startup-msg
endif

PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))

ifeq ($(BR2_PACKAGE_CONFIG_PSPLASH),y)
define PSPLASH_COPY_CONFIG
	cp -f package/psplash/psplash-config.h $(@D)/
	cp -f package/psplash/psplash-colors.h $(@D)/
	cp -f package/psplash/radeon-font.h $(@D)/
endef
endif

ifneq ($(PSPLASH_IMAGE),)
define PSPLASH_COPY_IMAGE
	cp $(PSPLASH_IMAGE) $(@D)/base-images/psplash-poky.png
endef

PSPLASH_POST_EXTRACT_HOOKS += PSPLASH_COPY_IMAGE PSPLASH_COPY_CONFIG
endif

define PSPLASH_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 package/psplash/psplash-start.service \
		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service

	$(INSTALL) -D -m 644 package/psplash/psplash-systemd.service \
		$(TARGET_DIR)/usr/lib/systemd/system/psplash-systemd.service
endef

define PSPLASH_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 package/psplash/SysV_scripts/S01psplashInit \
		$(TARGET_DIR)/etc/init.d/S01psplashInit
	$(INSTALL) -D -m 755 package/psplash/SysV_scripts/S20psplashWrite \
		$(TARGET_DIR)/etc/init.d/S20psplashWrite
	$(INSTALL) -D -m 755 package/psplash/SysV_scripts/S40psplashWrite \
		$(TARGET_DIR)/etc/init.d/S40psplashWrite
	$(INSTALL) -D -m 755 package/psplash/SysV_scripts/S60psplashWrite \
		$(TARGET_DIR)/etc/init.d/S60psplashWrite
	$(INSTALL) -D -m 755 package/psplash/SysV_scripts/S80psplashWrite \
		$(TARGET_DIR)/etc/init.d/S80psplashWrite
	$(INSTALL) -D -m 755 package/psplash/SysV_scripts/S97psplashWrite \
		$(TARGET_DIR)/etc/init.d/S97psplashWrite
	$(INSTALL) -D -m 755 package/psplash/SysV_scripts/S99pslpashQuit \
		$(TARGET_DIR)/etc/init.d/S99pslpashQuit
endef

$(eval $(autotools-package))
