################################################################################
#
# imx-gstreamer1
#
################################################################################

IMX_GSTREAMER1_VERSION = lf-6.6.52-2.2.2
IMX_GSTREAMER1_SITE = https://github.com/nxp-imx/gstreamer.git
IMX_GSTREAMER1_SITE_METHOD = git
IMX_GSTREAMER1_GIT_SUBMODULES = YES

#IMX_GSTREAMER1_VERSION = 1.22.6
#IMX_GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
#IMX_GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
IMX_GSTREAMER1_INSTALL_STAGING = YES
IMX_GSTREAMER1_LICENSE_FILES = COPYING
IMX_GSTREAMER1_LICENSE = LGPL-2.1+

IMX_GSTREAMER1_CONF_OPTS = \
	-Dexamples=disabled \
	-Dtests=disabled \
	-Dbenchmarks=disabled \
	-Dtools=$(if $(BR2_PACKAGE_IMX_GSTREAMER1_INSTALL_TOOLS),enabled,disabled) \
	-Dgobject-cast-checks=disabled \
	-Dglib-asserts=disabled \
	-Dglib-checks=disabled \
	-Dextra-checks=disabled \
	-Dcheck=$(if $(BR2_PACKAGE_IMX_GSTREAMER1_CHECK),enabled,disabled) \
	-Dtracer_hooks=$(if $(BR2_PACKAGE_IMX_GSTREAMER1_TRACE),true,false) \
	-Doption-parsing=$(if $(BR2_PACKAGE_IMX_GSTREAMER1_PARSE),true,false) \
	-Dgst_debug=$(if $(BR2_PACKAGE_IMX_GSTREAMER1_GST_DEBUG),true,false) \
	-Dgst_parse=true \
	-Dregistry=$(if $(BR2_PACKAGE_IMX_GSTREAMER1_PLUGIN_REGISTRY),true,false) \
	-Ddoc=disabled


IMX_GSTREAMER1_DEPENDENCIES = \
	host-bison \
	host-flex \
	host-pkgconf \
	libglib2 \
	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
	$(if $(BR2_PACKAGE_VALGRIND),valgrind) \
	$(TARGET_NLS_DEPENDENCIES)

ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
IMX_GSTREAMER1_CONF_OPTS += -Dintrospection=enabled
IMX_GSTREAMER1_DEPENDENCIES += gobject-introspection
else
IMX_GSTREAMER1_CONF_OPTS += -Dintrospection=disabled
endif

IMX_GSTREAMER1_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

# By default, girdir uses datadir as its prefix of which pkg-config will not
# append the sysroot directory. This results in a build failure with
# gst1-plugins-base. Changing prefix to ${libdir}/../share prevents this error.
define IMX_GSTREAMER1_FIX_GIRDIR
	$(SED) "s%girdir=.*%girdir=\$${libdir}/../share/gir-1.0%g" \
		$(STAGING_DIR)/usr/lib/pkgconfig/gstreamer-1.0.pc \
		$(STAGING_DIR)/usr/lib/pkgconfig/gstreamer-base-1.0.pc
endef
IMX_GSTREAMER1_POST_INSTALL_STAGING_HOOKS += IMX_GSTREAMER1_FIX_GIRDIR

$(eval $(meson-package))
