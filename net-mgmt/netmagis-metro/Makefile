# Created by: Pierre David <pdagog@gmail.com>, Jean Benoit <jean@unistra.fr>
# $FreeBSD$

PORTNAME=	netmagis
PORTREVISION=	1
PKGNAMESUFFIX=	-metro

COMMENT=	Netmagis metrology module

RUN_DEPENDS+=	netmagis-config:${PORTSDIR}/net-mgmt/netmagis-common \
		p5-DBD-Pg>0:${PORTSDIR}/databases/p5-DBD-Pg \
		p5-Net-SNMP>=0:${PORTSDIR}/net-mgmt/p5-Net-SNMP \
		p5-SNMP_Session>=0:${PORTSDIR}/net-mgmt/p5-SNMP_Session \
		p5-RRDTool-OO>=0:${PORTSDIR}/devel/p5-RRDTool-OO

USES=		perl5 shebangfix
SHEBANG_FILES=	metro/bin/metrocreatedb metro/bin/metropoller metro/bin/metropoller-run \
		metro/lib/plugins/plugin-ipmac metro/lib/plugins/plugin-portmac \
		metro/ws/gengraph

MASTERDIR=	${.CURDIR}/../netmagis-common

NO_ARCH=	yes

PKGMESSAGE=	${.CURDIR}/pkg-message
PLIST=		${.CURDIR}/pkg-plist

.include "${MASTERDIR}/Makefile"
