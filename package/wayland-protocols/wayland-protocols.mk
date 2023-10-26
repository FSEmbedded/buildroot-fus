################################################################################
#
# wayland-protocols
#
################################################################################

ifeq ($(BR2_PACKAGE_FREESCALE_IMX),y)
WAYLAND_PROTOCOLS_VERSION = lf-5.15.71-2.2.1
WAYLAND_PROTOCOLS_SITE = https://github.com/nxp-imx/wayland-protocols-imx.git
WAYLAND_PROTOCOLS_SITE_METHOD = git
WAYLAND_PROTOCOLS_AUTORECONF = YES
WAYLAND_PROTOCOLS_DEPENDENCIES = host-pkgconf
else
WAYLAND_PROTOCOLS_VERSION = 1.31
WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
endif

WAYLAND_PROTOCOLS_LICENSE = MIT
WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
WAYLAND_PROTOCOLS_INSTALL_STAGING = YES
WAYLAND_PROTOCOLS_INSTALL_TARGET = NO

WAYLAND_PROTOCOLS_CONF_OPTS = -Dtests=false

$(eval $(meson-package))
