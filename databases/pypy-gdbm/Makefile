# Created by: David Naylor <dbn@FreeBSD.org>
# $FreeBSD$

PORTNAME=	gdbm
PORTVERSION=	${PYTHON_PORTVERSION}
CATEGORIES=	databases python

MAINTAINER=	dbn@FreeBSD.org
COMMENT=	PyPy bindings to the GNU dbm library

LIB_DEPENDS=	libgdbm.so:${PORTSDIR}/databases/gdbm

CFFI_NAME=	ffi

.include "${.CURDIR}/../../lang/pypy/bsd.pypy.cffi.mk"
.include <bsd.port.mk>
