PORTNAME=	inotify_simple
PORTVERSION=	1.3.5
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	jbeich@FreeBSD.org
COMMENT=	Simple wrapper around inotify using ctypes

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libinotify.so:devel/libinotify

USES=		python:3.4+
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

post-patch:
# INotify() -> AttributeError: Undefined symbol "inotify_init1"
	@${REINPLACE_CMD} -e "s/'c'/'inotify'/" \
		-e  "s/ or 'libc.so.6'//" \
		${WRKSRC}/inotify_simple.py

.include <bsd.port.mk>
