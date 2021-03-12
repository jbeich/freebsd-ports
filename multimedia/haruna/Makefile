PORTNAME=	haruna
DISTVERSION=	0.5.0
CATEGORIES=	multimedia audio

MAINTAINER=	jbeich@FreeBSD.org
COMMENT=	Video player built with Qt/QML and libmpv

LICENSE=	CC-BY-4.0 GPLv3+ WTFPL
LICENSE_COMB=	multi
LICENSE_FILE_CC-BY-4.0=	${WRKSRC}/LICENSES/CC-BY-4.0.txt
LICENSE_FILE_GPLv3+ =	${WRKSRC}/LICENSES/GPL-3.0-or-later.txt
LICENSE_FILE_WTFPL=	${WRKSRC}/LICENSES/WTFPL.txt

LIB_DEPENDS=	libmpv.so:multimedia/mpv

USES=		cmake compiler:c++14-lang desktop-file-utils kde:5 \
		localbase:ldflags pkgconfig qt:5
USE_GITHUB=	yes
USE_KDE=	breeze config configwidgets coreaddons filemetadata i18n kio \
		kirigami2 xmlgui ecm_build
USE_QT=		core dbus declarative gui quickcontrols2 widgets \
		buildtools_build qmake_build
GH_ACCOUNT=	g-fb
LDFLAGS+=	-Wl,--as-needed # kirigami2 deps
PLIST_FILES=	bin/${PORTNAME} \
		share/applications/com.georgefb.haruna.desktop \
		share/icons/hicolor/256x256/apps/com.georgefb.haruna.svg \
		share/metainfo/com.georgefb.haruna.appdata.xml

.include <bsd.port.mk>
