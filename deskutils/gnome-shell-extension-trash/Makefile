# Created by: Gustau Perez i Querol <gustau.perez@gmail.com>
# $FreeBSD$

PORTNAME=	gnome-shell-extension-trash
PORTVERSION=	0.0.0.20150512
CATEGORIES=	deskutils gnome
DIST_SUBDIR=	gnome3

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	Gnome-shell trash indicator

BUILD_DEPENDS=	gnome-shell>=0:${PORTSDIR}/x11/gnome-shell \
		gsettings-desktop-schemas>=3.12.0:${PORTSDIR}/devel/gsettings-desktop-schemas
RUN_DEPENDS=	gnome-shell>=0:${PORTSDIR}/x11/gnome-shell \
		gsettings-desktop-schemas>=3.12.0:${PORTSDIR}/devel/gsettings-desktop-schemas

USES=		gettext gmake pkgconfig tar:xz
USE_GNOME=	glib20
USE_GITHUB=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GH_ACCOUNT=	bertoldia
GH_PROJECT=	gnome-shell-trash-extension
GH_TAGNAME=	0fa1d72

PKGMESSAGE=	../gnome-shell-extra-extensions/pkg-message.slaves

NO_BUILD=	yes

do-install:
		@${MKDIR} ${STAGEDIR}${PREFIX}/share/gnome-shell/extensions/gnome-shell-trash-extension
		@(cd ${WRKSRC} && ${CP} -pPR * \
			${STAGEDIR}${PREFIX}/share/gnome-shell/extensions/gnome-shell-trash-extension)

.include <bsd.port.mk>
