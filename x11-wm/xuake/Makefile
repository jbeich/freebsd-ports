PORTNAME=	xuake
DISTVERSION=	0.2.2
CATEGORIES=	x11-wm

PATCH_SITES=	https://github.com/${GH_ACCOUNT}/${GH_PROJECT}/commit/
PATCHFILES+=	69d9659250af.patch:-p1 # https://github.com/Sasquatch-Labs/xuake/pull/1
PATCHFILES+=	7f5b31ae220e.patch:-p1 # https://github.com/Sasquatch-Labs/xuake/pull/1

MAINTAINER=	jbeich@FreeBSD.org
COMMENT=	WYGIWYG Wayland Compositor

LICENSE=	BSD3CLAUSE CC0-1.0 MIT
LICENSE_COMB=	multi
LICENSE_FILE_BSD3CLAUSE=${WRKSRC}/LICENSE.pngbook
LICENSE_FILE_CC0-1.0=	${WRKSRC}/LICENSE.tinywl
LICENSE_FILE_MIT=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	evdev-proto>0:devel/evdev-proto \
		wayland-protocols>0:graphics/wayland-protocols \
		wlroots>=0.11.0:x11-toolkits/wlroots \
		${NONEXISTENT}:x11-fonts/terminus-font:configure
LIB_DEPENDS=	libpng.so:graphics/png \
		libwayland-server.so:graphics/wayland \
		libwlroots.so:x11-toolkits/wlroots \
		libxkbcommon.so:x11/libxkbcommon

USES=		compiler:c11 gl gmake lua:54 pkgconfig xorg
USE_GITHUB=	yes
USE_GL=		egl
USE_XORG=	xcb
GH_ACCOUNT=	Sasquatch-Labs
MAKE_ARGS=	CC="${CC}"
LDFLAGS+=	-Wl,--as-needed
FONT_WRKSRC=	${:!${MAKE} -V WRKSRC -C ${PORTSDIR}/x11-fonts/terminus-font!}
PLIST_FILES=	bin/xk \
		bin/xkterm \
		bin/${PORTNAME} \
		share/consolefonts/Uni2-Terminus20x10.psf.gz \
		share/consolefonts/Uni2-TerminusBold20x10.psf.gz \
		${NULL}

post-patch:
	@${REINPLACE_CMD} -e '/pkg-config/s/lua[[:>:]]/&-${LUA_VER}/' \
		-e '/^CFLAGS/s/=/+=/; s/-ggdb //' \
		-e '/_LIBS=/s/=/+= $$(LDFLAGS) /' \
		-e '/chown/d; /chmod/d; /tic/d' \
		${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's,/usr/share,${PREFIX}/share,' \
		${WRKSRC}/dev.conf.lua \
		${WRKSRC}/example.conf.lua \
		${WRKSRC}/xkdefs.h

pre-build:
	@${DO_MAKE_BUILD} psf -C${FONT_WRKSRC}
	${GZIP_CMD} ${FONT_WRKSRC}/ter-v20*.psf

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/share/consolefonts
	${INSTALL_DATA} ${FONT_WRKSRC}/ter-v20n.psf.gz \
		${STAGEDIR}${PREFIX}/share/consolefonts/Uni2-Terminus20x10.psf.gz
	${INSTALL_DATA} ${FONT_WRKSRC}/ter-v20b.psf.gz \
		${STAGEDIR}${PREFIX}/share/consolefonts/Uni2-TerminusBold20x10.psf.gz

.include <bsd.port.mk>
