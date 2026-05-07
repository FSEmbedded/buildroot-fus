################################################################################
#
# wayland-protocols
#
################################################################################

ifeq ($(BR2_PACKAGE_FREESCALE_IMX),y)
WAYLAND_PROTOCOLS_VERSION = lf-6.6.52-2.2.2
WAYLAND_PROTOCOLS_SITE = https://github.com/nxp-imx/wayland-protocols-imx.git
WAYLAND_PROTOCOLS_SITE_METHOD = git
WAYLAND_PROTOCOLS_AUTORECONF = YES
WAYLAND_PROTOCOLS_DEPENDENCIES = host-pkgconf
else
WAYLAND_PROTOCOLS_VERSION = 1.39
WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
endif

WAYLAND_PROTOCOLS_LICENSE = MIT
WAYLAND_PROTOCOLS_LICENSE_FILES = LICENSE
WAYLAND_PROTOCOLS_INSTALL_STAGING = YES
WAYLAND_PROTOCOLS_INSTALL_TARGET = NO
# needs wayland-scanner
WAYLAND_PROTOCOLS_DEPENDENCIES = host-wayland

WAYLAND_PROTOCOLS_CONF_OPTS = -Dtests=false

$(eval $(meson-package))
