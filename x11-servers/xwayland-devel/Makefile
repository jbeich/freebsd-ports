DISTVERSIONPREFIX=	xorg-server-
DISTVERSION=	1.20.0-917
DISTVERSIONSUFFIX=	-ga50a0e348
PORTEPOCH=	0
PKGNAMESUFFIX=	-devel

MASTERDIR=	${.CURDIR}/../xwayland
DISTINFO_FILE=	${.CURDIR}/distinfo

MESON_ARGS=	-D${PORTNAME}=true \
		-Dxorg=false \
		-Dxnest=false \
		-Dxvfb=false \
		-Dudev=false \
		-Dudev_kms=false \
		${NULL}

.include "${MASTERDIR}/Makefile"
