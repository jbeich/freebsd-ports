# Created by: Kai Wang <kaiwang27@gmail.com>
# $FreeBSD$

PORTNAME=	frobtads
PORTVERSION=	1.2.2
PORTREVISION=	1
CATEGORIES=	games lang
MASTER_SITES=	http://www.tads.org/${PORTNAME}/ \
		http://www.ifarchive.org/if-archive/programming/tads3/source/

MAINTAINER=	kaiwang27@gmail.com
COMMENT=	TADS interpreter and the compilers for both TADS 2 and 3

LIB_DEPENDS=	libcurl.so:${PORTSDIR}/ftp/curl \
		libexecinfo.so:${PORTSDIR}/devel/libexecinfo

CONFLICTS=	tads-2.*

USES=		autoreconf gmake
GNU_CONFIGURE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib -lcompat

.include <bsd.port.mk>
