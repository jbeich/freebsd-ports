PORTNAME=	wf-gsettings
PORTVERSION=	s20210721
CATEGORIES=	devel

MAINTAINER=	jbeich@FreeBSD.org
COMMENT=	GSettings plugin for Wayfire

LICENSE=	UNLICENSE
LICENSE_FILE=	${WRKSRC}/UNLICENSE

BUILD_DEPENDS=	wayfire>0:x11-wm/wayfire

USES=		gnome meson pkgconfig
USE_GITHUB=	yes
USE_GNOME=	glib20 libxslt:run
GH_ACCOUNT=	DankBSD
GH_TAGNAME=	2f872da
GLIB_SCHEMAS=	org.wayfire.gsettings.gschema.xml
PLIST_FILES=	bin/${PORTNAME}-gen-schemas \
		lib/wayfire/libgsettings.so \
		${DATADIR}/genschema.xsl \
		"@postexec ${PORTNAME}-gen-schemas" \
		"@postunexec rm %D/share/glib-2.0/schemas/org.wayfire.section.*"

.include <bsd.port.mk>
