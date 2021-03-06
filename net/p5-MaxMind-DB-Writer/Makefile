# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	MaxMind-DB-Writer
PORTVERSION=	0.100004
PORTREVISION=	1
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MAXMIND
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Create MaxMind DB database files

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Data-Dumper-Concise>=0:${PORTSDIR}/devel/p5-Data-Dumper-Concise \
		p5-Data-IEEE754>=0:${PORTSDIR}/devel/p5-Data-IEEE754 \
		p5-Digest-SHA1>=0:${PORTSDIR}/security/p5-Digest-SHA1 \
		p5-Math-Int128>=0.21:${PORTSDIR}/math/p5-Math-Int128 \
		p5-Math-Int64>=0.51:${PORTSDIR}/math/p5-Math-Int64 \
		p5-MaxMind-DB-Common>=0.031003:${PORTSDIR}/net/p5-MaxMind-DB-Common \
		p5-MaxMind-DB-Reader>=0:${PORTSDIR}/net/p5-MaxMind-DB-Reader \
		p5-Moose>=0:${PORTSDIR}/devel/p5-Moose \
		p5-MooseX-Params-Validate>=0:${PORTSDIR}/devel/p5-MooseX-Params-Validate \
		p5-MooseX-StrictConstructor>=0:${PORTSDIR}/devel/p5-MooseX-StrictConstructor \
		p5-Net-Works>=0.20:${PORTSDIR}/net/p5-Net-Works \
		p5-Sereal-Decoder>=0:${PORTSDIR}/converters/p5-Sereal-Decoder \
		p5-Sereal-Encoder>=3.002:${PORTSDIR}/converters/p5-Sereal-Encoder \
		p5-Test-Deep>=0:${PORTSDIR}/devel/p5-Test-Deep \
		p5-namespace-autoclean>=0:${PORTSDIR}/devel/p5-namespace-autoclean
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Data-Printer>=0:${PORTSDIR}/devel/p5-Data-Printer \
		p5-Devel-Refcount>=0:${PORTSDIR}/devel/p5-Devel-Refcount \
		p5-List-AllUtils>=0:${PORTSDIR}/devel/p5-List-AllUtils \
		p5-Test-Bits>=0:${PORTSDIR}/devel/p5-Test-Bits \
		p5-Test-Fatal>=0:${PORTSDIR}/devel/p5-Test-Fatal \
		p5-Test-Requires>=0:${PORTSDIR}/devel/p5-Test-Requires

USE_PERL5=	modbuild
USES=		perl5

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/MaxMind/DB/Writer/Tree/Tree.so

.include <bsd.port.mk>
