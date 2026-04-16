################################################################################
#
# imx-gst1-plugins-bad
#
################################################################################

IMX_GST1_PLUGINS_BAD_VERSION = lf-6.6.52-2.2.2
IMX_GST1_PLUGINS_BAD_SITE = https://github.com/nxp-imx/gst-plugins-bad.git
IMX_GST1_PLUGINS_BAD_SITE_METHOD = git
IMX_GST1_PLUGINS_BAD_GIT_SUBMODULES = YES
IMX_GST1_PLUGINS_BAD_INSTALL_STAGING = YES
# Additional plugin licenses will be appended to IMX_GST1_PLUGINS_BAD_LICENSE and
# IMX_GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
IMX_GST1_PLUGINS_BAD_LICENSE_FILES = COPYING
IMX_GST1_PLUGINS_BAD_LICENSE := LGPL-2.0+, LGPL-2.1+

IMX_GST1_PLUGINS_BAD_CFLAGS = $(TARGET_CFLAGS) -std=gnu17 -D_GNU_SOURCE
IMX_GST1_PLUGINS_BAD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

IMX_GST1_PLUGINS_BAD_CONF_OPTS = \
	-Dexamples=disabled \
	-Dtests=disabled \
	-Ddirectsound=disabled \
	-Dd3dvideosink=disabled \
	-Dwinks=disabled \
	-Dandroidmedia=disabled \
	-Dapplemedia=disabled \
	-Dgobject-cast-checks=disabled \
	-Dglib-asserts=disabled \
	-Dglib-checks=disabled \
	-Dextra-checks=disabled \
	-Ddoc=disabled

# Options which require currently unpackaged libraries
IMX_GST1_PLUGINS_BAD_CONF_OPTS += \
	-Dasio=disabled \
	-Davtp=disabled \
	-Dopensles=disabled \
	-Dmsdk=disabled \
	-Dvoamrwbenc=disabled \
	-Dbs2b=disabled \
	-Dchromaprint=disabled \
	-Dd3d11=disabled \
	-Ddc1394=disabled \
	-Ddts=disabled \
	-Dresindvd=disabled \
	-Dfaac=disabled \
	-Dflite=disabled \
	-Dgs=disabled \
	-Dgsm=disabled \
	-Dladspa=disabled \
	-Dldac=disabled \
	-Dlv2=disabled \
	-Dmediafoundation=disabled \
	-Dmicrodns=disabled \
	-Dlibde265=disabled \
	-Dmodplug=disabled \
	-Dmplex=disabled \
	-Donnx=disabled \
	-Dopenexr=disabled \
	-Dopenni2=disabled \
	-Dteletext=disabled \
	-Dwildmidi=disabled \
	-Dsmoothstreaming=disabled \
	-Dsoundtouch=disabled \
	-Dgme=disabled \
	-Dspandsp=disabled \
	-Dsvthevcenc=disabled \
	-Dtranscode=disabled \
	-Dwasapi2=disabled \
	-Dzxing=disabled \
	-Dmagicleap=disabled \
	-Disac=disabled \
	-Diqa=disabled \
	-Dopencv=disabled

IMX_GST1_PLUGINS_BAD_DEPENDENCIES = imx-gst1-plugins-base imx-gstreamer1

ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dintrospection=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += gobject-introspection
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dintrospection=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dwayland=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libdrm wayland wayland-protocols
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dwayland=disabled
endif

ifeq ($(BR2_PACKAGE_ORC),y)
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += orc
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dorc=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dorc=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_BLUEZ),y)
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += bluez5_utils
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dbluez=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dbluez=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_ACCURIP),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daccurip=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daccurip=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_ADPCMDEC),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dadpcmdec=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dadpcmdec=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_ADPCMENC),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dadpcmenc=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dadpcmenc=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_AIFF),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daiff=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daiff=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_ASFMUX),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dasfmux=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dasfmux=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_AUDIOBUFFERSPLIT),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daudiobuffersplit=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daudiobuffersplit=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daudiofxbad=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daudiofxbad=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_AUDIOLATENCY),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daudiolatency=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daudiolatency=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daudiomixmatrix=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daudiomixmatrix=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daudiovisualizers=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daudiovisualizers=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dautoconvert=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dautoconvert=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_BAYER),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dbayer=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dbayer=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_CAMERABIN2),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dcamerabin2=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dcamerabin2=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_CODECALPHA),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dcodecalpha=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dcodecalpha=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dcoloreffects=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dcoloreffects=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddebugutils=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddebugutils=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_DVBSUBENC),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddvbsubenc=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddvbsubenc=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddvbsuboverlay=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddvbsuboverlay=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_DVDSPU),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddvdspu=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddvdspu=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_FACEOVERLAY),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfaceoverlay=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfaceoverlay=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_FESTIVAL),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfestival=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfestival=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_FIELDANALYSIS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfieldanalysis=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfieldanalysis=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_FREEVERB),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfreeverb=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfreeverb=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_FREI0R),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfrei0r=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfrei0r=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_GAUDIEFFECTS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dgaudieffects=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dgaudieffects=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_GEOMETRICTRANSFORM),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dgeometrictransform=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dgeometrictransform=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_GDP),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dgdp=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dgdp=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_ID3TAG),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Did3tag=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Did3tag=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_INTER),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dinter=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dinter=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_INTERLACE),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dinterlace=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dinterlace=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_IVFPARSE),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Divfparse=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Divfparse=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_IVTC),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Divtc=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Divtc=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Djp2kdecimator=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Djp2kdecimator=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_JPEGFORMAT),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Djpegformat=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Djpegformat=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_LIBRFB),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dlibrfb=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dlibrfb=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_MIDI),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmidi=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmidi=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_MPEGDEMUX),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegdemux=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegdemux=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_MPEGPSMUX),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegpsmux=enabled
IMX_GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegpsmux=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_MPEGTSMUX),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegtsmux=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegtsmux=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegtsdemux=enabled
IMX_GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegtsdemux=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_MXF),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmxf=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmxf=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_NETSIM),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dnetsim=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dnetsim=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_ONVIF),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Donvif=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Donvif=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_PCAPPARSE),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dpcapparse=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dpcapparse=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_PNM),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dpnm=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dpnm=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_PROXY),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dproxy=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dproxy=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drawparse=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drawparse=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dremovesilence=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dremovesilence=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_RIST),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drist=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drist=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_RTMP2),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drtmp2=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drtmp2=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_RTP2),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drtp=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drtp=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_RTMP),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drtmp=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += rtmpdump
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drtmp=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SDP),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsdp=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsdp=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SEGMENTCLIP),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsegmentclip=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsegmentclip=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SIREN),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsiren=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsiren=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SMOOTH),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsmooth=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsmooth=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SPEED),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dspeed=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dspeed=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SUBENC),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsubenc=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsubenc=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SWITCHBIN),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dswitchbin=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dswitchbin=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_TIMECODE),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dtimecode=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dtimecode=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_VIDEOFILTERS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvideofilters=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvideofilters=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_VIDEOFRAME_AUDIOLEVEL),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvideoframe_audiolevel=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvideoframe_audiolevel=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvideoparsers=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvideoparsers=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvideosignal=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvideosignal=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_VMNC),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvmnc=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvmnc=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_Y4M),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dy4m=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dy4m=disabled
endif

# Plugins with dependencies

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_AES),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daes=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += openssl
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Daes=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dassrender=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libass
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dassrender=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_BZ2),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dbz2=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += bzip2
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dbz2=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_CURL),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dcurl=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libcurl
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dcurl=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_DASH),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddash=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libxml2
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddash=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_DECKLINK),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddecklink=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddecklink=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddirectfb=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += directfb
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddirectfb=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_DVB),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddvb=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += dtv-scan-tables
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddvb=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_FAAD),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfaad=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += faad2
IMX_GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfaad=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_FBDEV),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfbdev=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfbdev=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_FDK_AAC),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfdkaac=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += fdk-aac
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfdkaac=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfluidsynth=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += fluidsynth
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dfluidsynth=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_GL),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dgl=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dgl=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_HLS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dhls=enabled

ifeq ($(BR2_PACKAGE_NETTLE),y)
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += nettle
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dhls-crypto='nettle'
else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libgcrypt
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dhls-crypto='libgcrypt'
else
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += openssl
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dhls-crypto='openssl'
endif

else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dhls=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_KMS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dkms=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libdrm
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dkms=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_DTLS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddtls=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += openssl
IMX_GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE = y
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Ddtls=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_TTML),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dttml=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += cairo libxml2 pango
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dttml=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmpeg2enc=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libmpeg2 mjpegtools
IMX_GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmpeg2enc=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmusepack=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += musepack
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dmusepack=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_NEON),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dneon=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += neon
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dneon=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_OPENAL),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dopenal=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += openal
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dopenal=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_OPENH264),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dopenh264=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libopenh264
IMX_GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE = y
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dopenh264=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_OPENJPEG),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dopenjpeg=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += openjpeg
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dopenjpeg=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_OPUS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dopus=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += opus
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dopus=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_QROVERLAY),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dqroverlay=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += json-glib libqrencode
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dqroverlay=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_RSVG),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drsvg=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += librsvg
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Drsvg=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SBC),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsbc=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += sbc
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsbc=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SCTP),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += \
	-Dsctp=enabled \
	-Dsctp-internal-usrsctp=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += \
	-Dsctp=disabled \
	-Dsctp-internal-usrsctp=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SHM),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dshm=enabled
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dshm=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SNDFILE),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsndfile=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libsndfile
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsndfile=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_SRTP),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsrtp=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libsrtp
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dsrtp=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_UVCH264),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Duvch264=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libgudev libusb
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Duvch264=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvoaacenc=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dvoaacenc=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_WEBP),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dwebp=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += webp
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dwebp=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dwebrtc=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += gst1-plugins-base libnice
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dwebrtc=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dwebrtcdsp=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += webrtc-audio-processing
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dwebrtcdsp=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_WPE),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dwpe=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libwpe wpewebkit wpebackend-fdo
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dwpe=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_V4L2CODECS),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dv4l2codecs=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += libgudev
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dv4l2codecs=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_PLUGIN_X265),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dx265=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += x265
IMX_GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dx265=disabled
endif

ifeq ($(BR2_PACKAGE_IMX_GST1_PLUGINS_BAD_ZBAR),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dzbar=enabled
IMX_GST1_PLUGINS_BAD_DEPENDENCIES += zbar
else
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dzbar=disabled
endif

# Add GPL license if GPL licensed plugins enabled.
ifeq ($(IMX_GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
IMX_GST1_PLUGINS_BAD_CONF_OPTS += -Dgpl=enabled
IMX_GST1_PLUGINS_BAD_LICENSE += , GPL-2.0+
IMX_GST1_PLUGINS_BAD_LICENSE_FILES += COPYING
endif

# Add BSD license if BSD licensed plugins enabled.
ifeq ($(IMX_GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE),y)
IMX_GST1_PLUGINS_BAD_LICENSE += , BSD-2-Clause
endif

# Add Unknown license if Unknown licensed plugins enabled.
ifeq ($(IMX_GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE),y)
IMX_GST1_PLUGINS_BAD_LICENSE += , UNKNOWN
endif

# Use the following command to extract license info for plugins.
# # find . -name 'plugin-*.xml' | xargs grep license

$(eval $(meson-package))
