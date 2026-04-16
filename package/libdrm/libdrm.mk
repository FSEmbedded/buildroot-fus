################################################################################
#
# libdrm
#
################################################################################

ifeq ($(BR2_PACKAGE_FREESCALE_IMX),y)
# IMX needs special variant from NXP
LIBDRM_VERSION = lf-5.15.71-2.2.1
LIBDRM_SITE = https://github.com/nxp-imx/libdrm-imx.git
LIBDRM_SITE_METHOD = git
LIBDRM_LICENSE = MIT
LIBDRM_LICENSE_FILES = COPYING
LIBDRM_INSTALL_STAGING = YES
LIBDRM_AUTORECONF = YES

ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
LIBDRM_DEPENDENCIES += libatomic_ops
ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
LIBDRM_CFLAGS = $(TARGET_CFLAGS) -DAO_NO_SPARC_V9
endif
endif

ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
LIBDRM_CONF_OPTS += -Dintel=true
LIBDRM_DEPENDENCIES += libpciaccess
else
LIBDRM_CONF_OPTS += -Dintel=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
LIBDRM_CONF_OPTS += -Dradeon=true
else
LIBDRM_CONF_OPTS += -Dradeon=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_AMDGPU),y)
LIBDRM_CONF_OPTS += -Damdgpu=true
else
LIBDRM_CONF_OPTS += -Damdgpu=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
LIBDRM_CONF_OPTS += -Dnouveau=true
else
LIBDRM_CONF_OPTS += -Dnouveau=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
LIBDRM_CONF_OPTS += -Dvmwgfx=true
else
LIBDRM_CONF_OPTS += -Dvmwgfx=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_OMAP),y)
LIBDRM_CONF_OPTS += -Domap=true
else
LIBDRM_CONF_OPTS += -Domap=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_ETNAVIV),y)
LIBDRM_CONF_OPTS += -Detnaviv=true
else
LIBDRM_CONF_OPTS += -Detnaviv=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_EXYNOS),y)
LIBDRM_CONF_OPTS += -Dexynos=true
else
LIBDRM_CONF_OPTS += -Dexynos=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_FREEDRENO),y)
LIBDRM_CONF_OPTS += -Dfreedreno=true
else
LIBDRM_CONF_OPTS += -Dfreedreno=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_TEGRA),y)
LIBDRM_CONF_OPTS += -Dtegra=true
else
LIBDRM_CONF_OPTS += -Dtegra=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_VC4),y)
LIBDRM_CONF_OPTS += -Dvc4=true
else
LIBDRM_CONF_OPTS += -Dvc4=disabled
endif

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
LIBDRM_CONF_OPTS += -Dudev=true
LIBDRM_DEPENDENCIES += udev
else
LIBDRM_CONF_OPTS += -Dudev=disabled
endif

ifeq ($(BR2_PACKAGE_VALGRIND),y)
LIBDRM_CONF_OPTS += -Dvalgrind=true
LIBDRM_DEPENDENCIES += valgrind
else
LIBDRM_CONF_OPTS += -Dvalgrind=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
LIBDRM_CONF_OPTS += -Dinstall-test-programs=true
ifeq ($(BR2_PACKAGE_CUNIT),y)
LIBDRM_DEPENDENCIES += cunit
endif
endif

else
LIBDRM_VERSION = 2.4.124
LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
LIBDRM_SITE = https://dri.freedesktop.org/libdrm
LIBDRM_LICENSE = MIT
LIBDRM_LICENSE_FILES = data/meson.build
LIBDRM_INSTALL_STAGING = YES

LIBDRM_DEPENDENCIES = \
	libpthread-stubs \
	host-pkgconf

LIBDRM_CONF_OPTS = \
	-Dcairo-tests=disabled \
	-Dman-pages=disabled

ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
LIBDRM_DEPENDENCIES += libatomic_ops
ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
LIBDRM_CFLAGS = $(TARGET_CFLAGS) -DAO_NO_SPARC_V9
endif
endif

ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
LIBDRM_CONF_OPTS += -Dintel=enabled
LIBDRM_DEPENDENCIES += libpciaccess
else
LIBDRM_CONF_OPTS += -Dintel=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
LIBDRM_CONF_OPTS += -Dradeon=enabled
else
LIBDRM_CONF_OPTS += -Dradeon=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_AMDGPU),y)
LIBDRM_CONF_OPTS += -Damdgpu=enabled
else
LIBDRM_CONF_OPTS += -Damdgpu=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
LIBDRM_CONF_OPTS += -Dnouveau=enabled
else
LIBDRM_CONF_OPTS += -Dnouveau=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
LIBDRM_CONF_OPTS += -Dvmwgfx=enabled
else
LIBDRM_CONF_OPTS += -Dvmwgfx=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_OMAP),y)
LIBDRM_CONF_OPTS += -Domap=enabled
else
LIBDRM_CONF_OPTS += -Domap=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_ETNAVIV),y)
LIBDRM_CONF_OPTS += -Detnaviv=enabled
else
LIBDRM_CONF_OPTS += -Detnaviv=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_EXYNOS),y)
LIBDRM_CONF_OPTS += -Dexynos=enabled
else
LIBDRM_CONF_OPTS += -Dexynos=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_FREEDRENO),y)
LIBDRM_CONF_OPTS += -Dfreedreno=enabled
else
LIBDRM_CONF_OPTS += -Dfreedreno=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_TEGRA),y)
LIBDRM_CONF_OPTS += -Dtegra=enabled
else
LIBDRM_CONF_OPTS += -Dtegra=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_VC4),y)
LIBDRM_CONF_OPTS += -Dvc4=enabled
else
LIBDRM_CONF_OPTS += -Dvc4=disabled
endif

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
LIBDRM_CONF_OPTS += -Dudev=enabled
LIBDRM_DEPENDENCIES += udev
else
LIBDRM_CONF_OPTS += -Dudev=disabled
endif

ifeq ($(BR2_PACKAGE_VALGRIND),y)
LIBDRM_CONF_OPTS += -Dvalgrind=enabled
LIBDRM_DEPENDENCIES += valgrind
else
LIBDRM_CONF_OPTS += -Dvalgrind=disabled
endif

ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
LIBDRM_CONF_OPTS += -Dinstall-test-programs=enabled
ifeq ($(BR2_PACKAGE_CUNIT),y)
LIBDRM_DEPENDENCIES += cunit
endif
else
LIBDRM_CONF_OPTS += -Dtests=false
endif

endif

LIBDRM_DEPENDENCIES = \
	libpthread-stubs \
	host-pkgconf \
	host-xutil_util-macros

$(eval $(meson-package))
