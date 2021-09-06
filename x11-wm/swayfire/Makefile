PORTNAME=	swayfire
PORTVERSION=	s20220219
CATEGORIES=	x11-wm

MAINTAINER=	jbeich@FreeBSD.org
COMMENT=	Sway/I3 inspired tiling window manager for Wayfire

LICENSE=	GPLv3

BUILD_DEPENDS=	wayfire>=0.7.2.122:x11-wm/wayfire
LIB_DEPENDS=	libwf-config.so:devel/wf-config \
		libwlroots.so:x11-toolkits/wlroots

USES=		compiler:c++17-lang gnome meson pkgconfig
USE_GITHUB=	yes
USE_GNOME=	cairo
GH_ACCOUNT=	Javyre
GH_TAGNAME=	df46b60
PLIST_FILES=	lib/wayfire/lib${PORTNAME}-deco.so \
		lib/wayfire/lib${PORTNAME}.so \
		share/wayfire/metadata/${PORTNAME}-deco.xml \
		share/wayfire/metadata/${PORTNAME}.xml

.include <bsd.port.mk>
