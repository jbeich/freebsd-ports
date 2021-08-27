DISTVERSION=	0.1.0-257
DISTVERSIONSUFFIX=	-g917ef4b
PORTREVISION=	0
PKGNAMESUFFIX=	-devel

MASTERDIR=	${.CURDIR}/../zls
DISTINFO_FILE=	${.CURDIR}/distinfo

BUILD_DEPENDS=	zig-devel>=g20210824:lang/zig-devel
RUN_DEPENDS=	zig:lang/zig-devel

GH_TUPLE=	ziglibs:known-folders:0.7.0-7-g3385a8b:known_folders/src/known-folders \
		ziglibs:zinput:0.1.0-16-g95106b1:zinput/src/zinput

.include "${MASTERDIR}/Makefile"
