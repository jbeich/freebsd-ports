PORTNAME=	narcissu2
PORTVERSION=	1
CATEGORIES=	japanese games
MASTER_SITES=	http://mirror.studio-ramble.com/upload/280/200705/:game \
		https://aur.archlinux.org/cgit/aur.git/plain/:icon
DISTNAME=	naru2
DISTFILES=	${DISTNAME}.lzh:game \
		${PORTNAME}-en.png?h=${PORTNAME}-en&id=9768eea:icon
EXTRACT_ONLY=	${DISTFILES:N*\:icon:C/:.*//}

MAINTAINER=	jbeich@FreeBSD.org
COMMENT=	Visual novel about an encounter of terminally ill

LICENSE=	Freeware
LICENSE_NAME=	Narcissu and Narcissu 2 License (from English README)
LICENSE_TEXT=	Permission has been granted to anyone to redistribute \
		these games by means such as the Internet, provided such \
		distribution is free of charge and the contents of the \
		game data are not modified.
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

RUN_DEPENDS=	onscripter:games/onscripter

USES=		uniquefiles:dirs
NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	ons_wrapper
PORTDATA=	*
PLIST_FILES=	bin/${PKGBASE} \
		share/icons/hicolor/48x48/apps/${PKGBASE}.png

DESKTOP_ENTRIES="Narcissu & Narcissu: Side 2nd" \
		"" \
		"${PKGBASE}" \
		"${PKGBASE}" \
		"Game;AdventureGame;" \
		""

post-extract:
	@(cd ${WRKSRC} && ${RM} -f *.exe *.dll *.txt)

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/ons_wrapper \
		${STAGEDIR}${PREFIX}/bin/${PKGBASE}
	${MKDIR} ${STAGEDIR}${PREFIX}/share/icons/hicolor/48x48/apps
	${INSTALL_DATA} ${_DISTDIR}/${DISTFILES:M*\:icon:C/:.*//:Q} \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/48x48/apps/${PKGBASE}.png
	(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR})

.include <bsd.port.mk>
