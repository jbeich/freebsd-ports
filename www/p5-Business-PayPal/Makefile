# Created by: Steven Kreuzer
# $FreeBSD$

PORTNAME=	Business-PayPal
PORTVERSION=	0.11
PORTREVISION=	2
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	skreuzer@FreeBSD.org
COMMENT=	Perl extension for automating PayPal transactions

RUN_DEPENDS=	p5-Net-SSLeay>=1.35:${PORTSDIR}/security/p5-Net-SSLeay \
		p5-CGI>=3.49:${PORTSDIR}/www/p5-CGI \
		p5-Digest-MD5>=2.52:${PORTSDIR}/security/p5-Digest-MD5
BUILD_DEPENDS:=	${RUN_DEPENDS}

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
