#!/bin/sh
#
# An rc.subr-style startup script for courier-authdaemond service.

# PROVIDE: sqwebmaild
# REQUIRE: LOGIN sqwebmaild
# KEYWORD: FreeBSD shutdown

# Define these sqwebmaild_* variables in one of these files:
# 	/etc/rc.conf
# 	/etc/rc.conf.local
# 	/etc/rc.conf.d/sqwebmaild
#
# DO NOT CHANGE THESE DEFAULT VALUES HERE

sqwebmaild_enable=${sqwebmaild_enable-"NO"}

. %%RC_SUBR%%

name="sqwebmaild"
rcvar=`set_rcvar`
command="%%PREFIX%%/libexec/sqwebmaild.rc"

start_cmd="sqwebmaild_cmd start"
stop_cmd="sqwebmaild_cmd stop"
restart_cmd="sqwebmaild_cmd stop && sqwebmaild_cmd start"
pidfile="%%PREFIX%%/var/sqwebmail/run/sqwebmaild.pid"
procname="%%PREFIX%%/sbin/courierlogger"

load_rc_config $name

sqwebmaild_cmd () {
	case $1 in
	start)
		echo "Starting ${name}."
		${command} start
		;;
	stop)
		echo "Stopping ${name}."
		${command} stop
		if [ $? -eq 0 ] ; then
			for file in "$pidfile" "$pidfile".lock "$pidfile".pcp.lock %%PREFIX%%/var/sqwebmail/sqwebmail.sock ; do
				[ -f "$file" -o -S "$file" ] && rm -f "$file"
			done
			return 0
		fi
		;;
	esac
}

run_rc_command "$1"

