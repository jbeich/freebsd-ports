PORTNAME=	greetd
DISTVERSION=	0.7.0
CATEGORIES=	sysutils
MASTER_SITES=	https://git.sr.ht/~kennylevinsen/${PORTNAME}/archive/${DISTVERSIONFULL}${EXTRACT_SUFX}?dummy=/
# XXX Teach USES=cargo to not override default DISTFILES
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	jbeich@FreeBSD.org
COMMENT=	Login manager daemon

LICENSE=	GPLv3

USES=		cargo
CARGO_CRATES=	arc-swap-0.4.6 \
		async-trait-0.1.31 \
		bitflags-1.2.1 \
		bytes-0.5.4 \
		cc-1.0.53 \
		cfg-if-0.1.10 \
		enquote-1.0.3 \
		fnv-1.0.7 \
		fuchsia-zircon-0.3.3 \
		fuchsia-zircon-sys-0.3.3 \
		getopts-0.2.21 \
		iovec-0.1.4 \
		itoa-0.4.5 \
		kernel32-sys-0.2.2 \
		lazy_static-1.4.0 \
		libc-0.2.70 \
		log-0.4.8 \
		memchr-2.3.3 \
		mio-0.6.22 \
		mio-named-pipes-0.1.6 \
		mio-uds-0.6.8 \
		miow-0.2.1 \
		miow-0.3.3 \
		net2-0.2.34 \
		nix-0.17.0 \
		pam-sys-0.5.6 \
		pin-project-lite-0.1.5 \
		proc-macro2-1.0.12 \
		quote-1.0.5 \
		redox_syscall-0.1.56 \
		rpassword-4.0.5 \
		ryu-1.0.4 \
		serde-1.0.110 \
		serde_derive-1.0.110 \
		serde_json-1.0.53 \
		signal-hook-registry-1.2.0 \
		slab-0.4.2 \
		socket2-0.3.12 \
		syn-1.0.21 \
		thiserror-1.0.17 \
		thiserror-impl-1.0.17 \
		tokio-0.2.11 \
		tokio-macros-0.2.4 \
		unicode-width-0.1.7 \
		unicode-xid-0.2.0 \
		users-0.9.1 \
		void-1.0.2 \
		winapi-0.2.8 \
		winapi-0.3.8 \
		winapi-build-0.1.1 \
		winapi-i686-pc-windows-gnu-0.4.0 \
		winapi-x86_64-pc-windows-gnu-0.4.0 \
		ws2_32-sys-0.2.1
PLIST_FILES=	bin/agreety \
		bin/fakegreet \
		bin/${PORTNAME} \
		"@sample ${ETCDIR}/config.toml.sample"

USERS=		greeter
GROUPS=		greeter

OPTIONS_DEFINE=	MANPAGES
OPTIONS_DEFAULT=MANPAGES

MANPAGES_BUILD_DEPENDS=	scdoc:textproc/scdoc
MANPAGES_PLIST_FILES=	share/man/man1/agreety.1.gz \
			share/man/man1/${PORTNAME}.1.gz \
			share/man/man5/${PORTNAME}.5.gz \
			share/man/man7/${PORTNAME}-ipc.7.gz

post-patch:
# Respect PREFIX when reading config or PAM
	@${REINPLACE_CMD} -e '/${PORTNAME}/s,/etc,${PREFIX}&,' \
		${WRKSRC}/greetd/src/config/mod.rs \
		${WRKSRC}/greetd/src/server.rs \
		${WRKSRC}/man/greetd-1.scd
# Limit to virtual/video terminals backed by syscons(4) or vt(4)
	@${REINPLACE_CMD} -e 's,/dev/tty,&v,' \
		${WRKSRC}/greetd/src/server.rs
# hier(7) doesn't define /run, so use /var/run
	@${REINPLACE_CMD} -e 's,/run,/var&,' \
		${WRKSRC}/greetd/src/server.rs

post-build-MANPAGES-on:
	@(cd ${WRKSRC}/man && for f in *.scd; do ext=$${f##*-}; ext=$${ext%*.scd}; \
		scdoc <$$f >$${f%-[0-9].scd}.$$ext; done)

do-install:
# XXX https://github.com/rust-lang/cargo/issues/4101
	@${FIND} ${CARGO_TARGET_DIR} -perm 755 -depth 2 -type f | ${XARGS} -tI% \
		${INSTALL_PROGRAM} % ${STAGEDIR}${PREFIX}/bin
	${MKDIR} ${STAGEDIR}${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/config.toml ${STAGEDIR}${ETCDIR}/config.toml.sample

do-install-MANPAGES-on:
.for i in 1 5 7
	${INSTALL_MAN} ${WRKSRC}/man/*.$i ${STAGEDIR}${PREFIX}/share/man/man$i
.endfor

.include <bsd.port.mk>
