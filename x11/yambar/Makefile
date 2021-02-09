PORTNAME=	yambar
DISTVERSION=	1.6.1
CATEGORIES=	x11
MASTER_SITES=	https://codeberg.org/dnkl/${PORTNAME}/archive/${DISTVERSIONFULL}${EXTRACT_SUFX}?dummy=/

PATCH_SITES=	https://codeberg.org/jbeich/${PORTNAME}/commit/
PATCHFILES+=	24f7fa984714.patch:-p1 # wayland: unbreak build without memfd_create
PATCHFILES+=	3d5aa9291a14.patch:-p1 # particle: add missing header
PATCHFILES+=	0f7a8f9ca653.patch:-p1 # main: cast sig_atomic_t for printf
PATCHFILES+=	08c0b319354d.patch:-p1 # module/xwindow: add missing header
PATCHFILES+=	038ea1c7a60e.patch:-p1 # module/removables: workaround incomplete libudev on FreeBSD
PATCHFILES+=	5b4fb2b60b65.patch:-p1 # module/mpd: add libinotify-kqueue on BSDs
PATCHFILES+=	1add627cf00d.patch:-p1 # module/script: add missing header
PATCHFILES+=	00fa5dcd6750.patch:-p1 # module/script: fix typo found by Clang
PATCHFILES+=	40acac24ab5f.patch:-p1 # module/network: disable on non-Linux
PATCHFILES+=	a76e78d1e534.patch:-p1 # meson: require epoll-shim on BSDs
PATCHFILES+=	77d8a3a51d31.patch:-p1 # meson: libpthread may lack C11 threads e.g., on FreeBSD

MAINTAINER=	jbeich@FreeBSD.org
COMMENT=	Modular status panel for X11 and Wayland, inspired by polybar

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	tllist>=1.0.1:devel/tllist \
		scdoc:textproc/scdoc
LIB_DEPENDS=	libasound.so:audio/alsa-lib \
		libmpdclient.so:audio/libmpdclient \
		libjson-c.so:devel/json-c \
		libepoll-shim.so:devel/libepoll-shim \
		libinotify.so:devel/libinotify \
		libudev.so:devel/libudev-devd \
		libyaml.so:textproc/libyaml \
		libfcft.so:x11-fonts/fcft

USES=		compiler:c11 meson pkgconfig xorg
USE_XORG=	pixman
WRKSRC=		${WRKDIR}/${PORTNAME}

OPTIONS_DEFINE=	WAYLAND X11
OPTIONS_DEFAULT=WAYLAND X11
OPTIONS_SUB=	yes

WAYLAND_BUILD_DEPENDS=	wayland-protocols>0:graphics/wayland-protocols
WAYLAND_LIB_DEPENDS=	libwayland-client.so:graphics/wayland
WAYLAND_MESON_ENABLED=	backend-wayland

X11_LIB_DEPENDS=	libxcb-util.so:x11/xcb-util \
			libxcb-cursor.so:x11/xcb-util-cursor \
			libxcb-errors.so:x11/xcb-util-errors \
			libxcb-ewmh.so:x11/xcb-util-wm
X11_USE=		XORG=xcb
X11_MESON_ENABLED=	backend-x11

.include <bsd.port.mk>
