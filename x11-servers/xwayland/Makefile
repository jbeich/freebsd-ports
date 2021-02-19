PORTNAME=	xwayland
DISTVERSIONPREFIX?=	${PORTNAME}-
DISTVERSION?=	21.1.1
PORTEPOCH?=	1
CATEGORIES=	x11-servers

.ifndef PATCHFILES
PATCH_SITES=	https://github.com/${GH_ACCOUNT}/${GH_PROJECT}/commit/
PATCHFILES+=	053544d4b5ec.patch:-p1 # https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/432
PATCHFILES+=	48a7bfeb4687.patch:-p1 # https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/432
PATCHFILES+=	2b3c4983f937.patch:-p1 # https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/432
.endif

MAINTAINER=	jbeich@FreeBSD.org
COMMENT=	X11 server as Wayland client

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	evdev-proto>0:devel/evdev-proto \
		${LOCALBASE}/include/GL/internal/dri_interface.h:graphics/mesa-dri \
		wayland-protocols>=1.18:graphics/wayland-protocols
LIB_DEPENDS=	libdrm.so:graphics/libdrm \
		libepoxy.so:graphics/libepoxy \
		libwayland-client.so:graphics/wayland
RUN_DEPENDS=	xkbcomp:x11/xkbcomp \
		xkeyboard-config>0:x11/xkeyboard-config

CONFLICTS_INSTALL=	${PORTNAME}-*

USES=		compiler:c11 gl meson pkgconfig xorg
USE_GITHUB=	yes
USE_GL=		gbm gl
USE_XORG=	pixman xau xdmcp xfont2 xkbfile xshmfence xtrans
GH_ACCOUNT=	mirror
GH_PROJECT=	xserver
MESON_ARGS+=	-Ddefault_font_path="${DEFAULT_FONTPATH_LIST:ts,}"
PLIST_FILES=	bin/Xwayland \
		"@comment lib/xorg/protocol.txt" \
		libdata/pkgconfig/xwayland.pc \
		"@comment man/man1/Xserver.1.gz" \
		man/man1/Xwayland.1.gz

# Keep in sync with xorg-server
FONTPATH_ROOT?=	${LOCALBASE}/share/fonts
FONTPATHD?=	${PREFIX}/etc/X11/fontpath.d
DEFAULT_FONTPATH_LIST= \
	${FONTPATH_ROOT}/misc/	\
	${FONTPATH_ROOT}/TTF/ \
	${FONTPATH_ROOT}/OTF/ \
	${FONTPATH_ROOT}/Type1/ \
	${FONTPATH_ROOT}/100dpi/ \
	${FONTPATH_ROOT}/75dpi/ \
	catalogue:${FONTPATHD}

OPTIONS_DEFINE=	NVIDIA

NVIDIA_DESC=		EGLStream support for glamor on Xwayland
NVIDIA_BUILD_DEPENDS=	egl-wayland>0:graphics/egl-wayland
NVIDIA_MESON_TRUE=	xwayland_eglstream

.include <bsd.port.mk>
