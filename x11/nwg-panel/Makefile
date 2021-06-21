PORTNAME=	nwg-panel
DISTVERSIONPREFIX=	v
DISTVERSION=	0.4.2
CATEGORIES=	x11

PATCH_SITES=	https://github.com/${GH_ACCOUNT}/${GH_PROJECT}/commit/
PATCHFILES+=	78031534f456.patch:-p1 # backlight (untested)

MAINTAINER=	jbeich@FreeBSD.org
COMMENT=	GTK3-based panel for Sway and other wlroots compositors

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gobject3>0:devel/py-gobject3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>0:sysutils/py-psutil@${PY_FLAVOR} \
		gtk-layer-shell>0:x11-toolkits/gtk-layer-shell \
		${PYTHON_PKGNAMEPREFIX}i3ipc>0:x11/py-i3ipc@${PY_FLAVOR}

USES=		python:3.4+
USE_GITHUB=	yes
USE_PYTHON=	autoplist distutils
GH_ACCOUNT=	nwg-piotr
NO_ARCH=	yes
PLIST_FILES=	share/applications/${PORTNAME}-config.desktop \
		share/pixmaps/${PORTNAME}.svg \
		share/pixmaps/nwg-shell.svg

OPTIONS_DEFINE=	NETIFACES PLAYERCTL PULSEAUDIO RANDR
OPTIONS_DEFAULT=NETIFACES PLAYERCTL PULSEAUDIO RANDR

NETIFACES_DESC=		Network interface status
NETIFACES_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}netifaces>0:net/py-netifaces@${PY_FLAVOR}

PLAYERCTL_DESC=		Control MPRIS media player
PLAYERCTL_RUN_DEPENDS=	playerctl:multimedia/playerctl

PULSEAUDIO_RUN_DEPENDS=	pamixer:audio/pamixer

RANDR_DESC=		Display geometry on non-Sway
RANDR_RUN_DEPENDS=	wlr-randr:x11/wlr-randr

post-patch:
# Adapt to BSD-style shutdown
	@${GREP} -Flr 'systemctl' ${WRKSRC} | ${XARGS} ${REINPLACE_CMD} \
		-e 's/systemctl reboot/shutdown -r now/' \
		-e 's/systemctl -i poweroff/shutdown -p now/' \
		${NULL}

post-install:
	${INSTALL_DATA} ${WRKSRC}/*.desktop \
		${STAGEDIR}${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/*.svg \
		${STAGEDIR}${PREFIX}/share/pixmaps

.include <bsd.port.mk>
