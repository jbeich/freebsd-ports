# Created by: Yen-Ming Lee <leeym@leeym.com>
# $FreeBSD$

PORTNAME=	openwebmail
PORTVERSION=	2.53
PORTREVISION=	2
CATEGORIES=	mail
MASTER_SITES=	http://openwebmail.acatysmoof.com/download/release/ \
		http://openwebmail.org/openwebmail/download/release/

MAINTAINER=	crees@FreeBSD.org
COMMENT=	Webmail system designed to manage big mail folder files efficiently

RUN_DEPENDS=	p5-Text-Iconv>=0:${PORTSDIR}/converters/p5-Text-Iconv

USES=		perl5
USE_PERL5=	run build patch
NO_BUILD=	yes
NO_WRKSUBDIR=	yes
OWCGIDIR=	${PREFIX}/www/cgi-bin/openwebmail
OWDATADIR=	${PREFIX}/www/data/openwebmail
PATCH_WRKSRC=	${WRKSRC}/cgi-bin/openwebmail
PATCH_STRIP=	-p1
PLIST=		${WRKDIR}/.PLIST.${PKGNAME}
SUB_FILES=	pkg-install

OPTIONS_DEFINE=	ANTIWORD MAGICK ISPELL LEARNSPAM LSOF PAM POP3_OVER_SSL QUOTA \
		SPAMCHECK SPAMCHECK_ALL SPEEDYCGI TNEF VIRUSCHECK VIRUSCHECK_ALL \
		WGET

ANTIWORD_DESC=	AntiWord
ISPELL_DESC=	ISpell
LEARNSPAM_DESC=	Learn HAM/SPAM
LSOF_DESC=	lsof
PAM_DESC=	PAM
POP3_OVER_SSL_DESC=	POP3 Over SSL
QUOTA_DESC=	Quota
SPAMCHECK_DESC=	Spam check (Mail::SpamAssassin)
SPAMCHECK_ALL_DESC=	Spam check for all (default: pop3)
SPEEDYCGI_DESC=	SpeedyCGI
TNEF_DESC=	tnef
VIRUSCHECK_DESC=	Virus check (Clam AntiVirus)
VIRUSCHECK_ALL_DESC=	Virus check for all (default: pop3)
WGET_DESC=	wget

.include <bsd.port.pre.mk>

# WITH_SPEEDYCGI needs suidperl enabled under perl 5.8.4 or above,
# so, disable it first, and enable it again if perl exists and enabled suidperl
.if ${PORT_OPTIONS:MSPEEDYCGI}
DISABLE_SPEEDYCGI=yes
PORT_OPTIONS:=	${PORT_OPTIONS:NSPEEDYCGI}
.if exists(${PERL})
PERL_V!=	${PERL} -V
.if ${PERL_V:M*dosuid*} != ""
.undef DISABLE_SPEEDYCGI
.endif # dosuid
.endif # exists(${PERL})
.endif # SPEEDYCGI

.if ${PORT_OPTIONS:MLEARNSPAM} || !empty(PORT_OPTIONS:MSPAMCHECK_ALL)
PORT_OPTIONS+=	SPAMCHECK
.endif

.if ${PORT_OPTIONS:MVIRUSCHECK_ALL}
PORT_OPTIONS+=	VIRUSCHECK
.endif

.if ${PORT_OPTIONS:MANTIWORD}
RUN_DEPENDS+=	antiword:${PORTSDIR}/textproc/antiword
.endif

.if ${PORT_OPTIONS:MMAGICK}
RUN_DEPENDS+=	convert:${PORTSDIR}/graphics/ImageMagick
.endif

.if ${PORT_OPTIONS:MISPELL}
RUN_DEPENDS+=	ispell:${PORTSDIR}/textproc/aspell-ispell
.endif

.if ${PORT_OPTIONS:MLSOF}
RUN_DEPENDS+	${LOCALBASE}/sbin/lsof:${PORTSDIR}/sysutils/lsof
.endif

.if ${PORT_OPTIONS:MPAM}
RUN_DEPENDS+=	p5-Authen-PAM>=0:${PORTSDIR}/security/p5-Authen-PAM
.endif

.if ${PORT_OPTIONS:MPOP3_OVER_SSL}
RUN_DEPENDS+=	p5-IO-Socket-SSL>=0:${PORTSDIR}/security/p5-IO-Socket-SSL
.endif

.if ${PORT_OPTIONS:MQUOTA}
RUN_DEPENDS+=	p5-Quota>=0:${PORTSDIR}/sysutils/p5-Quota
.endif

.if ${PORT_OPTIONS:MTNEF}
RUN_DEPENDS+=	${LOCALBASE}/bin/tnef:${PORTSDIR}/converters/tnef
.endif

.if ${PORT_OPTIONS:MSPAMCHECK}
RUN_DEPENDS+=	spamassassin>=0:${PORTSDIR}/mail/spamassassin
.endif

.if ${PORT_OPTIONS:MSPEEDYCGI}
RUN_DEPENDS+=	speedy_suidperl:${PORTSDIR}/www/p5-CGI-SpeedyCGI
SUB_LIST+=	WITHOUT_SPEEDYCGI="@comment "
EXTRA_PATCHES+=	${PATCH_WRKSRC}/misc/patches/suidperl2speedy_suidperl.notmp.patch
.else
SUB_LIST+=	WITHOUT_SPEEDYCGI=""
.endif

.if ${PORT_OPTIONS:MVIRUSCHECK}
RUN_DEPENDS+=	clamdscan:${PORTSDIR}/security/clamav
.endif

.if ${PORT_OPTIONS:MWGET}
RUN_DEPENDS+=	${LOCALBASE}/bin/wget:${PORTSDIR}/ftp/wget
.endif

post-extract:
.for x in addressbooks/global calendar.book
	@${RM} ${WRKSRC}/cgi-bin/openwebmail/etc/${x}
.endfor

post-patch:
#	### XXX: Hack, some of this should be LOCALBASE
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${REINPLACE_CMD} -e 's,/usr/local,${PREFIX},g'
.if defined(DISABLE_SPEEDYCGI)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "WARNING:"
	@${ECHO_MSG} "Your perl doesn't support SUID, or you don't have perl yet,"
	@${ECHO_MSG} "so SpeedyCGI support is disabled automatically."
	@${ECHO_MSG} "If you want SpeedyCGI support, please reinstall perl with ENABLE_SUIDPERL=yes,"
	@${ECHO_MSG} "and reinstall ${PORTNAME}."
	@${ECHO_MSG} ""
.endif
	@${MV} ${PATCH_WRKSRC}/etc/openwebmail.conf ${PATCH_WRKSRC}/etc/openwebmail.conf.sample
	@${PERL} -pi.bak -e 's,${LOCALBASE}/www/cgi-bin/openwebmail,${OWCGIDIR},g' ${PATCH_WRKSRC}/etc/openwebmail.conf.sample
	@${PERL} -pi.bak -e 's,${LOCALBASE}/www/data/openwebmail,${OWDATADIR},g' ${PATCH_WRKSRC}/etc/openwebmail.conf.sample
.if ${PORT_OPTIONS:MLEARNSPAM}
	@${PERL} -pi.bak -e 's,enable_learnspam	no,enable_learnspam	yes,g' ${PATCH_WRKSRC}/etc/openwebmail.conf.sample
.endif
.if ${PORT_OPTIONS:MSPAMCHECK}
	@${PERL} -pi.bak -e 's,enable_spamcheck	no,enable_spamcheck	yes,g' ${PATCH_WRKSRC}/etc/openwebmail.conf.sample
	@${ECHO} "enable_saprefs	yes" >> ${PATCH_WRKSRC}/etc/openwebmail.conf.sample
.endif
.if ${PORT_OPTIONS:MSPAMCHECK_ALL}
	@${ECHO} "spamcheck_source_allowed	all" >> ${PATCH_WRKSRC}/etc/openwebmail.conf.sample
.endif
.if ${PORT_OPTIONS:MVIRUSCHECK}
	@${PERL} -pi.bak -e 's,enable_viruscheck	no,enable_viruscheck	yes,g' ${PATCH_WRKSRC}/etc/openwebmail.conf.sample
.endif
.if ${PORT_OPTIONS:MVIRUSCHECK_ALL}
	@${ECHO} "viruscheck_source_allowed	all" >> ${PATCH_WRKSRC}/etc/openwebmail.conf.sample
.endif
.if ${PORT_OPTIONS:MSPEEDYCGI}
	@${ECHO} "has_savedsuid_support	no" >> ${PATCH_WRKSRC}/etc/openwebmail.conf.sample
.else
	@${PERL} -pi.bak -e 's,/usr/bin/suidperl,${PERL},g' ${PATCH_WRKSRC}/openwebmail*pl
.endif

pre-install:
	@: > ${PLIST}
	@${FIND} ${WRKSRC}/*/openwebmail \( -name "*.bak" -or -name "*.orig" \) -delete
	@${PRINTF} "%s\n%s\n" "@owner ${BINOWN}" "@group mail" >> ${PLIST}
	@${ECHO} "@sample www/cgi-bin/openwebmail/etc/openwebmail.conf.sample" >> ${PLIST}
	@${FIND} ${WRKSRC}/cgi-bin/openwebmail \( -type f -o -type l \) -and -not -name openwebmail.conf.sample | \
		${SED} -e 's,^${WRKSRC},www,' | ${SORT} -u >> ${PLIST}
	@${ECHO} "www/cgi-bin/openwebmail/etc/dbm.conf" >> ${PLIST}
	@${PRINTF} "%s\n%s\n" "@owner" "@group" >> ${PLIST}
	@${FIND} ${WRKSRC}/data/openwebmail \( -type f -o -type l \) -and -not -name openwebmail.conf.sample | \
		${SED} -e 's,^${WRKSRC},www,' | ${SORT} -u >> ${PLIST}
.if empty(PORT_OPTIONS:MSPEEDYCGI)
	@${FIND} ${WRKSRC}/*/openwebmail -name "openwebmail*pl" | \
		${SED} -e 's,^${WRKSRC},www,' \
		-e 's,openwebmail/openwebmail,openwebmail/.openwebmail,g' \
		>> ${TMPPLIST}
.endif
	@${FIND} ${WRKSRC}/*/openwebmail -type d | ${SORT} -ur | \
		${GREP} -v UTF-8 | \
		${SED} -e 's,^${WRKSRC},@dirrm www,' >> ${PLIST}
	@${FIND} ${WRKSRC}/*/openwebmail -type d | ${SORT} -ur | \
		${GREP} UTF-8 | \
		${SED} -e 's,^${WRKSRC},@dirrmtry www,' >> ${PLIST}
	@${ECHO_CMD} "@dirrmtry www/cgi-bin" >> ${PLIST}
	@${ECHO_CMD} "@dirrmtry www/data" >> ${PLIST}

do-install:
	@${MKDIR} ${STAGEDIR}${OWCGIDIR} ${STAGEDIR}${OWDATADIR}
	@(cd ${WRKSRC}/cgi-bin/openwebmail && \
		${COPYTREE_SHARE} . ${STAGEDIR}${OWCGIDIR})
	@(cd ${WRKSRC}/data/openwebmail && \
		${COPYTREE_SHARE} . ${STAGEDIR}${OWDATADIR})
	@${PERL} ${STAGEDIR}${OWCGIDIR}/misc/test/dbmtest.pl | ${GREP} "^dbm" > ${STAGEDIR}${OWCGIDIR}/etc/dbm.conf
	@${CHMOD} 4755 ${STAGEDIR}${OWCGIDIR}/openwebmail*pl

.include <bsd.port.post.mk>
