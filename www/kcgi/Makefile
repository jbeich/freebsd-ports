# $FreeBSD$

PORTNAME=	kcgi
PORTVERSION=	0.7.2
CATEGORIES=	www devel
MASTER_SITES=	http://kristaps.bsd.lv/kcgi/snapshots/

MAINTAINER=	bapt@FreeBSD.org
COMMENT=	Minimal sandboxed CGI library in C

LICENSE=	ISCL

USES=		tar:tgz

OPTIONS_DEFINE=	EXAMPLES

HAS_CONFIGURE=	yes
MAKE_ARGS=	DATADIR=${EXAMPLESDIR}

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/kfcgi ${STAGEDIR}${PREFIX}/sbin/kfcgi

.include <bsd.port.mk>
