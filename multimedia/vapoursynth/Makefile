PORTNAME=	vapoursynth
DISTVERSION=	R55
DISTVERSIONSUFFIX=	-API3
CATEGORIES=	multimedia

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Video processing framework with simplicity in mind
WWW=		https://www.vapoursynth.com/

LICENSE=	LGPL21+

USE_GITHUB=	yes

USES=		autoreconf gmake libtool localbase pathfix pkgconfig
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
DATADIR=	${PREFIX}/lib/vapoursynth

OPTIONS_DEFINE=	DEBUG DOCS FRAME_GUARD
OPTIONS_DEFAULT=${OPTIONS_GROUP_COMPS}
OPTIONS_SUB=	yes

OPTIONS_DEFINE_amd64=	SIMD
OPTIONS_DEFINE_i386=	SIMD
OPTIONS_DEFAULT_amd64=	SIMD

OPTIONS_GROUP=		COMPS PLUGINS
COMPS_DESC=		Components
OPTIONS_GROUP_COMPS=	CORE PYTHON VSPIPE VSSCRIPT

# General options

DEBUG_CONFIGURE_ENABLE=		debug

DOCS_BUILD_DEPENDS=		sphinx-build:textproc/py-sphinx \
				${PYTHON_PKGNAMEPREFIX}sphinx_rtd_theme>0:textproc/py-sphinx_rtd_theme@${PY_FLAVOR}
DOCS_USES=			makeinfo
DOCS_INFO=			VapourSynth
DOCS_PORTDOCS=			*

FRAME_GUARD_DESC=		Check integrity after each filter
FRAME_GUARD_CONFIGURE_ENABLE=	guard-pattern

# VSSCRIPT
SIMD_BUILD_DEPENDS=		nasm:devel/nasm
SIMD_CONFIGURE_ENABLE=		x86-asm

# COMPS group

CORE_DESC=			Core library
CORE_BUILD_DEPENDS=		sekrit-twc-zimg>=2.9.3:graphics/sekrit-twc-zimg
CORE_LIB_DEPENDS=		libzimg.so:graphics/sekrit-twc-zimg
CORE_USES=			compiler:c++11-lib
CORE_CONFIGURE_ENABLE=		core

PYTHON_USES=			python:3.3+
PYTHON_USE=			python=cython
PYTHON_VARS=			BINARY_ALIAS=cython=cython-${PYTHON_VER}
PYTHON_CONFIGURE_ENABLE=	python-module
PYTHON_IMPLIES=			CORE

VSPIPE_DESC=			Command line interface
VSPIPE_USES=			compiler:c++11-lib
VSPIPE_CONFIGURE_ENABLE=	vspipe
VSPIPE_IMPLIES=			VSSCRIPT

VSSCRIPT_DESC=			Scripting library
VSSCRIPT_USES=			compiler:c++11-lib python:3.3+
VSSCRIPT_CONFIGURE_ENABLE=	vsscript

post-patch:
	@${REINPLACE_CMD} -e 's/x86_64/&|amd64/' \
		-e '/AC_SEARCH.*libiconv/d' \
		-e '/test/s/[^ ]*libiconv.*-a //' \
		${WRKSRC}/configure.ac

post-build-DOCS-on:
	@${DO_MAKE_BUILD} html texinfo -C${WRKSRC}/doc
	@${DO_MAKE_BUILD} info -C${WRKSRC}/doc/_build/texinfo
	@if [ -n "${PORT_OPTIONS:MVSPIPE}" ]; then \
		${DO_MAKE_BUILD} man -C${WRKSRC}/doc; \
	fi

post-install-DOCS-on:
	${INSTALL_DATA} ${WRKSRC}/doc/_build/texinfo/VapourSynth.info \
		${STAGEDIR}${PREFIX}/${INFO_PATH}
	(cd ${WRKSRC}/doc/_build/html && ${COPYTREE_SHARE} \
		"${PORTDOCS}" ${STAGEDIR}${DOCSDIR})
	@if [ -n "${PORT_OPTIONS:MVSPIPE}" ]; then \
		${INSTALL_MAN} -v ${WRKSRC}/doc/_build/man/vspipe.1 \
			${STAGEDIR}${PREFIX}/share/man/man1; \
	fi

.include <bsd.port.mk>
