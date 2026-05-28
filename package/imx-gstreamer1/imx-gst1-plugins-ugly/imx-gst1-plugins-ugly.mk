################################################################################
#
# imx-gst1-plugins-ugly
#
################################################################################

IMX_GST1_PLUGINS_UGLY_VERSION = 1.24.7
IMX_GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(IMX_GST1_PLUGINS_UGLY_VERSION).tar.xz
IMX_GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
IMX_GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
# GPL licensed plugins will append to IMX_GST1_PLUGINS_UGLY_LICENSE if enabled.
IMX_GST1_PLUGINS_UGLY_LICENSE = LGPL-2.1+

IMX_GST1_PLUGINS_UGLY_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

IMX_GST1_PLUGINS_UGLY_CONF_OPTS += \
	-Dtests=disabled \
	-Ddoc=disabled

IMX_GST1_PLUGINS_UGLY_CONF_OPTS += \
	-Da52dec=disabled \
	-Dcdio=disabled \
	-Dsidplay=disabled

IMX_GST1_PLUGINS_UGLY_DEPENDENCIES = imx-gstreamer1 imx-gst1-plugins-base

ifeq ($(BR2_PACKAGE_ORC),y)
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Dorc=enabled
IMX_GST1_PLUGINS_UGLY_DEPENDENCIES += orc
else
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Dorc=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_UGLY_PLUGIN_ASFDEMUX),y)
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Dasfdemux=enabled
else
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Dasfdemux=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC),y)
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdlpcmdec=enabled
else
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdlpcmdec=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_UGLY_PLUGIN_DVDSUB),y)
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdsub=enabled
else
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdsub=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA),y)
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Drealmedia=enabled
else
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Drealmedia=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD),y)
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdread=enabled
IMX_GST1_PLUGINS_UGLY_DEPENDENCIES += libdvdread
IMX_GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
else
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdread=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Dmpeg2dec=enabled
IMX_GST1_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
IMX_GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
else
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Dmpeg2dec=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_UGLY_PLUGIN_X264),y)
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Dx264=enabled
IMX_GST1_PLUGINS_UGLY_DEPENDENCIES += x264
IMX_GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
else
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Dx264=disabled
endif

# Add GPL license if GPL plugins enabled.
ifeq ($(IMX_GST1_PLUGINS_UGLY_HAS_GPL_LICENSE),y)
IMX_GST1_PLUGINS_UGLY_CONF_OPTS += -Dgpl=enabled
IMX_GST1_PLUGINS_UGLY_LICENSE += , GPL-2.0
endif

# Use the following command to extract license info for plugins.
# # find . -name 'plugin-*.xml' | xargs grep license

$(eval $(meson-package))
