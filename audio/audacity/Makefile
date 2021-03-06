# Created by: Marc van Woerkom <3d@FreeBSD.org>
# $FreeBSD$

PORTNAME=	audacity
PORTVERSION=	2.1.0
PORTREVISION=	5
CATEGORIES=	audio
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}
DISTNAME=	${PORTNAME}-minsrc-${PORTVERSION}

MAINTAINER=	xxjack12xx@gmail.com
COMMENT=	GUI editor for digital audio waveforms

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

LIB_DEPENDS=	libsndfile.so:${PORTSDIR}/audio/libsndfile

WRKSRC=		${WRKDIR}/${PORTNAME}-minsrc-${PORTVERSION}

GNU_CONFIGURE=	yes
USES=		cpe desktop-file-utils gettext gmake pkgconfig shared-mime-info \
		tar:xz
USE_WX=		2.8+
WX_UNICODE=	yes
WX_COMPS=	wx
INSTALLS_ICONS=	yes
PORTDOCS=	README.txt

OPTIONS_DEFINE=	DEBUG DOCS FFMPEG FLAC ID3TAG LADSPA LAME MAD MIDI NYQUIST \
		PORTMIXER SBSMS SOUNDTOUCH TWOLAME VAMP VORBIS VST
OPTIONS_SINGLE=	SAMPLERATED
OPTIONS_SINGLE_SAMPLERATED=	SAMPLERATE #SOXR
OPTIONS_DEFAULT=	FFMPEG FLAC ID3TAG LADSPA MAD MIDI NYQUIST \
			PORTMIXER SBSMS SOUNDTOUCH SAMPLERATE TWOLAME VAMP VORBIS VST
OPTIONS_DEFINE_amd64=	SSE
OPTIONS_DEFINE_i386=	SSE
OPTIONS_DEFAULT_amd64=	SSE
OPTIONS_DEFAULT_i386=	${MACHINE_CPU:tu:MSSE}

DEBUG_DESC=	Enable debug support
LAME_DESC=	Use lame for import and export support
MAD_DESC=	Use libmad for mp2/3 decoding support
MIDI_DESC=	Use portSMF for Midi support
NYQUIST_DESC=	Nyquist plug-in support
SAMPLERATE_DESC=	Use libsamplerate for sample rate conversion
SAMPLERATED_DESC=	Default sample rate conversion support
PORTMIXER_DESC=	Compile with PortMixer support
SBSMS_DESC=	Use libsbsms for pitch and tempo changing
SOUNDTOUCH_DESC=	Use libSoundTouch for pitch and tempo changing
#SOXR_DESC=	Use libsoxr for sample rate conversion
TAGLIB_DESC=	Use TagLib for metadata support
TWOLAME_DESC=	Use libtwolame for MP2 export support
VAMP_DESC=	Vamp plug-in support
VST_DESC=	VST plug-in support

CONFIGURE_ENV+=	WX_CONFIG="${WX_CONFIG}"

CONFIGURE_ARGS+=	--with-lib-preference="local system" \
			--enable-portaudio --enable-unicode

DEBUG_CONFIGURE_WITH=	debug

FFMPEG_CONFIGURE_WITH=	ffmpeg
FFMPEG_RUN_DEPENDS=	${LOCALBASE}/bin/ffmpeg:${PORTSDIR}/multimedia/ffmpeg
FFMPEG_LIB_DEPENDS=	libavformat.so:${PORTSDIR}/multimedia/ffmpeg
FFMPEG_CFLAGS=		-I${LOCALBASE}/include/ffmpeg
FFMPEG_CPPFLAGS=	-I${LOCALBASE}/include/ffmpeg
FFMPEG_CXXFLAGS=	-I${LOCALBASE}/include/ffmpeg

FLAC_CONFIGURE_WITH=	libflac
FLAC_LIB_DEPENDS=	libFLAC.so:${PORTSDIR}/audio/flac

ID3TAG_CONFIGURE_WITH=	libid3tag
ID3TAG_LIB_DEPENDS=	libid3tag.so:${PORTSDIR}/audio/libid3tag

JACK_LIB_DEPENDS=	libjack.so:${PORTSDIR}/audio/jack

LADSPA_CONFIGURE_ENABLE=	ladspa
LADSPA_RUN_DEPENDS=	listplugins:${PORTSDIR}/audio/ladspa

MAD_CONFIGURE_WITH=	libmad
MAD_LIB_DEPENDS=	libmad.so:${PORTSDIR}/audio/libmad

MIDI_CONFIGURE_WITH=	midi

LAME_CONFIGURE_WITH=	lame
LAME_LIB_DEPENDS=	libmp3lame.so:${PORTSDIR}/audio/lame

NYQUIST_CONFIGURE_ENABLE=	nyquist

PORTMIXER_CONFIGURE_WITH=	portmixer

SAMPLERATE_CONFIGURE_WITH=	libsamplerate
SAMPLERATE_LIB_DEPENDS=	libsamplerate.so:${PORTSDIR}/audio/libsamplerate

SBSMS_CONFIGURE_WITH=	sbsms

SOUNDTOUCH_CONFIGURE_WITH=	soundtouch
SOUNDTOUCH_LIB_DEPENDS=	libSoundTouch.so:${PORTSDIR}/audio/soundtouch

#SOXR_CONFIGURE_WITH=	libsoxr
#SOXR_BUILD_DEPENDS=	cmake:${PORTSDIR}/devel/cmake

SSE_CONFIGURE_ENABLE=	sse

TWOLAME_CONFIGURE_WITH=	libtwolame
TWOLAME_LIB_DEPENDS=	libtwolame.so:${PORTSDIR}/audio/twolame

VAMP_CONFIGURE_WITH=	libvamp

VORBIS_CONFIGURE_WITH=	libvorbis
VORBIS_LIB_DEPENDS=	libvorbis.so:${PORTSDIR}/audio/libvorbis

VST_CONFIGURE_ENABLE=	vst

LDFLAGS+=	-lpthread -L${LOCALBASE}/lib
CPPFLAGS+=	-I${WRKSRC}/lib-src/portsmf
CXXFLAGS+=	-I${WRKSRC}/lib-src/portsmf
CFLAGS+=	-I${WRKSRC}/lib-src/portsmf \
		-I${WRKSRC}/lib-src/portaudio-v19/include \
		-I${WRKSRC}/lib-src/lame -I${LOCALBASE}/include

post-patch:
	@${REINPLACE_CMD} -e 's|inline void|static inline void|' ${WRKSRC}/lib-src/libnyquist/nyquist/ffts/src/fftlib.c

post-patch-PORTMIXER-off:
	@${REINPLACE_CMD} -e 's/ portmixer / /' ${WRKSRC}/lib-src/Makefile.in

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
