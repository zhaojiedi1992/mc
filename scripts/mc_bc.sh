#!/bin/bash
# chkconfig: 2345 20 80
. /etc/init.d/functions

base_dir=/mc/bc
start() {
	cd $base_dir
	nohup java -Xms512M -Xmx1G -jar BungeeCord.jar & 
}

stop() {
	cd $base_dir
	ps aux |grep BungeeCord.jar |grep -v grep  |awk '{print $2}' |while read pid ; do
		kill -9 $pid
	done
}

case "$1" in 
    start)
       start
       ;;
    stop)
       stop
       ;;
    restart)
       stop
       start
       ;;
    status)
       # code to check status of app comes here 
       # example: status program_name
       ;;
    *)
       echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0 
